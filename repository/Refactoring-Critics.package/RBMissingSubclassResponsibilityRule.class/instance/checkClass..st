running
checkClass: aContext 
	| subs |
	subs := aContext selectedClass subclasses.
	(subs size > 1 and: [ aContext selectedClass isMeta not ]) ifTrue: 
		[ | sels |
		sels := Bag new.
		subs do: [ :each | sels addAll: each selectors ].
		sels asSet do: 
			[ :each | 
			((sels occurrencesOf: each) == subs size and: [ (aContext selectedClass canUnderstand: each) not ]) ifTrue: 
				[ | envName |
				envName := aContext selectedClass name , '>>' , each.
				subs do: 
					[ :subClass | 
					result 
						addClass: subClass
						selector: each
						into: envName ] ] ] ]