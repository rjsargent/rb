visitor-dispatching
acceptBlockNode: aNode
	self scope: aNode with: RBBlockScope during: [ super acceptBlockNode: aNode ]