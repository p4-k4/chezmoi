{
  description = "Personal Nix environment for Asahi Fedora";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = { self, nixpkgs, hyprland, ... }:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      # Core packages for the system
      corePackages = with pkgs; [
        cowsay
        # Window Manager & Desktop
        wofi
        hyprland.packages.${system}.hyprland
        waybar
        dunst
        wlsunset
        swaybg
        wl-clipboard
        playerctl
        # Core Applications
        kitty
        firefox
        podman
        jq
        zsh
        autojump
        oh-my-zsh
        zsh-autosuggestions
        zsh-syntax-highlighting
        # Development Tools
        git
        gh
        gcc
        # Neovim and dependencies
        neovim
        tree-sitter
        ripgrep
        fd
        luajit
        unzip
        # Additional utilities
        wget
        curl
        libsForQt5.qt5ct
        libsForQt5.qtstyleplugin-kvantum
        # Container management tools
        podman
        podman-compose
        buildah
        skopeo
        docker-client
        docker-compose
        distrobox
        # Common development tools
        git
        curl
        wget
        gnumake
        gcc
        binutils
      ];
    in
    {
      packages.${system} = {
        default = pkgs.buildEnv {
          name = "user-environment";
          paths = corePackages;
        };
      };
    };
}
