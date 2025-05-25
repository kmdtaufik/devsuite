{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.devsuite.idea = {
    community.enable = mkEnableOption "Enable JetBrains IDEA Community Edition with OpenJDK";
    ultimate.enable = mkEnableOption "Enable JetBrains IDEA Ultimate Edition with OpenJDK";
  };

  config = mkMerge [
    (mkIf config.programs.devsuite.idea.community.enable {
      home.packages = [pkgs.jetbrains.idea-community];
    })
    (mkIf config.programs.devsuite.idea.ultimate.enable {
      home.packages = [pkgs.jetbrains.idea-ultimate];
    })
  ];
}
