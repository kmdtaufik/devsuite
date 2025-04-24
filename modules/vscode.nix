{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

{
  options.programs.devsuite.vscode.enable = mkEnableOption "Enable FHS-compatible VSCode with pnpm, gcc, openjdk";

  config = mkIf config.programs.devsuite.vscode.enable {
    environment.systemPackages = [
      (pkgs.vscode.fhsWithPackages (
        ps:
        with ps;
        with pkgs;
        [
          pnpm
          gcc
          openjdk
          nodejs
        ]
      ))
    ];
  };
}
