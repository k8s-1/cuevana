package templates

job: {
	nginx: replicas:  2
	manager: command: "monit -I"
}

job: [Name=_]: {
	name:     Name // Name is an alias.
	command:  string | *"exec \(Name)"
	replicas: uint | *1
}
