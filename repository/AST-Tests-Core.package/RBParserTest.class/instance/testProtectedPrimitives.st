tests
testProtectedPrimitives
  self assert: (Object parseTreeFor: #'_changeClassTo:') isPrimitive.
  #(#('foo ^true' false) #('foo <some: tag> ^true' false) #(' foo <some: tag> <protected primitive: 123> ^true' true))
    do: [ :each | self assert: (RBParser parseMethod: each first) isPrimitive = each last ]