// usage: cue cmd -t env=dev gen

package gen

import (
	"tool/exec"
	"tool/file"
	"strings"
  "path"
)

env:  string | *"dev" @tag(env)

command: gen: {

	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	for i, f in find.files {
		(f): {

			run: exec.Run & {
				cmd: ["cue", "export", "-t", "dev", "--out", "yaml", f]
				stdout: string
			}

      appDir: path.Base(path.Dir(f))
      baseName: strings.Replace(path.Base(f), ".cue", ".yaml", 1)
      outputFile: "../manifests/\(appDir)/\(baseName)"

			write: file.Create & {
				filename: outputFile
				contents: run.stdout
			}
		}
	}
}
