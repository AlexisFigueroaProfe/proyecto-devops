# Reserva de Horas Médicas – Proyecto DevOps

Servicio web estático de reserva de horas médicas para una empresa del rubro salud,
servido con **Nginx** dentro de **Docker** y levantado con **Docker Compose**.
No usa API ni base de datos. Todos los datos del formulario son de demostración.

## Estructura

```
proyecto-devops/
├── src/
│   ├── index.html
│   └── styles.css
├── Dockerfile
├── docker-compose.yml
├── .env.example
├── .gitignore
├── README.md
└── .github/workflows/devops-automation.yml   (opcional)
```

## Requisitos

- Git
- Docker Desktop (o Docker Engine + plugin Compose) iniciado
- Navegador web

## Instalación

```bash
git clone https://github.com/<tu-usuario>/<tu-repositorio>.git
cd <tu-repositorio>
```

Opcional: para cambiar puerto o nombre del contenedor

```bash
cp .env.example .env
```

## Ejecución

```bash
docker compose up -d --build
```

## Verificación

```bash
docker compose ps
curl -I http://localhost:8080
```

Abrir en el navegador: <http://localhost:8080>

## Monitoreo básico

```bash
docker logs reserva-horas-web
docker stats --no-stream
```

## Detención

```bash
docker compose down
```

## Seguridad

- No se publican credenciales, tokens, claves ni datos personales.
- `.env` está en `.gitignore`; solo se versiona `.env.example` (sin valores sensibles).
- Los datos del formulario y de contacto son ficticios y no se almacenan.
- Antes de cada push se revisa el cambio con `git diff` / `git status`.

## Flujo de trabajo Git

- `main`: rama estable.
- Ramas de trabajo: `feature/...`, `fix/...`, `docs/...`.
- Cambios a `main` solo mediante pull request revisado.
