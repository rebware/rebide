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
   - Pane 2 (bottom): Rails development server (configurable via RUN_INIT, defaults to `bin/dev`)
5. **IDE Integration**: Opens Sublime Text for the current project
6. **Browser Setup**: Launches Chrome with custom profile pointing to localhost:3000

## Usage Commands

### Main Command
```bash
./rebide
```
Starts the complete development environment for the current Rails project.

### Configuration
Create a `.rebide.conf` file in your Rails project root to customize the development environment. Available options:

- **CHROME_PROFILE**: Chrome profile to use (e.g., "Profile 1"). Chrome integration disabled if not set.
- **RAILS_PORT**: Rails server port (default: 3000)
- **CHROME_URL**: Custom URL for Chrome (default: http://localhost:$RAILS_PORT)
- **RUN_INIT**: Command to start the local server (default: bin/dev)

Example `.rebide.conf`:
```bash
CHROME_PROFILE="Profile 1"
RAILS_PORT="3000"
RUN_INIT="bin/dev"
```

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
- A command to start the development server (defaults to `bin/dev`, configurable via RUN_INIT)
- Standard Rails project structure at localhost:3000 (port configurable via RAILS_PORT)