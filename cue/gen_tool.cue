// usage 1 - generate config for one environment: cue cmd -t env=dev gen
// usage 2 - generate config for all environments: cue cmd all

// repeat runs will result in the same outcome
// note: command performs non-idempotent i/o on every run

package gen

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
	"strings"
	"path"
)

command: gen: {

	env: string | string @tag(env)
	app: string | string @tag(app)

	print: cli.Print & {
		text: "\nConfiguring environment: \(env)"
	}

	find: file.Glob & {
		if app != _|_ {
			glob: "configs/\(app)/*.cue"
		}

		if app == _|_ {
			glob: "configs/*/*.cue"
		}
	}

	for _, f in find.files {
		(f): {
			appDir: path.Base(path.Dir(f))

			filename: strings.Replace(path.Base(f), ".cue", ".yaml", 1)

			targetDir: "../manifests/\(env)/\(appDir)"

			outputFile: "\(targetDir)/\(filename)"

			mkdir: file.MkdirAll & {
				path: "\(targetDir)"
			}

			// not all files will vet successfully due to @if(tag)
			// this is desired to constrain apps to specific environments
			vet: exec.Run & {
				cmd: ["cue", "vet", "-t", "\(env)", f]
				stdout:      string
				mustSucceed: false
			}

			if vet.success {
				print: cli.Print & {
					text: "► exporting \(f) to \(outputFile)"
				}

				run: exec.Run & {
					cmd: ["cue", "export", "-t", "\(env)", "--out", "yaml", f]
					stdout:      string
					mustsucceed: true
				}
			}

			if !vet.success {
				print: cli.Print & {
					text: "► skipping \(f)"
				}
			}

		}
	}
}

command: all: {
	envs: ["dev", "prd"]

	for _, e in envs {

		(e): {
			run: exec.Run & {
				cmd: ["cue", "cmd", "-t", "env=\(e)", "gen"]
				stdout: string
			}

			print: cli.Print & {
				text: run.stdout
			}
		}
	}
}
