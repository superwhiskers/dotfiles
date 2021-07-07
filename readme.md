# dotfiles

my dotfiles

## layout

- modules/ - configuration "modules"---groups of nixpkgs modules that are independent of one
another and as such, can be mixed and matched freely
	- categories/ - abstract groups of system configuration that isn't specific to any
	device
	- devices/ - system configuration used on specific hosts
	- hardware/ - system configuration related to specific configurations of hardware
	- users/ - configuration for specific user accounts

## todo

- make it possible to configure home-manager profiles in the same manner the entire system is (such
as through removing graphical elements)
- [handle passwords declaratively](https://github.com/Mic92/sops-nix)
