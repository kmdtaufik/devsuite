{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.programs.devsuite.idea.enable = mkEnableOption "Enable JetBrains IDEA Community Edition with OpenJDK";

  config = mkIf config.programs.devsuite.idea.enable {
    environment.systemPackages = [
      (pkgs.jetbrains.idea-community.override {
        jdk = pkgs.openjdk;
      })
    ];
  };
}
