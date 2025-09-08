{
  lib,
  config,
  pkgs,
  ...
}:
with lib; {
  imports = [
    ./vscode.nix
    ./idea.nix
    ./webstorm.nix
    ./pycharm.nix
  ];

  options.programs.devsuite = {
    enable = mkEnableOption "Enable the DevSuite bundle";

    dependencies = mkOption {
      type = with types; listOf package;
      default = [];
      description = "List of packages to be added to the user environment (e.g., [pkgs.nodejs pkgs.gcc pkgs.openjdk]).";
    };
  };

  config = mkIf config.programs.devsuite.enable {
    home.packages = config.programs.devsuite.dependencies;

    home.sessionVariables = let
      deps = config.programs.devsuite.dependencies;
    in
      {}
      // optionalAttrs (builtins.elem pkgs.prisma-engines deps) {
        PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
        PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
        PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
        PRISMA_FMT_BINARY = "${pkgs.prisma-engines}/bin/prisma-fmt";
      };
  };
}
