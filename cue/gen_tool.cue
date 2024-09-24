package gen

import (
	"tool/cli"
	"tool/exec"
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

			run: exec.Run & {
				$dep: setup.$done
				cmd: ["cue", "export", "-t", "dev", "--out", "cue", f]
				stdout: string
			}
      
			getit: cli.Print & {
				text: run.stdout
			}

		}
	}
}
