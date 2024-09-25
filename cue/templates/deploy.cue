package deploy

deployment: [ID=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		creationTimestamp: null
		labels: app: "myapp"
		name: "myapp"
	}
	spec: {
		replicas: 1
		selector: matchLabels: app: "myapp"
		strategy: {}
		template: {
			metadata: {
				creationTimestamp: null
				labels: app: "myapp"
			}
			spec: containers: [{
				image: "nginx"
				name:  "nginx"
				resources: {}
			}]
		}
	}
	status: {}
}
