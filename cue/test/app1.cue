package test

import (
	"github.com/k8s-1/cuevana/templates"
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
