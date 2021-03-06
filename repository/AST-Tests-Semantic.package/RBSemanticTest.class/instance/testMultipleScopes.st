testing-fixtures
testMultipleScopes
	| tree block1 variable1 block2 variable2 |
	tree := self parseExpression: '[ :a | a ]. [ | a | a ]'.
	block1 := tree statements first.
	variable1 := block1 arguments first.
	block2 := tree statements last.
	variable2 := block2 body temporaries first.
	
	self deny: variable1 variableBinding = variable2 variableBinding.
	self assert: variable1 variableBinding = block1 body statements first variableBinding.
	
	self deny: variable2 variableBinding = variable1 variableBinding.
	self assert: variable2 variableBinding = block2 body statements first variableBinding.
	
	self assert: variable1 variableBinding scope = block1 lexicalScope.
	self assert: variable2 variableBinding scope = block2 lexicalScope