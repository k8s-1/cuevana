package gen

import (
	"os"
	"tool/cli"
	"tool/exec"
	"tool/file"
)

command: prompter: {

	dirs: os.List & {
		path:     "configs"
		dirsOnly: true
	}

	for dir in dirs {
		cueFiles: os.Glob & {
			dir:     "configs/\(dir)"
			pattern: "*.cue"
		}

		print: cli.Print & {
			text: echo.stdout
		}
	}
}
