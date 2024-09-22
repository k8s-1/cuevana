package templates

// use if guard to get even numbers in a list comprehension
nums: [1, 2, 3, 4, 5, 6, 7, 8]
sqrs: [ for n in nums if mod(n, 2) == 0 {n * n}]

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
  status: {}
}
