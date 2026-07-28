<div align="center">
  <h1>📝 Brfing — Sistema de Briefing para Projetos Web</h1>
  <p><b>Plataforma para Criação e Gerenciamento de Briefings de Projetos Digitais</b></p>
  <p>
    <img src="https://img.shields.io/badge/status-active-success.svg" alt="Status Active" />
    <img src="https://img.shields.io/badge/version-1.0.0-blue" alt="Version" />
    <img src="https://img.shields.io/badge/tech-Express%20%7C%20SQLite%20%7C%20JavaScript-yellow" alt="Tech Stack" />
    <img src="https://img.shields.io/badge/storage-SQLite%20(better--sqlite3)-orange" alt="Storage" />
    <img src="https://img.shields.io/badge/deploy-Docker%20%7C%20ZimaOS-blue" alt="Deploy" />
    <img src="https://img.shields.io/badge/license-MIT-green" alt="License" />
  </p>
</div>

---

## 📋 Visão Geral

**Brfing** é um sistema de briefing para projetos web que permite que agências criem briefings estruturados e clientes preencham via link único, sem necessidade de cadastro. Ideal para agências de marketing digital que precisam coletar requisitos de clientes de forma organizada e padronizada.

---

## ✨ Funcionalidades

| Funcionalidade | Descrição |
|---------------|-----------|
| 📋 **Briefings Estruturados** | Criação de projetos com seções pré-definidas (logo, empresa, serviços, cores, etc.) |
| 🔗 **Links Únicos** | Cada cliente recebe um link exclusivo com token de acesso |
| 📤 **Upload de Arquivos** | Clientes podem enviar imagens, logotipos e referências visuais |
| 📊 **Controle de Progresso** | Acompanhamento visual de seções concluídas no briefing |
| 🗄️ **Persistência SQLite** | Banco de dados leve e sem necessidade de configuração externa |
| 🐳 **Containerizado** | Pronto para Docker com suporte a ZimaOS |
| 🏠 **ZimaOS Ready** | Deploy simplificado com healthcheck e volumes persistentes |

---

## 🛠️ Stack Tecnológica

| Categoria | Tecnologia |
|-----------|-----------|
| **Backend** | Express (Node.js) 5.x |
| **Banco de Dados** | SQLite (better-sqlite3) |
| **Upload** | Multer |
| **Frontend** | JavaScript Vanilla |
| **Container** | Docker + Docker Compose |
| **Base Image** | Alpine Linux (node:20-alpine) |

---

## 🗂️ Estrutura do Projeto

```
brfing/
├── server.js                # Servidor Express com todas as rotas
├── .env.example             # Variáveis de ambiente (template)
├── DEPLOY_README.md         # Guia detalhado de deploy no Zima
├── Dockerfile               # Multi-stage build (node:20-alpine)
├── docker-compose.yml       # Orquestração com healthcheck
├── docker-compose.yml.bak   # Backup da config anterior
├── server.js.bak            # Backup do servidor anterior
├── package.json             # Dependências
├── briefing.db              # Banco SQLite com dados de seed
└── .gitignore               # Arquivos ignorados
```

---

## 🚀 Instalação e Configuração

### Pré-requisitos

- **Node.js** 20.x ou superior
- **npm**
- **Docker** e Docker Compose (para deploy)

### Desenvolvimento Local

```bash
# 1. Clone o repositório
git clone https://github.com/WerikoEntusiasta/brfing.git
cd brfing

# 2. Instale as dependências
npm install

# 3. Inicie o servidor
npm start
```

O servidor será iniciado em [http://localhost:3000](http://localhost:3000) (ou porta configurada).

### Docker Compose

```bash
docker compose up -d --build

# Verificar logs
docker compose logs -f

# Status
docker compose ps
```

---

## 🔌 Acesso

| Rota | Descrição |
|------|-----------|
| `/admin` | Painel administrativo para criar/gerenciar briefings |
| `/briefing/:token` | Link único do cliente para preenchimento |

---

## 🗄️ Banco de Dados

O sistema utiliza **SQLite** com `better-sqlite3` (módulo nativo), armazenado no arquivo `briefing.db`. O banco é inicializado com dados de seed e requer build tools no Docker para compilar o módulo nativo.

---

## 🏠 Deploy no ZimaOS

Consulte o guia detalhado em [DEPLOY_README.md](./DEPLOY_README.md) para deploy completo no ZimaOS.

```bash
# Copiar arquivos para o Zima
scp -r ./brfing/ root@<zima-ip>:/opt/briefing-app/

# Conectar ao Zima e subir
ssh root@<zima-ip>
cd /opt/briefing-app
docker compose up -d
```

### Healthcheck

O container inclui healthcheck automático via `wget --spider` contra `/admin`.

---

## 📄 Licença

**MIT** © Amplifica Group

---

<div align="center">
  <p>Desenvolvido por <a href="https://github.com/WerikoEntusiasta">WerikOliveira</a> — Amplifica Group</p>
</div>
