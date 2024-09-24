package gen

import (
  "os"
	"tool/cli"
	"tool/exec"
	"tool/file"
)

command: prompter: {

    dirs: os.List & {
        path:  "configs"
        dirsOnly: true
    }

  cueFiles: os.Glob & {
      dir:  "configs/\(dir)"
      pattern: "*.cue"
  }

	print: cli.Print & {
		text: echo.stdout
	}
}

