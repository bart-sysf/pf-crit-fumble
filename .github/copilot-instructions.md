# Copilot Instructions

## Build and validation commands

- Use `pnpm` from the repository root. The project declares `pnpm@10.24.0` and requires Node `>=22.12.0`.
- Install dependencies with `pnpm install`.
- Start local development with `pnpm dev`.
- Build the site with `pnpm build`.
- Preview the built output with `pnpm preview`.
- Run Astro's built-in validation with `pnpm astro check`.
- There is currently no configured test runner or lint script, so there is no full-suite or single-test command to run.

## High-level architecture

- This is a single-page Astro app. `src/pages/index.astro` contains the page markup, the client-side interaction logic, and the CSS in one file rather than splitting them into components.
- Card content is data-driven. `src/data/critical-hits.yaml` and `src/data/fumbles.yaml` are loaded at the top of `index.astro` with `js-yaml`, then passed into the inline browser script via `define:vars`.
- The browser script drives the whole interaction flow: title screen -> shuffle animation -> result screen. Random card selection happens client-side by filtering the loaded YAML entries per weapon type.
- Static presentation assets live under `public/images` and are referenced directly by string paths from `index.astro`.
- `src/middleware.ts` applies security headers to every response, so response-related changes may need to account for middleware behavior.
- Release and deployment behavior spans several files: `.github/workflows/builddeploy.yml` runs the build and semantic-release, `.releaserc.json` updates `CHANGELOG.md` and `VERSION`, and `Dockerfile` packages the built `dist` output for GHCR. Changes to Astro output or adapter settings should be coordinated across `astro.config.mjs`, the workflow, and the Dockerfile.

## Key conventions

- Keep commit messages in Conventional Commit form (`feat`, `fix`, `chore`, `breaking`) because semantic-release uses those types to determine version bumps.
- Treat the YAML files as the source of truth for game content. Each entry is a flat object with `title`, `type`, and `effect`; there is no separate schema or transformation layer.
- Preserve the exact weapon-type strings across the YAML files and UI logic. `index.astro` filters cards by matching YAML `type` values against hardcoded UI values such as `Bludgeoning`, `Piercing`, `Slashing`, and `Bomb/Spell`.
- Follow `.editorconfig`: 4-space indentation by default, 2 spaces for YAML.
- `CHANGELOG.md` and `VERSION` are release-managed artifacts. Do not hand-edit them during normal feature work unless the task is specifically about release metadata or history repair.
