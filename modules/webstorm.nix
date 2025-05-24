{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.programs.devsuite.webstorm;
in {
  options.programs.devsuite.webstorm = {
    enable = mkEnableOption "Enable JetBrains WebStorm ";
  };

  config = mkIf cfg.enable {
    home.package = [pkgs.jetbrains.webstorm];
  };
}
