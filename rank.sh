#!/usr/bin/env bash
# Sort `go test -bench=` output by ns/op (ascending).
# Reads from files passed as args, or stdin if none.
#
# Usage:
#   go test -run=^$ -bench=... | ./rank.sh
#   ./rank.sh bench.out

set -euo pipefail
grep -hE '^Benchmark.* ns/op' "${@:--}" | sort -k3,3 -g
