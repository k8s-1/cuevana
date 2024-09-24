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
				if i > 0 {
					$dep: command.bench[find.files[i-1]].print.$done
				}
				text: "\(f)"
			}
		}
	}

}
