querying
lookup: aString ifAbsent: aBlock
	"Lookup the variable aString in the receiving scope, evaluate aBlock if not found."

	self subclassResponsibility