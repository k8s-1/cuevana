// usage is idempotent: cue cmd -t env=dev gen

package gen

import (
	"tool/exec"
	"tool/file"
	"tool/cli"
	"strings"
	"path"
)

x: string | string @tag(env)
env: [x] | *["dev", "tst", "prd"]

command: gen: {

	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	for _, e in env {
		(e): {
			print: cli.Print & {
				text: "► Bootstrapping \(e)"
			}
		}

		for _, f in find.files
		{
			(f): {
				appDir: path.Base(path.Dir(f))

				baseName: strings.Replace(path.Base(f), ".cue", ".yaml", 1)

				outputFile: "../manifests/\(env)/\(appDir)/\(baseName)"

				run: exec.Run & {
					cmd: ["cue", "export", "-t", "\(env)", "--out", "yaml", f]
					stdout: string
				}

				write: file.Create & {
					filename: outputFile
					contents: run.stdout
				}
			}
		}

	}

}
