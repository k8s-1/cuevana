package deploy

deployment: [ID=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		labels: {
			"app.kubernetes.io/name": ID
		}
		name: ID
	}
	spec: {
		replicas: 1
		selector: matchLabels: "app.kubernetes.io/name": ID
		template: {
			metadata: {
				labels: app: ID
			}
			spec: containers: [{
				image: "nginx"
				name:  "nginx"
			}]
		}
	}
}

deployment: "mydeploy123": {}
