{
  config,
  lib,
  pkgs,
  ...
}:
with lib; {
  options.programs.devsuite.vscode = {
    enable = mkEnableOption "Enable FHS-compatible VSCode";
  };

  config = mkIf config.programs.devsuite.vscode.enable {
    home.packages = [pkgs.vscode.fhs];
  };
}
