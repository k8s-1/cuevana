import (
	"github.com/k8s-1/cuevana/templates"
)

#Config: { path: string, value: _ },
configs: [...#Config]

configs: [
  { path: "deploy.yaml", value: templates.#Deployment },
  { path: "kustomization.yaml", value: templates.#Kustomization },
]
