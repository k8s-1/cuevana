// usage is idempotent: cue cmd -t env=dev gen

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

	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	for _, f in find.files {
		(f): {
			appDir: path.Base(path.Dir(f))

			baseName: strings.Replace(path.Base(f), ".cue", ".yaml", 1)

			outputFile: "../manifests/\(env)/\(appDir)/\(baseName)"

			mkdir: file.MkdirAll & {
				path:   "\(tnDir)"
			}

			run: exec.Run & {
				cmd: ["cue", "export", "-t", "\(env)", "--out", "yaml", f]
				stdout: string
			}

			print: cli.Print & {
				text: "► Writing to configuration to \(outputFile)..."
			}

			write: file.Create & {
				filename: outputFile
				contents: run.stdout
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
