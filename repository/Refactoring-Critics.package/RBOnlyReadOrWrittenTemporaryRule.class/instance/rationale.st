accessing
rationale
	^ 'Checks that all temporary variables are both read and written. If an temporary variable is only read, you can replace all of the reads with nil, since it couldn''t have been assigned a value. If the variable is only written, then we don''t need to store the result since we never use it.'