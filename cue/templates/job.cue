package templates

#Job: {
  test: {}
}

#Job: [Name=_]: {
	name:     Name // Name is an alias.
	command:  string | *"exec \(Name)"
	replicas: uint | *1
}
