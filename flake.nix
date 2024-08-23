{
  description = "end_4's NixOS flake";

  outputs = { self, impurity, ... }: {
    # editing flake.nix triggers certain utilities such as direnv
    # to reload - editing host configurations do not require a direnv
    # reload, so lets move hosts out of the way
    nixosConfigurations = import ./hosts { inherit self; };
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    impurity.url = "github:outfoxxed/impurity.nix";
    ags.url = "github:Aylur/ags";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
    };
    hyprland-hyprspace = {
      url = "github:KZDKM/Hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
    
    matugen.url = "github:InioX/matugen?ref=v2.2.0";
    
    morewaita-icon-theme = {
      url = "github:somepaulo/MoreWaita";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    fish-lf-icons = {
      url = "github:github:joshmedeski/fish-lf-icons";
      flake = false;
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}