private
formatClass: aClass selector: aSymbol
	self formatters
		do: [ :each | self formatClass: aClass selector: aSymbol formatter: each ]