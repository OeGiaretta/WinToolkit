# WinToolkit

> Toolkit CLI modular para Windows

---
## Idioma

**🇧🇷 Português (Brasil)** | [🇺🇸 English](README.md)

---

## Visão Geral

WinToolkit é um toolkit CLI modular para Windows focado em automação, diagnóstico e utilitários para desenvolvedores.

O que começou como um simples script batch evoluiu para uma ferramenta estruturada com:

- Menus dinâmicos baseados em YAML
- Interface terminal com ANSI
- Sistema de localização/i18n
- Arquitetura modular
- Integração com PowerShell
- Automação de utilitários do Windows

O objetivo do projeto é fornecer um ambiente de linha de comando leve, extensível e organizado para usuários avançados e desenvolvedores Windows.

---

## Funcionalidades

- Sistema de menus dinâmicos baseado em YAML
- Interface terminal com ANSI
- Arquitetura modular
- Suporte a localização/i18n
- Utilitários do Windows
- Ferramentas de diagnóstico de rede
- Utilitários para desenvolvedores
- Sistema estruturado de configuração

---

## Demonstração

![WinToolkit Demo](assets/WinToolKit.gif)

---

## Instalação

Execute o instalador diretamente pelo PowerShell:

```powershell
irm https://raw.githubusercontent.com/OeGiaretta/WinToolkit/main/install.ps1 | iex
````

---

## Estrutura do Projeto

``````txt
WinToolkit/
├── assets/
├── i18n/
├── lib/
│   ├── ui/
│   └── parse_yaml.ps1
├── scripts/
├── install.ps1
├── config.bat
└── WinToolkit.bat
``````
---

## Tecnologias

* Batch
* PowerShell
* YAML
* ANSI Escape Sequences
* Windows Terminal

---

## Por que eu construí isso?

O WinToolkit começou como um script pessoal de automação para Windows criado para simplificar tarefas repetitivas de administração e troubleshooting.

Conforme o projeto evoluiu, ficou claro que a ferramenta precisava de uma arquitetura melhor, modularidade, suporte a localização e uma experiência mais profissional no terminal.

Este projeto se tornou uma oportunidade de transformar uma ferramenta antiga e inacabada em um toolkit CLI escalável e organizado.

---

## A História do Retorno

Originalmente, o WinToolkit era apenas uma coleção de scripts batch agrupados sem uma interface consistente ou arquitetura definida.

Durante o desafio GitHub Finish-Up-A-Thon, o projeto foi completamente reestruturado e evoluído com:

* Carregamento dinâmico de menus
* Configuração baseada em YAML
* Interface ANSI
* Sistema de localização
* Organização modular
* Suporte a instalador
* Melhor experiência no terminal

O desafio se tornou a motivação perfeita para finalmente polir e publicar o projeto da forma correta.

---

## Roadmap

* [x] Interface terminal ANSI
* [x] Menus dinâmicos
* [x] Configuração baseada em YAML
* [x] Sistema de localização
* [x] Instalador
* [ ] Sistema de plugins
* [ ] Módulos PowerShell
* [ ] Integração com package managers
* [ ] Versão GUI

---

## GitHub Finish-Up-A-Thon

Este projeto é uma submissão para o desafio GitHub Finish-Up-A-Thon.

---

## Licença

MIT License