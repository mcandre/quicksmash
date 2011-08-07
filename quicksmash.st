Object subclass: QuickSmash [
	| random version |

	random := Random new.

	version := '0.0.1'.

	QuickSmash class >> version [ ^version ]

	"Answers a random integer.
	Thin wrapper around Random."
	QuickSmash class >> genInteger: a upTo: b [
		| i |

		i := random between: a and: b.

		^i
	]

	"Answers a random byte."
	QuickSmash class >> genByte [
		| b |

		b := QuickSmash genInteger: 0 upTo: 255.

		^b
	]

	"Answers a random character."
	QuickSmash class >> genChar [
		| c |

		c := (QuickSmash genInteger: 0 upTo: 127) asCharacter.

		^c
	]

	"Answers an array of random length populated by a generator closure."
	QuickSmash class >> genArray: generator [
		| len lst |

		len := QuickSmash genInteger: 0 upTo: 100.

		lst := 0 to: len collect: [ :i |
			generator value.
		].

		^lst
	]

	"Answers a string of random length."
	QuickSmash class >> genString [
		| s |

		s := (QuickSmash genArray: [ QuickSmash genChar. ]) asString.

		^s
	]

	"Tests property closure with random arguments created by generator closures."
	QuickSmash class >> testProperty: property withGenerators: generators [
		1 to: 100 do: [ :i |
			| args result |

			args := generators collect: [ :g | g value. ].

			result := property valueWithArguments: args.

			result ifFalse: [
				Transcript show: '*** Failed!: '.
				args printNl.

				^false
			].
		].

		Transcript show: '+++ OK, passed 100 tests.'; cr.

		^true
	]
]