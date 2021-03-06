testing-bindings
testClassVariableBinding
	| tree binding |
	tree := self parseExpression: 'ClassVar'.
	binding := tree variableBinding.
	
	self deny: binding isArgumentBinding.
	self deny: binding isContextBinding.
	self deny: binding isInstanceBinding.
	self assert: binding isLiteralBinding.
	self deny: binding isSelfBinding.
	self deny: binding isSuperBinding.
	self deny: binding isTemporaryBinding.
	self deny: binding isUndeclaredBinding.
	
	self assert: binding isAccessed.
	self deny: binding accessors isEmpty.	
	self deny: binding isRead.
	self assert: binding readers isEmpty.
	self deny: binding isWritten.
	self assert: binding writers isEmpty.
	self deny: binding isReadonly.
	
	self assert: binding name = 'ClassVar'.
	self assert: binding printString isString.
	self assert: binding binding = (self class bindingOf: 'ClassVar').
	self assert: binding scope notNil