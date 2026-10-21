#!/bin/bash

# prereq: `uv tool install update-gha`
# optional: `export GITHUB_TOKEN=[gh_token]`

pnpm update
update-gha --update-version-with release-commit-sha --release-types minor,patch
gh actions-lock
