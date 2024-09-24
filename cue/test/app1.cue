package app1

import (
	"github.com/k8s-1/cuevana/templates"
	"github.com/k8s-1/cuevana/test"
)

//_#Config: { path: string, value: _ },
//configs: [..._#Config]

objects: [
  { filename: "deploy.yaml", contents: templates.#Deployment },
  { filename: "kustomization.yaml", contents: templates.#Kustomization },
]

//[
//  templates.#Deployment,
//  templates.#Kustomization
//]
