# Website for a michelin distributor

## TODO

- cookies handling
- 'about us' tab with a gallery

## How to Run

### Development Environment
Run the website with live reloading enabled:

```bash
docker compose -f docker-compose.yml up
```

The website will be available at [http://localhost:1313](http://localhost:1313). 
Changes to source files will automatically trigger a rebuild.

### Production Environment
Build and serve the optimized static site using Nginx:

```bash
docker compose -f docker-compose.prod.yml up --build
```

The website will be available at [http://localhost](http://localhost).
