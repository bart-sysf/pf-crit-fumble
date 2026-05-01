# Pathfinder Critical Hits & Fumbles

[![Build & Deploy Project](https://github.com/bart-sysf/pf-crit-fumble/actions/workflows/builddeploy.yml/badge.svg)](https://github.com/bart-sysf/pf-crit-fumble/actions/workflows/builddeploy.yml)
![Astro](https://img.shields.io/badge/Astro-6.x-BC52EE?logo=astro&logoColor=white)
![Node](https://img.shields.io/badge/Node-%3E%3D25.0-5FA04E?logo=node.js&logoColor=white)
![pnpm](https://img.shields.io/badge/pnpm-10.33.2-F69220?logo=pnpm&logoColor=white)

Step into the dice-lit tavern and draw a fate from the deck: this app is a small Pathfinder-flavored web companion for rolling up dramatic **critical hits** and miserable **fumbles**. It is built with **Astro**, dressed with custom fantasy art, and driven mostly by editable YAML data so the rules text is easy to expand.

## What this app is

- A single-page Astro app for drawing Pathfinder 1e-style critical hit and fumble outcomes.
- A data-driven tool: the main card content lives in `src/data/critical-hits.yaml` and `src/data/fumbles.yaml`.
- A lightweight front end where the app shell, interaction logic, and styling currently live together in `src/pages/index.astro`.

If you want to change the actual game content, start in `src/data/`. If you want to change how the app looks or behaves, start in `src/pages/index.astro` and `public/images/`.

## Use it for your own table

You can use the app as a quick reference deck during play:

1. Choose the **Critical Hit** or **Fumble** deck.
2. Let the shuffle animation play.
3. Read the result cards for each damage type and apply the one that fits your attack.

If you want your own copy, run it locally or deploy it from this repository.

## Run it yourself

### Requirements

- Node `>=25.0.0`
- `pnpm` `10.33.2`

### Commands

Run everything from the repository root:

| Command | What it does |
| :-- | :-- |
| `pnpm install` | Install dependencies |
| `pnpm dev` | Start the Astro dev server |
| `pnpm build` | Build the app into `dist/` |
| `pnpm preview` | Preview the production build locally |
| `pnpm astro check` | Run Astro's built-in validation |

There is currently no dedicated test suite or lint script in this repository.

## Where the important pieces live

- `src/data/critical-hits.yaml` - critical hit card text
- `src/data/fumbles.yaml` - fumble card text
- `src/pages/index.astro` - page markup, client-side behavior, and styles
- `src/middleware.ts` - response security headers
- `public/images/` - card backs, icons, and background art
- `.github/workflows/builddeploy.yml` - build/release workflow
- `.releaserc.json` - semantic-release configuration for `CHANGELOG.md` and `VERSION`

## Contributing

Pull requests are welcome, especially if you want to:

- add new cards or rebalance existing ones
- improve Pathfinder wording or rules accuracy
- refine the UI, mobile layout, or accessibility
- improve the Astro build/deploy setup

### A good contribution path

1. Fork the repository or create a branch.
2. Make your changes.
3. Run `pnpm dev`, `pnpm build`, and `pnpm astro check`.
4. Open a pull request with a clear explanation of the gameplay or UI impact.

### Content conventions

- Keep card data in the YAML files as flat entries with `title`, `type`, and `effect`.
- Preserve the exact type names used by the app: `Bludgeoning`, `Piercing`, `Slashing`, and `Bomb/Spell`.
- If you introduce new categories or deck behavior, update both the YAML data and the filtering/rendering logic in `src/pages/index.astro`.

### Release conventions

- Use Conventional Commit prefixes such as `feat:`, `fix:`, and `chore:` when possible.
- `CHANGELOG.md` and `VERSION` are managed by semantic-release during the release flow.

## Built with Astro

This project uses Astro for the app shell and build pipeline, while keeping the card content in YAML so contributors can focus on rules text without having to redesign the whole app.

If you have a better card, a crueller fumble, or a cleaner interface, bring it to the table.
