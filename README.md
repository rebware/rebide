# rebide

Rails Development Environment Setup Script

## Usage

```bash
./rebide
```

Run from any Rails project directory to start a complete development environment with tmux, Docker services, Sublime Text, and Chrome.

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