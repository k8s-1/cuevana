package gen

import (
	"tool/cli"
	"tool/exec"
	"tool/file"
)

command: prompter: {

	cueFiles: os.Glob & {
		dir:     "configs/\(dir)"
		pattern: "*.cue"
	}

	print: cli.Print & {
		text: cueFiles
	}
}
