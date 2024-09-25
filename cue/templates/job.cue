package templates

job: {
	nginx: replicas:  2
	manager: command: "monit -I"
	policyd: _
	boltdb: replicas:   3
	postgres: replicas: 5
}

job: [Name=_]: {
	name:     Name // Name is an alias.
	command:  string | *"exec \(Name)"
	replicas: uint | *1
}
