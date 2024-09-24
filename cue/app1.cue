package app1

import (
	"github.com/k8s-1/cuevana/templates"
)

//_#Config: { path: string, value: _ },
//configs: [..._#Config]
//
//configs: [
//  { path: "deploy.yaml", value: templates.#Deployment },
//  { path: "kustomization.yaml", value: templates.#Kustomization },
//]

[
  templates.#Deployment,
  templates.#Kustomization
]
