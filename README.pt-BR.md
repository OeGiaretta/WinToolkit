# WinToolkit

![WinToolkit Logo](assets/logo.png)

**🇧🇷 Português (Brasil)** | [🇺🇸 English](README.md)

WinToolkit é uma coleção completa de utilitários de linha de comando para Windows, projetada para simplificar tarefas diárias de administração de sistema.  
Reúne múltiplos scripts .bat em um único lugar, oferecendo acesso rápido a ferramentas para rede, diagnóstico, automação, limpeza de sistema, gerenciamento remoto e muito mais.

---

## 🚀 Funcionalidades

### 🌐 Rede e Conectividade
- **Ver Meu IP** - Exibe configuração completa de rede local
- **Testar Internet** - Testa conexão com servidor configurável (padrão: 8.8.8.8)
- **Verificar Conexões** - Lista todas as conexões de rede ativas
- **IPConfig Remoto** - Obtém configuração de rede de computador remoto
- **FlushDNS Remoto** - Limpa cache DNS em computador remoto
- **RegisterDNS Remoto** - Registra DNS em computador remoto
- **Descobrir MAC** - Descobre endereço MAC pelo IP

### 💻 Gerenciamento Remoto
- **Reiniciar Computador Remoto** - Reinicia computador na rede
- **Desligar Computador Remoto** - Desliga computador na rede
- **Anular Desligamento Remoto** - Cancela desligamento/reinicialização agendado
- **Enviar Mensagem Remota** - Envia mensagem para usuário logado
- **Sistema Info Remoto** - Obtém informações completas do sistema
- **Usuário Logado** - Verifica qual usuário está logado
- **Fechar Programa Remoto** - Fecha processos em computador remoto

### 🔧 Serviços e Sistema
- **VNC Status** - Verifica status do serviço VNC
- **VNC Parar** - Para serviço VNC remoto
- **VNC Iniciar** - Inicia serviço VNC remoto
- **Verificar Arquitetura** - Detecta se sistema é 32 ou 64 bits
- **Verificar Arquitetura Remoto** - Detecta arquitetura em computador remoto
- **Verificar HDD/SSD** - Identifica tipo de disco (HDD ou SSD)

### 📦 Gerenciamento de Software
- **Instalar Software Remoto** - Instala software via winget
- **Desinstalar Software Remoto** - Remove software via winget
- **Listar Softwares Remoto** - Lista todos os softwares instalados
- **Visualizar Chave Office** - Exibe chave de produto do Office

### 🖨️ Impressoras
- **Limpar Impressão** - Limpa fila de impressão local
- **Listar Impressoras Remoto** - Lista impressoras instaladas remotamente
- **Instalar Impressora Remoto** - Instala impressora em computador remoto

### 🛠️ Desenvolvimento
- **Criar Projeto Java** - Cria novo projeto Maven com estrutura padrão

### 🆔 Geradores e Validadores
- **Gerar CPF** - Gera CPF válido para testes
- **Validar CPF** - Valida CPF informado
- **Gerar CNPJ** - Gera CNPJ válido para testes
- **Validar CNPJ** - Valida CNPJ informado
- **Gerar Dados de Pessoa** - Gera dados completos de pessoa fictícia para testes

### 🔒 Segurança
- **Criar Exceção Defender** - Adiciona exceção no Windows Defender

---

## 📁 Estrutura do Projeto

```
WinToolkit/
├── assets/
│   └── logo.png
├── scripts/              # 34 scripts organizados
│   ├── ver_meu_ip.bat
│   ├── testar_internet.bat
│   ├── limpar_impressao.bat
│   ├── reiniciar_computador_remoto.bat
│   └── ... (31 outros scripts)
├── tests/                # Scripts de teste
├── config.bat            # Arquivo de configuração
├── WinToolkit.bat        # Menu principal
└── README.md
```

---

## 🛠️ Requisitos

- **Sistema Operacional**: Windows 10 ou superior
- **Permissões**: Administrador (para algumas funcionalidades)
- **Dependências Opcionais**:
  - `psexec` (PsTools) - Para comandos remotos
  - `winget` - Para gerenciamento de software
  - `curl` - Para geradores de CPF/CNPJ (incluído no Windows 10+)
  - `mvn` (Maven) - Para criação de projetos Java

---

## ⚙️ Configuração

1. **Clone o repositório**:
   ```sh
   git clone https://github.com/OeGiaretta/WinToolkit
   ```

2. **Configure as credenciais** (opcional):
   
   Edite o arquivo `config.bat` com suas credenciais de domínio:
   ```batch
   set "DOMAIN=SEU_DOMINIO"
   set "ADMIN_USER=administrador"
   set "ADMIN_PASSWORD=sua_senha_aqui"
   set "TEST_IP=8.8.8.8"
   set "VNC_SERVICE_NAME=uvnc_service"
   set "SHUTDOWN_TIMEOUT=35"
   ```

   > **Nota**: Se o `config.bat` não existir, o sistema usará valores padrão.

