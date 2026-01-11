# Changelog

## [Unreleased] - 2026-01-11

### Added
- Migrated site to Jekyll: added `_layouts/default.html`, `_includes/*` and `_data/navigation.yml` for centralized layout and nav management. ✅
- Converted pages to layout-based content and Markdown (`.md`) files with `redirect_from` entries for legacy `.html` URLs. ✅
- Added Docker development environment (`Dockerfile`, `docker-compose.yml`) and `.dockerignore`. ✅
- Added GitHub Actions workflow `.github/workflows/gh-pages.yml` to build & deploy the site. ✅
- Moved site assets to `assets/` and consolidated styles to `assets/css/style.css`. ✅

### Changed
- Updated `_config.yml` with SEO and redirect plugins and a `repository` placeholder for GitHub Metadata.
- Updated `README.md` with Docker run instructions and Jekyll troubleshooting notes.

### Notes
- Legacy `.html` URLs are supported via `jekyll-redirect-from`. If you rely on external links to `.html` paths, they will still work via the generated redirect pages.

