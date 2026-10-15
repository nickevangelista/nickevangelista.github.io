#!/bin/bash
# Servidor local em http://localhost:1313/blog/ (mostra rascunhos também).
# Hugo e Go vêm do mise.toml; rode `mise install` uma vez antes.
exec mise exec -- hugo server --buildDrafts
