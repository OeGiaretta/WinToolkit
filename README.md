# WinToolkit

![WinToolkit Logo](assets/logo.png)

WinToolkit is a comprehensive collection of Windows command-line utilities designed to simplify daily system administration tasks.  
It gathers multiple .bat scripts in one place, offering quick access to tools for networking, diagnostics, automation, system cleanup, remote management, and more.

---

## 🚀 Features

### 🌐 Network & Connectivity
- **View My IP** - Displays complete local network configuration
- **Test Internet** - Tests connection with configurable server (default: 8.8.8.8)
- **Check Connections** - Lists all active network connections
- **Remote IPConfig** - Gets network configuration from remote computer
- **Remote FlushDNS** - Clears DNS cache on remote computer
- **Remote RegisterDNS** - Registers DNS on remote computer
- **Discover MAC** - Discovers MAC address by IP

### 💻 Remote Management
- **Restart Remote Computer** - Restarts computer on network
- **Shutdown Remote Computer** - Shuts down computer on network
- **Cancel Remote Shutdown** - Cancels scheduled shutdown/restart
- **Send Remote Message** - Sends message to logged-in user
- **Remote System Info** - Gets complete system information
- **Logged User** - Checks which user is logged in
- **Close Remote Program** - Closes processes on remote computer

### 🔧 Services & System
- **VNC Status** - Checks VNC service status
- **VNC Stop** - Stops remote VNC service
- **VNC Start** - Starts remote VNC service
- **Check Architecture** - Detects if system is 32 or 64 bits
- **Check Remote Architecture** - Detects architecture on remote computer
- **Check HDD/SSD** - Identifies disk type (HDD or SSD)

### 📦 Software Management
- **Install Remote Software** - Installs software via winget
- **Uninstall Remote Software** - Removes software via winget
- **List Remote Software** - Lists all installed software
- **View Office Key** - Displays Office product key

### 🖨️ Printers
- **Clear Print Queue** - Clears local print queue
- **List Remote Printers** - Lists printers installed remotely
- **Install Remote Printer** - Installs printer on remote computer

### 🛠️ Development
- **Create Java Project** - Creates new Maven project with standard structure

### 🆔 Generators & Validators
- **Generate CPF** - Generates valid CPF for testing
- **Validate CPF** - Validates provided CPF
- **Generate CNPJ** - Generates valid CNPJ for testing
- **Validate CNPJ** - Validates provided CNPJ
- **Generate Person Data** - Generates complete fake person data for testing

### 🔒 Security
- **Create Defender Exception** - Adds exception to Windows Defender

---

## 📁 Project Structure

```
WinToolkit/
├── assets/
│   └── logo.png
├── scripts/              # 34 organized scripts
│   ├── ver_meu_ip.bat
│   ├── testar_internet.bat
│   ├── limpar_impressao.bat
│   ├── reiniciar_computador_remoto.bat
│   └── ... (31 other scripts)
├── tests/                # Test scripts
├── config.bat            # Configuration file
├── WinToolkit.bat        # Main menu
└── README.md
```

---

## 🛠️ Requirements

- **Operating System**: Windows 10 or higher
- **Permissions**: Administrator (for some features)
- **Optional Dependencies**:
  - `psexec` (PsTools) - For remote commands
  - `winget` - For software management
  - `curl` - For CPF/CNPJ generators (included in Windows 10+)
  - `mvn` (Maven) - For Java project creation

---

## ⚙️ Configuration

1. **Clone the repository**:
   ```sh
   git clone https://github.com/OeGiaretta/WinToolkit
   ```

2. **Configure credentials** (optional):
   
   Edit the `config.bat` file with your domain credentials:
   ```batch
   set "DOMAIN=YOUR_DOMAIN"
   set "ADMIN_USER=administrator"
   set "ADMIN_PASSWORD=your_password_here"
   set "TEST_IP=8.8.8.8"
   set "VNC_SERVICE_NAME=uvnc_service"
   set "SHUTDOWN_TIMEOUT=35"
   ```

   > **Note**: If `config.bat` doesn't exist, the system will use default values.

