#!/bin/bash

# ==============================================================================
# ALIASES CONFIGURATION
# Add your custom aliases here in the format "alias_name='command'"
# ==============================================================================
ALIASES=(
    "gs='git status'"
    "gp='git pull'"
    "gc='git commit -m'"
)

ZSHRC="$HOME/.zshrc"

echo "=========================================="
echo "    ZSH ALIASES INSTALLER & CONFIGURATOR"
echo "=========================================="
echo ""

if [ ! -f "$ZSHRC" ]; then
    echo "❌ Error: ~/.zshrc not found. Make sure Oh My Zsh or Zsh is installed."
    exit 1
fi

echo "⚙️ Adding aliases to ~/.zshrc..."

# Add a section header if it doesn't exist yet
if ! grep -q "# === Custom Aliases ===" "$ZSHRC"; then
    echo "" >> "$ZSHRC"
    echo "# === Custom Aliases ===" >> "$ZSHRC"
fi

# Add each alias if it doesn't already exist in the file
for alias_entry in "${ALIASES[@]}"; do
    alias_name="${alias_entry%%=*}"
    
    if grep -q "alias $alias_name=" "$ZSHRC"; then
        echo "ℹ️  Alias '$alias_name' already exists. Skipping..."
    else
        echo "➕ Adding alias: $alias_entry"
        echo "alias $alias_entry" >> "$ZSHRC"
    fi
done

# Install and configure autojump
if ! command -v autojump &> /dev/null; then
    echo "📦 Installing autojump via Homebrew..."
    brew install autojump
fi

if ! grep -q "/opt/homebrew/share/autojump/autojump.zsh" "$ZSHRC"; then
    echo "➕ Configuring autojump in ~/.zshrc..."
    echo "" >> "$ZSHRC"
    echo "unalias j 2>/dev/null" >> "$ZSHRC"
    echo "[[ -s /opt/homebrew/share/autojump/autojump.zsh ]] && source /opt/homebrew/share/autojump/autojump.zsh" >> "$ZSHRC"
else
    echo "ℹ️  Autojump is already configured in ~/.zshrc. Skipping..."
fi

echo ""
echo "✅ Aliases successfully configured in ~/.zshrc!"
echo ""
echo "🔄 Run 'source ~/.zshrc' to apply changes."