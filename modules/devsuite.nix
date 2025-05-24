{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./vscode.nix
    ./idea.nix
    ./webstorm.nix
  ];

  options.programs.devsuite = {
    enable = mkEnableOption "Enable the DevSuite bundle";
    dependencies = mkOption {
      type = with types; listOf package;
      default = [];
      description = "List of packages to be added to the user environment (e.g., [pkgs.nodejs pkgs.gcc pkgs.openjdk]).";
    };
  };

  config = mkIf config.programs.devsuite.enable {
    home.packages = config.programs.devsuite.dependencies;
  };
}
