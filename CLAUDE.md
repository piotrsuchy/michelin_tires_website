# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Hugo-based static site for a Michelin motorsport tire distributor in Poland. Bilingual (English/Polish) with Tailwind CSS styling.

## Build Commands

```bash
npm run dev          # Hugo dev server with drafts (port 1313)
npm run build        # Production build with garbage collection and minification
```

**Docker Development:**
```bash
docker compose up    # Dev server with live reload
```

**Docker Production:**
```bash
docker compose -f docker-compose.prod.yml up --build
```

## Architecture

### Hugo Template Structure
- `layouts/_default/baseof.html` - Base HTML wrapper, all pages extend this
- `layouts/index.html` - Home page with video hero section
- `layouts/partials/` - Shared components (header.html, footer.html)
- `layouts/_default/single.html` - Individual tire product pages
- `layouts/_default/list.html` - Category listing pages

### Content Organization
- `content/` - Markdown content with frontmatter metadata
- Language variants: `_index.md` (English), `_index.pl.md` (Polish)
- Tire categories: rally/, circuit/, hillclimbing/, raid/
- Each category has subcategories (e.g., rally/asphalt/, rally/gravel/)

### Internationalization
- `i18n/en.toml` and `i18n/pl.toml` - Translation strings
- Use `{{ T "key_name" }}` in templates to reference translations
- Add new keys to both language files when adding translatable text

### Styling
- Tailwind CSS processed through PostCSS
- `assets/css/main.css` - Contains only Tailwind directives
- Color scheme: Blue (#004B93), Gold (#FFCD00)
- Responsive breakpoints: sm (640px), md (768px), lg (1024px)

### JavaScript
- Vanilla JS embedded in templates (no framework)
- Header scroll behavior and mobile menu in partials/header.html
- Intersection Observer for dynamic header transparency on home page

## Key Conventions

- Content frontmatter defines page metadata, images, and spec tables
- Templates use Go templating syntax (`{{ }}`)
- Mobile-first responsive design using Tailwind classes
- Navigation differs between home (fixed transparent) and inner pages (sticky solid)