---

## ▶️ Como Usar

1. **Execute o script principal**:
   ```sh
   WinToolkit.bat
   ```

2. **Selecione uma opção** do menu (1-34)

3. **Siga as instruções** na tela para cada ferramenta

---

## ✨ Características

- ✅ **Nomes Autoexplicativos** - Todos os scripts têm nomes claros e descritivos
- ✅ **Validação de Entrada** - Verifica dados antes de executar
- ✅ **Tratamento de Erros** - Mensagens claras de sucesso/erro
- ✅ **Verificação de Dependências** - Verifica se ferramentas necessárias estão instaladas
- ✅ **Configuração Centralizada** - Todas as configurações em um único arquivo
- ✅ **Portátil** - Não requer instalação
- ✅ **Modular** - Cada funcionalidade em script separado

---

## 📋 Lista Completa de Scripts

### Rede Local (4)
- `ver_meu_ip.bat` - Ver Meu IP
- `testar_internet.bat` - Testar Internet
- `verificar_conexoes.bat` - Verificar Conexões
- `ipconfig_remoto.bat` - IPConfig Remoto

### Gerenciamento Remoto (8)
- `reiniciar_computador_remoto.bat` - Reiniciar Computador Remoto
- `desligar_computador_remoto.bat` - Desligar Computador Remoto
- `anular_desligamento_remoto.bat` - Anular Desligamento Remoto
- `enviar_mensagem_remota.bat` - Enviar Mensagem Remota
- `sistema_info_remoto.bat` - Sistema Info Remoto
- `usuario_logado.bat` - Usuário Logado
- `fechar_programa_remoto.bat` - Fechar Programa Remoto
- `descobrir_mac.bat` - Descobrir MAC

### Serviços VNC (3)
- `vnc_status.bat` - VNC Status
- `vnc_parar.bat` - VNC Parar
- `vnc_iniciar.bat` - VNC Iniciar

### Sistema (4)
- `verificar_arquitetura.bat` - Verificar Arquitetura
- `verificar_arquitetura_remoto.bat` - Verificar Arquitetura Remoto
- `verificar_hdd_ssd.bat` - Verificar HDD/SSD
- `visualizar_chave_office.bat` - Visualizar Chave Office

### Software (3)
- `instalar_software_remoto.bat` - Instalar Software Remoto
- `desinstalar_software_remoto.bat` - Desinstalar Software Remoto
- `listar_softwares_remoto.bat` - Listar Softwares Remoto

### Impressoras (3)
- `limpar_impressao.bat` - Limpar Impressão
- `listar_impressoras_remoto.bat` - Listar Impressoras Remoto
- `instalar_impressora_remoto.bat` - Instalar Impressora Remoto

### DNS (2)
- `flushdns_remoto.bat` - FlushDNS Remoto
- `registerdns_remoto.bat` - RegisterDNS Remoto

### Desenvolvimento (1)
- `criar_projeto_java.bat` - Criar Projeto Java

### Geradores/Validadores (5)
- `gerar_cpf.bat` - Gerar CPF
- `validar_cpf.bat` - Validar CPF
- `gerar_cnpj.bat` - Gerar CNPJ
- `validar_cnpj.bat` - Validar CNPJ
- `gerar_dados_pessoa.bat` - Gerar Dados de Pessoa

### Segurança (1)
- `criar_excecao_defender.bat` - Criar Exceção Defender

**Total: 34 scripts**

---

## 🔧 Dependências Externas

### PsTools (psexec)
Necessário para comandos remotos. Download: [Microsoft Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/pstools)

### Windows Package Manager (winget)
Incluído no Windows 11 e disponível para Windows 10 via Microsoft Store.

### Apache Maven
Necessário apenas para criação de projetos Java. Download: [Apache Maven](https://maven.apache.org/download.cgi)

---

## 📌 Roadmap

- [ ] Adicionar menu com cores
- [ ] Expandir utilitários de rede
- [ ] Melhorar sistema de logs
- [ ] Adicionar versão PowerShell
- [ ] Adicionar mais validações
- [ ] Suporte a múltiplos idiomas

---

## 🤝 Contribuições

Pull requests são bem-vindos! Para mudanças maiores, por favor abra uma issue primeiro para discutir o que você gostaria de modificar.

---

## 📜 Licença

Este projeto está licenciado sob a Licença MIT.

---

## 👤 Autor

**OeGiaretta**

- GitHub: [@OeGiaretta](https://github.com/OeGiaretta)

---

## 🙏 Agradecimentos

- Scripts organizados e melhorados com validações e tratamento de erros
- Nomes autoexplicativos para melhor usabilidade
- Estrutura modular para fácil manutenção

