{
  lib,
  config,
  ...
}: {
  imports = [
    ./vscode.nix
    ./idea.nix
    ./webstorm.nix
  ];

  options.programs.devsuite.enable = lib.mkEnableOption "Enable the DevSuite bundle";

  config = lib.mkIf config.programs.devsuite.enable {};
}
