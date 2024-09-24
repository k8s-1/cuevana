package gen

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
	"strings"
  "path"
)

command: gen: {

	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	for i, f in find.files {
		(f): {
      appDir: path.Base(path.Dir(f))

      baseName: strings.Replace(path.Base(f), ".cue", ".yaml", 1)

      outputFile: "../manifests/\(appDir)/\(baseName)"

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
