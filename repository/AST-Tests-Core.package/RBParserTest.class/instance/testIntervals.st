tests
testIntervals
	| tree |
	tree := self treeWithReallyEverything.
	tree nodesDo: 
			[:each | 
			(each parent isNil or: [each parent isCascade not and: [ each parent isLiteral not]]) 
				ifTrue: 
					[| newNode source |
					source := tree source copyFrom: each start to: each stop.
					each isPragma ifFalse: [
						newNode := each isMethod 
								ifTrue: [RBParser parseMethod: source]
								ifFalse: [RBParser parseExpression: source].
						self compare: each to: newNode]]]