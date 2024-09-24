package app1

import (
    "encoding/yaml"
    "tool/cli"
) 

command: dump: {
    task: print: cli.Print & {
        text: yaml.MarshalStream(objects)
    }
}
