import (
	// import from this module
	"github.com/k8s-1/cuevana/templates"
)

configs: [
  { path: deploy.yaml, value: templates.#Deployment },
  { path: kustomization.yaml, value: templates.#Kustomization },
]
