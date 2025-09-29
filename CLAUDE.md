# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains `rebide` - a Rails Development Environment Setup Script that automates the setup of a complete Rails development environment. The script sets up tmux sessions, Docker services, Sublime Text, and Chrome with custom profiles for any Rails project.

## Architecture

The `rebide` script is a single bash executable that:

1. **Project Detection**: Automatically detects the current project name from the directory
2. **Dependency Validation**: Checks for required tools (tmux, docker, subl, google-chrome)
3. **Service Management**: Starts Docker services (database and Redis) via `docker compose up -d`
4. **Tmux Session Setup**: Creates a 3-pane tmux layout:
   - Pane 0 (top left): Claude Code interface
   - Pane 1 (top right): Bash console
   - Pane 2 (bottom): Rails development server (`bin/dev`)
5. **IDE Integration**: Opens Sublime Text for the current project
6. **Browser Setup**: Launches Chrome with custom profile pointing to localhost:3000

## Usage Commands

### Main Command
```bash
./rebide
```
Starts the complete development environment for the current Rails project.

### Configuration
- **Chrome Profile**: Create a `.chrome-profile` file in your Rails project root with the desired Chrome profile name (e.g., "Profile 1"). Defaults to "Default" if not specified.

### Tmux Management
- **Detach from tmux**: `Ctrl+B`, then `D`
- **Reattach to session**: `tmux attach -t [PROJECT_NAME]`
- The script automatically kills existing sessions before creating new ones

## Dependencies

Required system tools:
- `tmux` - Terminal multiplexer
- `docker` - Container management (expects `docker compose` to be available)
- `subl` - Sublime Text editor
- `google-chrome` - Browser

## Rails Project Assumptions

The script assumes the target Rails project has:
- A `docker-compose.yml` file for database and Redis services
- A `bin/dev` script for starting the development server
- Standard Rails project structure at localhost:3000