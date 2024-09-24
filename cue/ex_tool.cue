package app1

import (
    "encoding/yaml"
    "tool/cli"
) 

command: gen: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
