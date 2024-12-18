# Dotfiles Management with Chezmoi and Nix Flakes

This repository contains my dotfiles managed with [chezmoi](https://www.chezmoi.io/) and [Nix Flakes](https://nixos.wiki/wiki/Flakes). The setup uses chezmoi for dotfile management and Nix flakes for package management.

## Overview

- Chezmoi manages all dotfiles and configuration files
- Nix flakes handle package installation and management
- Automated scripts handle Nix installation and flake updates

## Setup on a New Machine

1. Install chezmoi:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```

2. Initialize chezmoi with this repository:
   ```bash
   chezmoi init https://github.com/p4-k4/chezmoi.git
   ```

3. Apply the configuration:
   ```bash
   chezmoi apply
   ```

This will automatically:
- Install Nix if not present (using Determinate Systems installer)
- Set up all dotfiles
- Build and apply the Nix flake configuration

## Managing Existing Installation

### Daily Usage

- Apply changes after modifying dotfiles:
  ```bash
  chezmoi apply
  ```

- Edit files through chezmoi (uses neovim):
  ```bash
  chezmoi edit ~/.config/some/config
  ```

- Add new dotfiles to management:
  ```bash
  chezmoi add ~/.config/new/config
  ```

### Package Management

⚠️ **IMPORTANT: Flake Modification Process** ⚠️

When modifying the flake, you MUST follow these exact steps:
1. Edit the flake using chezmoi:
   ```bash
   chezmoi edit flake.nix
   ```
2. Navigate to the chezmoi directory:
   ```bash
   chezmoi cd
   ```
3. Stage the changes:
   ```bash
   git add flake.nix
   ```
4. Return to home directory:
   ```bash
   cd ~/
   ```
5. Apply the changes:
   ```bash
   chezmoi apply
   ```

After applying changes:
- Restart your shell or run:
  ```bash
  exec $SHELL
  ```
  This ensures new commands are available in your PATH.

The system will automatically:
- Update the flake lock file
- Build the new configuration
- Install the updated profile
- Clean up old store paths

### Updating

- Pull and apply latest changes:
  ```bash
  chezmoi update
  ```

- Update Nix flake:
  ```bash
  chezmoi apply  # This will detect flake.nix changes and rebuild
  ```

## Directory Structure

```
~/.local/share/chezmoi/
├── .chezmoiscripts/
│   ├── run_once_before_10-install-nix.sh      # Installs Nix on new machines
│   └── run_onchange_after_20-rebuild-flake.sh  # Rebuilds flake on changes
├── dot_config/
│   └── chezmoi/
│       └── chezmoi.toml.tmpl                   # Chezmoi configuration
└── flake.nix                                   # Nix packages configuration
```

## Configuration Details

### Chezmoi Configuration

- Uses neovim as the default editor
- Excludes scripts from diff output
- Uses neovim for merge operations

### Nix Configuration

- Managed through flake.nix
- Automatically rebuilds when changes are detected
- Handles all package installations and removals
- Maintains a clean system by running garbage collection

## Removal

### Remove Chezmoi Management

To stop managing dotfiles with chezmoi:
```bash
chezmoi purge  # Removes chezmoi configuration but keeps dotfiles
```

### Remove Nix

To uninstall Nix (installed by Determinate Systems):
```bash
/nix/nix-installer uninstall
```

## Troubleshooting

### Common Issues

1. "Git tree is dirty" warning:
   - This means you have uncommitted changes
   - Commit your changes to resolve:
     ```bash
     cd ~/.local/share/chezmoi
     git add .
     git commit -m "your message"
     ```

2. New packages not available after installation:
   - Restart your shell:
     ```bash
     exec $SHELL
     ```
   - Or start a new terminal window

3. Flake build errors:
   - Check flake.nix syntax
   - Ensure all inputs are available
   - Try updating flake.lock: `nix flake update`

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
