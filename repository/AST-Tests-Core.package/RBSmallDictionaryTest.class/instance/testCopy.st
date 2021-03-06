testing
testCopy
	| copy |
	dict at: 'France' put: 'Paris'.
	dict at: 'Italie' put: 'Rome'.
	copy := dict copy.
	copy at: 'Germany' put: 'Berlin'.
	dict at: 'Switzerland' put: 'Bern'.
	self assert: copy size = 3.
	self assert: (copy includesKey: 'Germany').
	self deny: (copy includesKey: 'Switzerland').
	self assert: dict size = 3.
	self assert: (dict includesKey: 'Switzerland').
	self deny: (dict includesKey: 'Germany')