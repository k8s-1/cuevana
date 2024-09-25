import (
	"github.com/k8s-1/cuevana/templates"
)

ok: templates.#Job & {
  name:     "123" // Name is an alias.
	command:  "echo \(Name)"
	replicas: 3
}
