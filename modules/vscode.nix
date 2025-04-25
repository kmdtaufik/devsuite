{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.programs.devsuite.vscode;

  # Ensure the dependencies field can be either a string or a list
  deps = if builtins.isList cfg.dependencies then cfg.dependencies else [ cfg.dependencies ];

  fhs = pkgs.vscode.fhsWithPackages (ps: builtins.map (name: pkgs.${name}) deps);
in
{
  options.programs.devsuite.vscode = {
    enable = mkEnableOption "Enable FHS-compatible VSCode with user-defined runtime dependencies.";

    dependencies = mkOption {
      type = with types; either str (listOf str);
      default = [ ];
      description = "List of package names to be available inside the FHS environment (e.g., [\"pnpm\" \"gcc\" \"openjdk\"]).";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ fhs ];
  };
}
