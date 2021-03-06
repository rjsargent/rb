normalization
normalizeCamelCase: aString
	"An ugly long method to get rid of camel case strings."
	
	| input output char |
	input := aString readStream.
	output := WriteStream on: (String new: 2 * aString size).
	[ input atEnd ] whileFalse: [
		output nextPut: (char := input next).
		char isLetter
			ifTrue: [
				[ input atEnd not and: [ input peek isLowercase ] ]
					whileTrue: [ output nextPut: input next ].
				(input atEnd not and: [ input peek isSeparator not ])
					ifTrue: [ output space ] ]
			ifFalse: [
				char isDigit
					ifTrue: [
						[ input atEnd not and: [ input peek isDigit ] ]
							whileTrue: [ output nextPut: input next ].
						(input atEnd not and: [ input peek isSeparator not ])
							ifTrue: [ output space ] ] ] ].
	^ output contents