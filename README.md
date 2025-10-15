```
 ▄▄▄ ▗▞▀▚▖▗▖   ▗▄▄▄▖▗▄▄▄  ▗▄▄▄▖
█    ▐▛▀▀▘▐▌     █  ▐▌  █ ▐▌   
█    ▝▚▄▄▖▐▛▀▚▖  █  ▐▌  █ ▐▛▀▀▘
          ▐▙▄▞▘▗▄█▄▖▐▙▄▄▀ ▐▙▄▄▖
```

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

## Configuration

Create a `.rebide.conf` file in your Rails project root to customize settings:

```bash
# .rebide.conf

# Chrome profile to use (run ./rebide --list-profiles to see available profiles)
CHROME_PROFILE="Profile 1"

# Rails server port (passed as PORT environment variable to bin/dev)
RAILS_PORT="3000"

# Custom Chrome URL (optional, defaults to http://localhost:$RAILS_PORT)
# CHROME_URL="http://custom-domain.test"
```

**Example configurations:**

Default setup (port 3000):
```bash
echo 'CHROME_PROFILE="Profile 1"' > .rebide.conf
```

Custom port:
```bash
cat > .rebide.conf << EOF
CHROME_PROFILE="Profile 1"
RAILS_PORT="3001"
EOF
```

Without Chrome:
```bash
echo 'RAILS_PORT="3000"' > .rebide.conf
```

## Requirements

- tmux
- docker (with compose)
- subl (Sublime Text)
- google-chrome

---

Rebware © 2025
