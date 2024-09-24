package gen

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
	"strings"
)

command: gen: {

	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	for i, f in find.files {
		(f): {
			outputFile: strings.Replace(f, ".cue", ".yaml", 1)

			setup: cli.Print & {
				text: "\(f)"
			}

			run: exec.Run & {
				cmd: ["cue", "export", "-t", "dev", "--out", "yaml", f]
				stdout: string
			}

			write: file.Create & {
				filename: outputFile
				contents: run.stdout
			}
		}
	}
}
