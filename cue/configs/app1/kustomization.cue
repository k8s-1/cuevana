package app1

import (
	"github.com/k8s-1/cuevana/templates"
)

_#Config: { path: string, value: _ },
objects: [..._#Config]

objects: [
  { path: "deploy.yaml", value: templates.#Deployment },
  { path: "kustomization.yaml", value: templates.#Kustomization },
]
