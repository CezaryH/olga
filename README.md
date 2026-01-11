Static copy of https://psycholog.olgasurma.pl/ (HTML + CSS only)

Files:
- index.html (homepage)
- o-mnie.html, czym-sie-zajmuje.html, jak-wyglada-terapia.html, cennik.html, kontakt.html
- css/style.css (copied and adjusted)
- images/olga.jpg, images/background.jpg

Notes:
- No JavaScript included; interactive map and contact form are omitted.
- Fonts (Raleway 500/700) are downloaded and referenced locally in `css/style.css` using `fonts/raleway-latin.woff2`. (Fully offline.)

To view locally: open `index.html` in your browser (e.g. double-click or `open index.html`).

---

Jekyll / GitHub Pages (optional)

This project was updated to support Jekyll includes for the navbar so it can be built by GitHub Pages.

To run locally with Jekyll:

1. Install Ruby and Bundler (macOS: `gem install bundler`).
2. From the project root run: `bundle install`.
3. Serve locally: `bundle exec jekyll serve --livereload` and open http://localhost:4000.

Files added/changed for Jekyll:
- `_layouts/default.html` — site layout (shared chrome)
- `_includes/head.html`, `_includes/footer.html`, `_includes/nav.html`, `_includes/contact.html` — reusable includes
- `_data/navigation.yml` — navigation items used by the nav include
- `_config.yml` — site configuration
- `Gemfile` — for `bundle install`
- Top-level pages now use front matter and `layout: default` (content-only pages)
- `404.html` — 404 page
- Docker files: `Dockerfile`, `docker-compose.yml`, `.dockerignore`
- Assets: `assets/css/style.css` (moved to `assets/` for Jekyll-friendly layout) -- original `css/style.css` is kept for backwards compatibility
- GitHub Actions workflow: `.github/workflows/gh-pages.yml`

If you prefer the original static copy approach, you can still open the files directly without Jekyll.

Troubleshooting: Ruby / bundle install

- If `bundle install` fails with a Ruby version error (e.g. `ffi requires ruby version >= 3.0`), your system Ruby is too old for the `github-pages` gem.

Recommended fixes:
- Upgrade Ruby (macOS): use a Ruby version manager like `rbenv` or `asdf` and install Ruby >= 3.0, then `gem install bundler` and `bundle install`.
- Or use Docker (no Ruby install needed):

  docker run --rm -p 4000:4000 -v "$PWD:/srv/jekyll" -it jekyll/jekyll:4 jekyll serve --watch --force_polling

This will serve the site at http://localhost:4000 from inside a container.

Repository settings

- To avoid GitHub Metadata plugin warnings when building locally, set `repository: "your-username/your-repo"` in `_config.yml` or add an `origin` Git remote:

  git remote add origin https://github.com/<your-username>/<your-repo>.git

- The GitHub Actions workflow will deploy the generated `_site` to GitHub Pages using `peaceiris/actions-gh-pages`. Update `repository` in `_config.yml` and the workflow as needed before enabling automatic deploys.

Docker (recommended if you don't want to change system Ruby)

Build and run with Docker (option 1 - Docker CLI):

  # build image
  docker build -t olga-surma-site .

  # run (binds container port 4000 to host 4000)
  docker run --rm -p 4000:4000 -v "$PWD:/srv/jekyll" -it olga-surma-site

Or use Docker Compose (option 2 - recommended for development):

  # build and start
  docker compose up --build

  # or (older Docker Compose):
  docker-compose up --build

Open http://localhost:4000 in your browser.

Notes:
- The Dockerfile uses the official `jekyll/jekyll:4` image and runs `bundle exec jekyll serve --livereload --force_polling --host 0.0.0.0` so the site is accessible from your host.
- If you get permission errors (files created as `root`), try running with mapped UID/GID in `docker-compose.yml` (uncomment `user: "${UID}:${GID}"`) or change ownership of the files on the host.
- If Docker daemon is not running, start Docker Desktop before running the commands.

Apple Silicon (M1/M2) note

- If you run into a platform mismatch (image platform linux/amd64 vs host linux/arm64), add `platform: linux/amd64` to the `jekyll` service in `docker-compose.yml` (this enables emulation via qemu and works reliably, but may be slightly slower). Alternatively, if you prefer a native ARM image, you can build using a Ruby base (e.g., `ruby:3.2`) and install `bundler`/`jekyll` yourself in a custom Dockerfile.