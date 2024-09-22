package test

import "regexp"

matches: regexp.FindSubmatch(#"^([^:]*):(\d+)$"#, "localhost:443")
