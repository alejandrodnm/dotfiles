# Plan: Migrate Dotfiles to Nix

## Goals
- Reproduce current system configuration with Nix (packages, configs, services).
- Keep the setup reproducible across machines and easy to iterate.
- Minimize disruption by migrating in phases.

## High‑Level Approach
- Use **Nix Flakes** for pinning and reproducibility.
- Use **Home Manager** for user-level configuration (dotfiles, packages, shell, editor).
- Optionally use **Nix‑Darwin** (macOS) or **NixOS** (Linux) for system-level settings.
- Treat the existing dotfiles as the source of truth and port them module-by-module.

## Phased Plan

### Phase 0: Inventory & Baseline
1. Audit current setup:
   - Shell (zsh, bash) configs and plugins
   - Editor/IDE configs
   - CLI tools and language runtimes
   - System services (brew services, launchd/systemd)
   - Fonts, themes, terminal configs
2. Identify what must be system-level vs user-level.
3. Snapshot current state (brew list, pip/npm/rustup/etc).

### Phase 1: Bootstrap Nix
1. Install Nix in multi-user mode.
2. Enable flakes and nix-command in `nix.conf`.
3. Create a new flake in this repo (e.g. `flake.nix`).
4. Add Home Manager as a flake input and create a minimal `home.nix`.

### Phase 2: Home Manager Migration (Core)
1. Port shell config:
   - Zsh + plugins, starship/prompt, aliases, environment variables
2. Port core CLI tools via `home.packages`.
3. Port dotfiles with `home.file` / `xdg.configFile`.
4. Commit frequently to keep diffs small.

### Phase 3: Developer Tooling
1. Add language tooling (node, python, rust, go, etc).
2. Replace ad-hoc installs with Nix packages where possible.
3. For tools not in Nixpkgs, add overlays or use `nix profile` as a stopgap.

### Phase 4: System Integration
- macOS:
  1. Introduce Nix‑Darwin for system settings and services.
  2. Move brew packages/services only if needed; keep brew temporarily if it reduces risk.
- Linux:
  1. Decide whether to move to NixOS or keep a standard distro + Home Manager.

### Phase 5: Cleanup & Hardening
1. Remove redundant configs and manual installs.
2. Add `nix flake lock` updates to routine maintenance.
3. Document setup steps for new machines.
4. Add CI to validate flake builds (optional).

## Proposed Repo Structure
```
.
├── flake.nix
├── flake.lock
├── home/
│   ├── home.nix
│   ├── packages.nix
│   ├── zsh.nix
│   └── git.nix
├── darwin/        # if using nix-darwin
│   └── darwin.nix
└── nix.md         # this plan
```

## Minimal Next Steps
1. Decide scope: Home Manager only vs Home Manager + Nix‑Darwin.
2. Create `flake.nix` with Home Manager and a minimal `home.nix`.
3. Port shell + core packages first.

## Risks / Notes
- Some tools may not be in Nixpkgs or may lag versions.
- GUI apps on macOS can be tricky; consider `homebrew` or `nix-darwin` + `brew` bridge.
- Start with small wins; keep existing setup until Nix is stable.
