visitor-dispatching
acceptSequenceNode: aNode
	aNode temporaries
		do: [ :each | scope add: (RBTemporaryBinding node: each) ].
	aNode statements
		do: [ :each | self visitNode: each ]