package gen

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
)

command: prompter: {

	find: file.Glob & {
		glob: "configs/**/*.cue"
	}

	for i, f in find.files {
		(f): {
			print: cli.Print & {
				$dep: run.success
				text: "\t" + strings.TrimSpace(run.stdout)
			}
		}
	}

}
