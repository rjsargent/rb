initialize-release
initialize
	super initialize.
	keywords := IdentitySet new.
	condition := [ :pragma | true ]