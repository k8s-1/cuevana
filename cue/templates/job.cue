package templates

#Job: {
	nginx: replicas:  2
	manager: command: "monit -i"
}

#Job: [Name=_]: {
	name:     Name // Name is an alias.
	command:  string | *"exec \(Name)"
	replicas: uint | *1
}

#Testjob: "123"
