#!/bin/bash
# Local preview at http://localhost:1313/, drafts included.
# Hugo and Go come from mise.toml; run `mise install` once first.
exec mise exec -- hugo server --buildDrafts
