import (
	"github.com/k8s-1/cuevana/templates"
)

templates.job: {
	nginx: replicas:  2
	manager: command: "monit -I"
	policyd: _
	boltdb: replicas:   3
	postgres: replicas: 5
}