---

## ▶️ How to Use

1. **Run the main script**:
   ```sh
   WinToolkit.bat
   ```

2. **Select an option** from the menu (1-34)

3. **Follow the on-screen instructions** for each tool

---

## ✨ Characteristics

- ✅ **Self-Explanatory Names** - All scripts have clear and descriptive names
- ✅ **Input Validation** - Validates data before execution
- ✅ **Error Handling** - Clear success/error messages
- ✅ **Dependency Checking** - Verifies if required tools are installed
- ✅ **Centralized Configuration** - All settings in a single file
- ✅ **Portable** - No installation required
- ✅ **Modular** - Each functionality in a separate script

---

## 📋 Complete Script List

### Local Network (4)
- `ver_meu_ip.bat` - View My IP
- `testar_internet.bat` - Test Internet
- `verificar_conexoes.bat` - Check Connections
- `ipconfig_remoto.bat` - Remote IPConfig

### Remote Management (8)
- `reiniciar_computador_remoto.bat` - Restart Remote Computer
- `desligar_computador_remoto.bat` - Shutdown Remote Computer
- `anular_desligamento_remoto.bat` - Cancel Remote Shutdown
- `enviar_mensagem_remota.bat` - Send Remote Message
- `sistema_info_remoto.bat` - Remote System Info
- `usuario_logado.bat` - Logged User
- `fechar_programa_remoto.bat` - Close Remote Program
- `descobrir_mac.bat` - Discover MAC

### VNC Services (3)
- `vnc_status.bat` - VNC Status
- `vnc_parar.bat` - VNC Stop
- `vnc_iniciar.bat` - VNC Start

### System (4)
- `verificar_arquitetura.bat` - Check Architecture
- `verificar_arquitetura_remoto.bat` - Check Remote Architecture
- `verificar_hdd_ssd.bat` - Check HDD/SSD
- `visualizar_chave_office.bat` - View Office Key

### Software (3)
- `instalar_software_remoto.bat` - Install Remote Software
- `desinstalar_software_remoto.bat` - Uninstall Remote Software
- `listar_softwares_remoto.bat` - List Remote Software

### Printers (3)
- `limpar_impressao.bat` - Clear Print Queue
- `listar_impressoras_remoto.bat` - List Remote Printers
- `instalar_impressora_remoto.bat` - Install Remote Printer

### DNS (2)
- `flushdns_remoto.bat` - Remote FlushDNS
- `registerdns_remoto.bat` - Remote RegisterDNS

### Development (1)
- `criar_projeto_java.bat` - Create Java Project

### Generators/Validators (5)
- `gerar_cpf.bat` - Generate CPF
- `validar_cpf.bat` - Validate CPF
- `gerar_cnpj.bat` - Generate CNPJ
- `validar_cnpj.bat` - Validate CNPJ
- `gerar_dados_pessoa.bat` - Generate Person Data

### Security (1)
- `criar_excecao_defender.bat` - Create Defender Exception

**Total: 34 scripts**

---

## 🔧 External Dependencies

### PsTools (psexec)
Required for remote commands. Download: [Microsoft Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/pstools)

### Windows Package Manager (winget)
Included in Windows 11 and available for Windows 10 via Microsoft Store.

### Apache Maven
Required only for Java project creation. Download: [Apache Maven](https://maven.apache.org/download.cgi)

---

## 📌 Roadmap

- [ ] Add color-enhanced menu
- [ ] Expand network utilities
- [ ] Improve logging system
- [ ] Add PowerShell version
- [ ] Add more validations
- [ ] Multi-language support

---

## 🤝 Contributions

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to modify.

---

## 📜 License

This project is licensed under the MIT License.

---

## 👤 Author

**OeGiaretta**

- GitHub: [@OeGiaretta](https://github.com/OeGiaretta)

---

## 🙏 Acknowledgments

- Scripts organized and improved with validations and error handling
- Self-explanatory names for better usability
- Modular structure for easy maintenance
