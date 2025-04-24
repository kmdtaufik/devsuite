# 💻 DevSuite

**DevSuite** is a modular NixOS flake that provides developer-focused tooling with one toggleable system module:

- ✅ **Visual Studio Code (FHS-compatible)** with:
  - `pnpm`
  - `gcc`
  - `openjdk`
- ✅ **JetBrains IDEA Community Edition** with OpenJDK runtime

Everything is cleanly controlled from your NixOS configuration under `programs.devsuite`.

---

## 📦 Features

- 📁 Modular structure for better control and scalability
- 🎛️ Single entry-point: `programs.devsuite.enable`
- 🧩 Independent toggles for VSCode and IDEA
- 📦 System-level integration — no `home-manager` needed

---

## 🛠️ Installation

### In your `flake.nix`

```nix
inputs.devsuite = {
  url = "github:youruser/devsuite";
};
```

### In your `config file`

```nix
{
  imports = [ inputs.devsuite.nixosModules.devsuite ];

  programs.devsuite = {
    enable = true;
    vscode.enable = true;
    idea.enable = true;
  };
}
```

### Now rebuild your config

🔧 Available Options
| Option | Description | Default |
|---------------------------------------|------------------------------------------|---------|
| `programs.devsuite.enable` | Enables the devsuite module | `false` |
| `programs.devsuite.vscode.enable` | Installs VSCode FHS with tools | `false` |
| `programs.devsuite.idea.enable` | Installs IDEA Community with OpenJDK | `false` |

📂 Directory Structure

```
devsuite/
├── flake.nix # Entry point
├── README.md # This file
└── modules/
├── devsuite.nix # Master toggle + imports
├── vscode.nix # VSCode module
└── idea.nix # IDEA module
```

💡 Troubleshooting

- VSCode FHS not launching? → Ensure you’re using a compatible desktop environment (e.g., Gnome, KDE) that supports fhs profiles.

- IDEA fails to find JDK? → The flake installs IDEA with OpenJDK runtime bound — check nixos-rebuild output for conflicts.

- Need to remove it? → Just set:

```nix
programs.devsuite.enable = false;
```

📜 License
MIT — use it freely, fork it fully.
