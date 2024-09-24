package gen

import (
    //"encoding/yaml"
    "tool/cli"
)

//command: "dump": {
//    task: print: cli.Print & {
//        text: yaml.MarshalStream(objects)
//    }
//}

command: "gen": {
	for i, R in objects {
		// make a unique name when comprehending
		"write-\(i)": file.Create & {
			filename: R.filename
			contents: R.contents
		}
	}
}
