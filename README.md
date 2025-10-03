# rebide

Rails Development Environment Setup Script

## Usage

```bash
./rebide
```

Run from any Rails project directory to start a complete development environment with tmux, Docker services, Sublime Text, and Chrome.

### Commands

**Start development environment:**
```bash
./rebide
```

**List available Chrome profiles:**
```bash
./rebide --list-profiles
```

**Close development environment:**
```bash
./rebide --close
```
Stops Docker services and kills the tmux session.

## Optional Configuration

Create a `.chrome-profile` file in your Rails project with your desired Chrome profile name:
```bash
echo "Profile 1" > .chrome-profile
```

## Requirements

- tmux
- docker (with compose)
- subl (Sublime Text)
- google-chrome