tests
testPrimitives
  self assert: (Object parseTreeFor: #'_basicAt:') isPrimitive.
  #(#('foo ^true' false) #('foo <some: tag> ^true' false) #(' foo <some: tag> <primitive: 123> ^true' true))
    do: [ :each | self assert: (RBParser parseMethod: each first) isPrimitive = each last ]