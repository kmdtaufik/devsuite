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
    environment.systemPackages = [pkgs.jetbrains.webstorm];
  };
}
