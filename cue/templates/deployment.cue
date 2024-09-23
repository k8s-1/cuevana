package templates

import (
	"github.com/k8s-1/cuevana/values"
)

#Deployment: {
  apiVersion: "apps/v1"
  kind:       "Deployment"
  metadata: {
    creationTimestamp: null
    labels: app: "app1"
    name: "app1"
  }
  spec: {
    replicas: int
    selector: matchLabels: app: "app1"
    template: {
      metadata: {
        creationTimestamp: null
        labels: app: "app1"
      }
      spec: containers: [{
        image: string
        name:  "app1"
        resources: {}
      }]
    }
  }
}

Deployment: #Deployment & {
  replicas: values._#env.replicas | *1
  image:    values._#env.image
}
