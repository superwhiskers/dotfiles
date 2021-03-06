# flake.nix - nixos modules flake
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

{
  description = "a set of nixos modules that compose my systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    utils.url = "path:../utils";
  };

  outputs = inputs:
    let
      provideInputs = let
        mapper = name: category:
          category (inputs // { provideInputs = provideInputs; });
      in builtins.mapAttrs mapper;
    in {
      nixosModules = provideInputs {
        # configuration relating to specific users
        users = import ./users;

        # configuration relating to categories of configuration options
        categories = import ./categories;

        # configuration relating to specific bits of hardware
        hardware = import ./hardware;

        # device-specific configuration
        devices = import ./devices;
      };
    };
}
