testing-environments
testCategoryEnvironment
	| aCategoryEnvironment |
	aCategoryEnvironment := RBCategoryEnvironment 
				onEnvironment: RBBrowserEnvironment new
				categories: #(#'Kernel-Objects').
	self universalTestFor: aCategoryEnvironment.
	self assert: (aCategoryEnvironment implementorsOf: #printString) numberSelectors = 1