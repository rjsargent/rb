visiting
visitNode: aNode
  | parenthesis |
  parenthesis := self needsParenthesisFor: aNode.
  parenthesis
    ifTrue: [ codeStream nextPut: $( ].
  aNode acceptVisitor: self.
  parenthesis
    ifTrue: [ codeStream nextPut: $) ]