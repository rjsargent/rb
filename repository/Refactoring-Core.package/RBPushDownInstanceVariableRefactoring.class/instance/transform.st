transforming
transform
	class removeInstanceVariable: variableName.
	class subclasses do: 
			[:each | 
			(each withAllSubclasses detect: 
					[:aClass | 
					(aClass whichSelectorsReferToInstanceVariable: variableName) isEmpty not]
				ifNone: [nil]) notNil 
				ifTrue: [each addInstanceVariable: variableName]]