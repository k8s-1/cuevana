@if(dev) // if -t <TAG>, import this file
package values

env: {
  image: "dev-v10.10.2"
  replicas: 10
}
