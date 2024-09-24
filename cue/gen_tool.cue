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
			setup: cli.Print & {
				if i > 0 {
					$dep: command.bench[find.files[i-1]].print.$done
				}
				text: "\(f):"
			}
			run: exec.Run & {
				$dep: setup.$done
				cmd: ["/usr/bin/time", "-o", "/dev/stdout", "cue", "export", "--out", "cue", f]
				stdout: string
			}
			print: cli.Print & {
				$dep: run.success
				text: "\t"+strings.TrimSpace(run.stdout)
			}
		}
	}

	print: cli.Print & {
		text: cueFiles
	}
}
