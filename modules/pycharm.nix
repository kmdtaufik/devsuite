{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.programs.devsuite.pycharm = {
    community.enable = mkEnableOption "Enable JetBrains PyCharm  Community Edition";
    professional.enable = mkEnableOption "Enable JetBrains PyCharm Professional Edition";
  };

  config = mkMerge [
    (mkIf config.programs.devsuite.pycharm.community.enable {
      home.packages = [ pkgs.jetbrains.pycharm-community ];
    })
    (mkIf config.programs.devsuite.pycharm.professional.enable {
      home.packages = [ pkgs.jetbrains.pycharm-professional ];
    })
  ];
}
