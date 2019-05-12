#/usr/bin/env bash

set -e

mod=$(head -1 go.mod | sed 's/^module//g' | xargs)

rm -rf caddy/
mkdir caddy

cd caddy

cat >main.go <<EOL
package main

import (
	"github.com/mholt/caddy/caddy/caddymain"
	// plug in plugins here, for example:
	_ "$mod"
)

func main() {
	// optional: disable telemetry
	// caddymain.EnableTelemetry = false
	caddymain.Run()
}
EOL

go build main.go
cd ..
rm -rf caddy
