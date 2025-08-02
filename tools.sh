#!/bin/sh

# Presentation tools
# go install golang.org/x/tools/cmd/present@latest
go install github.com/maaslalani/slides@latest
go install github.com/charmbracelet/glow@latest 

# Graphic tools
go install github.com/goldmark/mermaid@latest

# SQL tools
go install -tags 'sqlserver mysql postgres presto sqlite3' github.com/xo/usql@latest

# Zig compiler manager
go install github.com/tristanisham/zvm@latest

# Python tools
# pip install jupyter ipython bokeh pandas arrow docutils
# awsv2 --install
