# Personal Websites

This repository contains two separate portfolio websites under the `leexusos.com` domain:

- `leezhang.leexusos.com`
- `jacquelinezhang.leexusos.com`

Both sites use the same plain HTML/CSS/JavaScript template approach for the first version, but they are built and deployed as separate Docker images.

## Repository Layout

```text
personal-websites/
  sites/
    lee/
      src/
        index.html
        profile-photo.jpeg
        styles.css
        script.js
      Dockerfile
      .dockerignore
    jacqueline/
      src/
        index.html
        profile-photo.jpeg
        styles.css
        script.js
      Dockerfile
      .dockerignore
  docker-compose.yml
  README.md
```

## Local Development

Run both sites locally:

```bash
docker compose up --build
```

Local URLs:

- `http://localhost:8080` for Lee
- `http://localhost:8081` for Jacqueline

## Azure Deployment Direction

Planned hosting target:

- Azure Container Registry for Docker images
- Azure Container Apps for running each website
- Custom subdomains for each portfolio
- Managed TLS certificates on the public endpoints

Manual deployment comes first. CI/CD automation can be added later.
