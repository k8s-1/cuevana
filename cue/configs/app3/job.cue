import (
	"github.com/k8s-1/cuevana/templates"
)

nginx: templates.job & {
	name:     "nginx"
	replicas: 2
}

postgres: templates.job & {
	name:     "postgres"
	replicas: 5
}
