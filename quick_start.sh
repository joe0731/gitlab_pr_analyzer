#!/bin/bash
# quick start script for GitLab PR Analyzer

set -e

echo "=========================================="
echo "GitLab MR Analyzer - Quick Start"
echo "=========================================="
echo ""

if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is not installed"
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed"
    exit 1
fi

echo "Installing gitlab-pr-analyzer..."
pip install gitlab-pr-analyzer --upgrade

echo ""
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "Required env vars:"
echo "  export GITLAB_HOST=https://gitlab.example.com"
echo "  export GITLAB_TOKEN=glpat-xxxxxxxxxxxxxxxxxxxx"
echo ""
echo "Optional for AI features:"
echo "  export CURSOR_AGENT_PATH=/path/to/cursor-agent"
echo ""
echo "Try running:"
echo "  glpa interactive"
echo ""
echo "Legacy commands (still supported):"
echo "  gl-pr-analyzer interactive"
echo "  gl-pr-ai interactive"
echo ""


