# Using Git Offline

Git works perfectly without an internet connection. Every Git repository is a complete copy of the project history.

## Setup

```bash
# Configure your identity (one-time)
git config --global user.name "Your Name"
git config --global user.email "you@local"
```

## Creating a Repository

```bash
mkdir my-project
cd my-project
git init
```

## Basic Workflow

```bash
# Check status
git status

# Add files to staging
git add main.py
git add .              # Add everything

# Commit changes
git commit -m "Add initial project files"

# View history
git log
git log --oneline
git log --oneline --graph
```

## Branching

```bash
# Create and switch to a new branch
git checkout -b feature-backup

# Make changes, then commit
git add .
git commit -m "Add backup feature"

# Switch back to main
git checkout main

# Merge the feature branch
git merge feature-backup

# Delete the branch after merging
git branch -d feature-backup
```

## Viewing Changes

```bash
# See unstaged changes
git diff

# See staged changes
git diff --staged

# See changes in a specific file
git diff main.py

# See what changed in a commit
git show abc1234
```

## Undoing Things

```bash
# Undo changes to a file (not yet staged)
git checkout -- filename.py

# Unstage a file
git reset HEAD filename.py

# Amend the last commit message
git commit --amend -m "Better commit message"

# Revert a commit (creates a new commit that undoes changes)
git revert abc1234
```

## Sharing via USB Drive

Since ApocalypseOS has no internet, use USB drives to share code:

```bash
# Create a bare repository on a USB drive
git clone --bare my-project /mnt/usb/my-project.git

# On another machine, clone from USB
git clone /mnt/usb/my-project.git

# Push changes to USB
git remote add usb /mnt/usb/my-project.git
git push usb main

# Pull changes from USB
git pull usb main
```

## Working with Patches

Another way to share changes offline:

```bash
# Create a patch from the last 3 commits
git format-patch -3

# This creates .patch files you can copy to USB

# On another machine, apply patches
git am 0001-Add-feature.patch
git am *.patch  # Apply all patches in order
```

## .gitignore

Create a `.gitignore` file to exclude files from tracking:

```
# Compiled files
*.o
*.pyc
__pycache__/

# Editor files
*.swp
*~
.vscode/

# Sensitive files
*.key
*.pem
.env

# Build output
/build/
/dist/
```

## Useful Aliases

Add to `~/.gitconfig`:

```ini
[alias]
    s = status
    l = log --oneline --graph
    d = diff
    co = checkout
    br = branch
    ci = commit
```

## Tips

- **Commit often.** Small, focused commits are easier to understand and revert.
- **Write good messages.** "Fix buffer overflow in parser" is better than "fix bug".
- **Branch for features.** Keep `main` stable, develop on branches.
- **Back up your repos.** Use `apos-backup` or copy `.git` directories to USB.
