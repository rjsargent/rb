accessing-classes
classesDo: aBlock 
	self allClassesDo: [ :each |
		(self includesClass: each)
			ifTrue: [ aBlock value: each ] ]