package gen

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
	"strings"
)

command: gen: {

	// Find all .cue files in the 'configs/*/' directories
	find: file.Glob & {
		glob: "configs/*/*.cue"
	}

	// Loop over each found file
	for i, f in find.files {
		(f): {
			// Extract the directory and filename
			// Remove '.cue' and replace it with '.yaml'
			outputFile: strings.Replace(f, ".cue", ".yaml", -1)

			// Print which file is being processed (optional)
			setup: cli.Print & {
				text: "\(f)"
			}

			// Run the CUE export command to render the file as YAML
			run: exec.Run & {
				cmd: ["cue", "export", "-t", "dev", "--out", "yaml", f]
				stdout: string
			}

			// Write the exported YAML content to a new file
			write: file.Create & {
				filename: outputFile // Save the output in the same structure with .yaml extension
				contents: run.stdout // Use the rendered YAML from the 'cue export'
			}
		}
	}
}
