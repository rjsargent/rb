accessing
numberSelectors
	| total |
	total := 0.
	self 
		allClassesDo: [:each | self selectorsForClass: each do: [:sel | total := total + 1]].
	^total