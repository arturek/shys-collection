# SmartHomeYourself – Templates & Setups

[German original](README.md)

A compact collection for **ESPHome**, **hardware boards**, **Home Assistant**, and **Node-RED**.
The focus is on **simplicity**, **clarity**, and **consistent folder structures**. An optional validator, GitHub Action, and pre-commit hook are also provided.

## Structure (Overview)

```
/templates
  /esphome/{snippets,setups}
  /hardware/<board-name>/{kicad,manufacturing,esphome,assets}
  /home-assistant/{integrations,dashboard,scripts}
  /nodered/flows
/skeletons
  /esphome-{snippet,setup}-template
  /hardware-template
  /home-assistant-template
  /nodered-template
/tools/{validator,hooks}
/.github/workflows/validate.yml
```

## 🚀 Contributing to the Collection

There are **two ways** to contribute your own projects:

### Method 1: ZIP Upload via Issue (Easy for Beginners)

**Perfect for users without Git experience!**

1. **[Create a new issue](../../issues/new/choose)** and select a template
2. Upload a ZIP file containing your project
3. Automatic validation checks your project
4. If successful, a pull request is created automatically! ✅
5. If errors are found, the issue receives detailed feedback with guidance on how to fix them

**Available templates:**

- ESPHome snippet (sensors, actuators, etc.)
- ESPHome setup (complete projects)
- Hardware (PCB designs)
- Home Assistant (integrations, dashboards, blueprints)
- Node-RED flows

### Method 2: Direct Contribution via Git (For Developers)

**For experienced Git users:**

1. Copy the appropriate template from `/skeletons/`
2. Place it in the correct subfolder under `/templates/`
3. Rename the folder and fill in the placeholders
4. Install the pre-commit hook (see below)
5. Commit your changes and create a pull request

**Example:**

```bash
cp -r skeletons/esphome-snippet-template/ templates/esphome/snippets/sensors/my-sensor/
cd templates/esphome/snippets/sensors/my-sensor/
# Rename slug.yaml to my-sensor.yaml
# Update README.md
```

➡️ **All templates and rules:** see `CONTRIBUTING.md`

## Git Tools & Validator (Windows & Linux)

The validator checks only the structure and file names (it does not parse YAML). JSON flows are checked for valid JSON.

### Requirements

- **Python 3.x**
  - Windows: https://www.python.org/downloads/ (select “Add Python to PATH”)
  - Linux/macOS: install it using your package manager

- **Optional:** Git Bash (Windows) or PowerShell

### Quick Start

```bash
git clone <REPO_URL>
cd <REPOSITORY_FOLDER>
pip install -r tools/validator/requirements.txt
python tools/validator/validate.py
```

### 🛡️ Pre-commit Hook (Team Members Only)

**Important:** The pre-commit hook is relevant only to **direct team members** working on branches.
**External contributors** use ZIP uploads via issues or forks—the validation runs automatically on GitHub!

**Installation (team members):**

**Windows (PowerShell):**

```powershell
.\tools\hooks\install.ps1
```

**Linux/macOS (Bash):**

```bash
./tools/hooks/install.sh
```

**What does the hook do?**

- Blocks invalid commits **before** they are pushed
- Runs the validator automatically on every commit
- Saves time by detecting errors immediately on your local machine

**Note:** Even without the hook, all contributions are protected—GitHub Actions automatically validates every pull request!
