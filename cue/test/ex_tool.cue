package gen

import (
    //"encoding/yaml"
    "tool/cli"
    "github.com/k8s-1/cuevana"
)

command: "gen": {
	for i, R in objects {
		// make a unique name when comprehending
		"write-\(i)": file.Create & {
			filename: R.filename
			contents: R.contents
		}
	}
}
