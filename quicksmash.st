Object subclass: QuickSmash [
	| random |

	random := Random new.

	QuickSmash class >> genChar [
		| c |

		c := $a.

		"..."

		^c
	]
]