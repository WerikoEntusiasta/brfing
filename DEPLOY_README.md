# Deploy do Briefing App no Zima

## Arquivos de Deploy

| Arquivo | Descrição |
|---------|-----------|
| `Dockerfile` | Multi-stage build (node:20-alpine), compila native modules do `better-sqlite3` |
| `docker-compose.yml` | Serviço na porta 80, healthcheck, volume para dados persistentes |

## Pré-requisitos

- SSH configurado para o Zima (`ssh root@<zima-ip>`)
- Docker + Docker Compose instalados no Zima
- Porta 80 liberada no firewall do Zima

## Deploy Manual

```bash
# 1. Copiar os arquivos
scp -r /home/node/.openclaw/workspace/grao-mestre/webapp-briefing/ root@<zima-ip>:/opt/briefing-app/

# 2. Entrar no Zima e subir
ssh root@<zima-ip>
cd /opt/briefing-app
docker compose up -d

# 3. Verificar
docker compose ps
docker compose logs -f
```

## Acesso

- Admin: `http://<zima-ip>/admin`
- Cliente: `http://<zima-ip>/briefing/<token>`

## Notas

- O app usa `better-sqlite3` (native module) — precisa de build tools no Docker.
- O `briefing.db` é copiado com dados de seed (se existir).
- Healthcheck via `wget --spider` contra `/admin`.
- Logs: `docker compose logs -f briefing-app`

## Status Atual

✅ Dockerfile criado  
✅ docker-compose.yml criado  
❌ IP/SSH do Zima não encontrado — necessário configurar acesso SSH  
