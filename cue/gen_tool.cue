package gen

import (
	"tool/cli"
	//"tool/exec"
	"tool/file"
)

command: gen: {

	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	for i, f in find.files {
		(f): {
			setup: cli.Print & {
				text: "\(f)"
			}

		}
	}

}
