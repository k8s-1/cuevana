import (
	"github.com/k8s-1/cuevana/templates"
)
ok: {
  templates.#Job: {
    test: {}
  }
}

//templates.#Job["test"]: {
//    replicas: 1
//}
