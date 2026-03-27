# ⚡ Zed Lazy Config

A curated, easy-to-sync configuration for the [Zed Editor](https://zed.dev). This setup includes optimized settings and the beautiful **Tokyo Night** theme.

## ✨ Features
- 🌑 **Theme:** Tokyo Night (Storm, Moon, and Light variants).
- ⚙️ **Optimized Settings:** Clean UI, improved terminal, and editor performance.
- 🚀 **Dynamic Sync:** Automatically handles nested folders (themes, keymaps, etc.).

---

## 🚀 Quick Installation (Remote)

Sync your configuration instantly without cloning the repository. Just run:

```bash
curl -sSL https://raw.githubusercontent.com/phungmanhquang/zed-lazy-config/main/install.sh | bash
```

*Note: Replace `phungmanhquang` with your GitHub username if you have forked this repository.*

---

## 🛠️ Local Installation

If you have already cloned the repository locally:

1. Navigate to the folder:
   ```bash
   cd zed-lazy-config
   ```
2. Run the installer:
   ```bash
   ./install.sh
   ```

---

## 📁 Repository Structure

```text
.
├── config/
│   ├── settings.json       # Main Zed configuration
│   └── themes/             # Custom themes (e.g., Tokyo Night)
└── install.sh              # Sync script
```

## 📝 How it works
The `install.sh` script automatically detects all files inside the `config/` directory and mirrors them into your `~/.config/zed/` folder. It preserves the directory structure, so any new folders you add in the future will be synced correctly.

---

## 🤝 Contribution
Feel free to fork this repository, add your own themes or keymaps, and share your setup!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingConfig`)
3. Commit your Changes (`git commit -m 'Add some AmazingConfig'`)
4. Push to the Branch (`git push origin feature/AmazingConfig`)
5. Open a Pull Request
