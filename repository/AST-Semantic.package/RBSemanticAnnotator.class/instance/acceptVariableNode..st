visitor-dispatching
acceptVariableNode: aNode
	| binding |
	binding := scope
		lookup: aNode name
		ifAbsent: [ self undeclaredVariable: aNode ].
	aNode propertyAt: #variableBinding put: binding.
	binding addAccessor: aNode.
	aNode isUsed
		ifTrue: [ binding addReader: aNode ].
	aNode isWrite
		ifTrue: [ binding addWriter: aNode ]