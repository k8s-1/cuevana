package templates

import (
	"github.com/k8s-1/cuevana/values"
)

#Deployment: {
    apiVersion: "apps/v1"
    kind:       "Deployment"
    metadata: {
        name: "my-app"
    }
    spec: {
        replicas: values.env.replicas | *1
        containers: [{
            image: values.env.image
            name:  "my-app"
        }]
    }
}

Deployment: #Deployment
