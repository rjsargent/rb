private-formatting
isMultiLineMessage: aMessageNode
	| messageStream |
	(MultiLineMessages includes: aMessageNode selector)
		ifTrue: [ ^ true ].
	(OneLineMessages includes: aMessageNode selector)
		ifTrue: [ ^ false ].
	(NumberOfArgumentsForMultiLine <= aMessageNode arguments size)
		ifTrue: [ ^ true ].
	(aMessageNode arguments 
		anySatisfy: [ :each | self indent: IndentsForKeywords + 1 around: [ self willBeMultiline: each ] ]) 
		ifTrue: [ ^ true ].
	aMessageNode isUnary
		ifTrue: [ ^ self isLineTooLong: aMessageNode selector ].
	messageStream := AnsiWriteStream on: String new.
	self  with: aMessageNode selectorParts and: aMessageNode arguments 
		do: [ :sel :arg | messageStream nextPutAll: sel value; space; nextPutAll: (self formattedSourceFor: arg) ]
		separatedBy: [ messageStream space ].
	^ self isLineTooLong: messageStream contents