{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.devsuite.vscode;
in {
  options.programs.devsuite.vscode = {
    enable = mkEnableOption "Enable FHS-compatible VSCode";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.vscode.fhs];
  };
}
