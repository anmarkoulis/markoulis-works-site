# AGENTS.md

Jekyll static site for Markoulis Works IKE, served by GitHub Pages at `markoulisworks.com`. It exists to publish what Greek law requires of an IKE: partners, administrator, company details, and annual financial statements.

## Layout

- Pages live in `_pages/` (a Jekyll collection). Every page has an English file and a Greek twin with a `_gr` suffix; change both together.
- Front matter sets `permalink: /<name>.html` and `lang`. Greek pages use `lang: el` (the file suffix is `_gr`, the lang code is `el`). `_layouts/default.html` picks the header/footer from `lang`.
- Navigation lives in `_includes/header_en.html` and `_includes/header_gr.html`; a new page needs a link in both.
- Live styles and scripts are the root `styles.css` and `cookie-consent.js`. `assets/css/main.scss` and `assets/js/bulma-navbar.js` are not loaded by the layout.
- Pages are plain HTML built from the classes in `styles.css` (`.container`, `.page`, `.record`, `.doc`, …); reuse them instead of inline styles. Colours are the `:root` tokens there.
- The logo mark is `_includes/logo_mark.html`; the favicon `assets/images/favicon.svg` is a simplified copy, so change both together.
- Financial PDFs go in `assets/` and are linked from `financial-statements.md` and `financial-statements_gr.md` under a year heading.
- `README.md` describes an older `index.html` layout and is stale.

## Run and check

- `make run` serves the site via Docker at http://localhost:5001.
- `make test` (what CI runs on PRs) only builds the Docker image; the curl smoke tests in the Makefile are commented out. Check page changes by running the site.

## Releases

Pushes to `main` run semantic-release (`.releaserc.json`), so commit messages must follow Conventional Commits.
