private-parsing
parseBinaryMessageWith: aNode 
	| binaryToken |
	binaryToken := currentToken.
	self step.
	^self messageNodeClass 
		receiver: aNode
		selectorParts: (Array with: binaryToken)
		arguments: (Array with: self parseUnaryMessage)