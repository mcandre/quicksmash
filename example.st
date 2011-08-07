"exec" "gst" "-f" "$0" "$0" "$@"
"exit"

PackageLoader fileInPackage: 'QuickSmash'.

| genNum genEven propEven propReversible |

"Answer a random number."
genNum := [ QuickSmash genInteger: -100 upTo: 100. ].

"Answer a random even number."
genEven := [
	| i |

	i := genNum value.

	(i odd) ifTrue: [ i := i + 1. ].

	i.
].

"Answer true if number is even, false otherwise."
propEven := [ :x | x even. ].

"Test even property over even numbers."
QuickSmash testProperty: propEven withGenerators: { genEven }.

"Test even property over regular numbers."
QuickSmash testProperty: propEven withGenerators: { genNum }.

"Answer true if string = reverse(reverse(string)), false otherwise."
propReversible := [ :s | s = (s reverse) reverse].

"Test reversible property over random strings."
QuickSmash testProperty: propReversible withGenerators: { [ QuickSmash genString. ] }.