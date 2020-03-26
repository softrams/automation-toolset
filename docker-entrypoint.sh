#!/bin/bash
set -e

code-server --install-extension getgauge.gauge

exec "$@"