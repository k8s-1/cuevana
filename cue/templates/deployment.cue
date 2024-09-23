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
    replicas: 1
    selector: matchLabels: app: "app1"
    template: {
      metadata: {
        creationTimestamp: null
        labels: app: "app1"
      }
      spec: containers: [{
        image: "app1:v0.0.1"
        name:  "app1"
        resources: {}
      }]
    }
  }
}
