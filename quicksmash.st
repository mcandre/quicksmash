Object subclass: QuickSmash [
	| random |

	random := Random new.

	QuickSmash class >> genChar [
		| i c |

		i := random between: 0 and: 255.

		c := i asCharacter.

		^c
	]
]