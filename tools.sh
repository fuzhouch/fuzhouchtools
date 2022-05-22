#!/bin/sh

# Presentation tools
# go install golang.org/x/tools/cmd/present@latest
go install github.com/maaslalani/slides@latest
go install github.com/charmbracelet/glow@latest 
go install -tags 'sqlserver mysql postgres presto sqlite3' github.com/xo/usql@latest

# Python tools
pip install jupyter ipython bokeh pandas arrow docutils
awsv2 --install
