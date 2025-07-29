{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.ansible
    pkgs.ansible-doctor
    pkgs.ansible-lint
    pkgs.git
    pkgs.glibcLocales
    pkgs.go-task
    pkgs.opentofu
    pkgs.pre-commit
    pkgs.python312Packages.molecule
    pkgs.python312Packages.molecule-plugins
    pkgs.python312Packages.molecule
    pkgs.yamllint
 ];
}
