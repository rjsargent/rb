running
checkClass: aContext 
	| count |
	count := 0.
	((Set withAll: (aContext selectedClass whichSelectorsReferTo: #addDependent:))
		addAll: (aContext selectedClass whichSelectorsReferTo: #removeDependent:);
		yourself) do: 
		[ :sel | 
		(aContext selectedClass compiledMethodAt: sel) messagesDo: 
			[ :each | 
			each = #addDependent: ifTrue: [ count := count + 1 ].
			each = #removeDependent: ifTrue: [ count := count - 1 ] ] ].
	count > 0 ifTrue: [ result addClass: aContext selectedClass ]