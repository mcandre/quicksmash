Object subclass: QuickSmash [
  | version |

  version := '0.0.1'.

  QuickSmash class >> version [ ^version ]

  QuickSmash class >> genInteger: a upTo: b [
    "Answers a random integer.
    Thin wrapper around SequenceableCollection atRandom."

    ^(a to: b) atRandom.
  ]

  QuickSmash class >> genBool [
    "Answers a random boolean."

    ^(self genInteger: 0 upTo: 1) = 1.
  ]

  QuickSmash class >> genByte [
    "Answers a random byte."

    ^self genInteger: 0 upTo: 255.
  ]

  QuickSmash class >> genChar [
    "Answers a random character."

    ^(self genInteger: 0 upTo: 127) asCharacter.
  ]

  QuickSmash class >> genArray: generator [
    "Answers an array of random length populated by a generator closure."

    ^0 to: (self genInteger: 0 upTo: 100) collect: [ :i |
      generator value.
    ].
  ]

  QuickSmash class >> genString [
    "Answers a string of random length."

    ^(self genArray: [ self genChar. ]) asString.
  ]

  QuickSmash class >> testProperty: property withGenerators: generators [
    "Tests property closure with random arguments created by generator closures."

    1 to: 100 do: [ :i |
      | args |

      args := generators collect: [ :g | g value. ].

      (property valueWithArguments: args) ifFalse: [
        Transcript show: '*** Failed! '.
        args printNl.

        ^false
      ].
    ].

    Transcript show: '+++ OK, passed 100 tests.'; cr.

    ^true
  ]
]
