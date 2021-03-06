accessing-classes
allMetaClasses
	"Answer all the unique non-metaclasses of all metaclasses in this environment."

	| classes |
	classes := IdentitySet new: 4096.
	self classesDo: [ :each | 
		each isMeta
			ifTrue: [ classes add: each theNonMetaClass ] ].
	^ classes asArray