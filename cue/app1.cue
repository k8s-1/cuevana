import (
	// import from this module
	"github.com/k8s-1/cuevana/templates"
)

configs: [
  templates.#Deployment,
  templates.#Kustomization
]
