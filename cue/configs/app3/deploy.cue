import (
	"github.com/k8s-1/cuevana/templates"
)

templates.job: {
	nginx: replicas:  2
	postgres: replicas: 5
}
