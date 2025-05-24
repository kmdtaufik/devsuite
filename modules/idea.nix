{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.devsuite.idea;
in {
  options.programs.devsuite.idea = {
    community.enable = mkEnableOption "Enable JetBrains IDEA Community Edition with OpenJDK";
    ultimate.enable = mkEnableOption "Enable JetBrains IDEA Ultimate Edition with OpenJDK";
  };

  config = mkMerge [
    (mkIf cfg.community.enable {
      home.packages = [pkgs.jetbrains.idea-community];
    })
    (mkIf cfg.ultimate.enable {
      home.packages = [pkgs.jetbrains.idea-ultimate];
    })
  ];
}
