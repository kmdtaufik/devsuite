{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
{
  options.programs.devsuite.webstorm = {
    enable = mkEnableOption "Enable JetBrains WebStorm ";
  };

  config = mkIf config.programs.devsuite.webstorm.enable {
    home.packages = [ pkgs.jetbrains.webstorm ];
  };
}
