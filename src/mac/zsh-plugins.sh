#!/bin/bash

# ==============================================================================
# ZSH PLUGINS CONFIGURATION
# - External plugins: Format "plugin_name:github_url"
# - Built-in/Native plugins: Just the plugin name (no colon or URL)
# ==============================================================================
PLUGINS=(
    "docker"
    "docker-compose"
    "copyfile"
    "kubectl"
    "zsh-syntax-highlighting:https://github.com/zsh-users/zsh-syntax-highlighting.git"
    "zsh-autosuggestions:https://github.com/zsh-users/zsh-autosuggestions.git"
    "zsh-nvm:https://github.com/lukechilds/zsh-nvm.git"
)

# Set custom zsh directory if not already set
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "=========================================="
echo "    ZSH PLUGIN INSTALLER & CONFIGURATOR"
echo "=========================================="
echo ""

# 1. Clone plugins that have a GitHub URL
for plugin_entry in "${PLUGINS[@]}"; do
    if [[ "$plugin_entry" == *":"* ]]; then
        plugin_name="${plugin_entry%%:*}"
        plugin_url="${plugin_entry#*:}"
        
        target_dir="$ZSH_CUSTOM/plugins/$plugin_name"
        
        if [ -d "$target_dir" ]; then
            echo "ℹ️  Plugin '$plugin_name' is already cloned. Skipping..."
        else
            echo "📥 Cloning plugin '$plugin_name'..."
            git clone "$plugin_url" "$target_dir"
        fi
    fi
done

# 2. Extract all plugin names to add to ~/.zshrc
plugin_names=""
for plugin_entry in "${PLUGINS[@]}"; do
    plugin_name="${plugin_entry%%:*}"
    plugin_names="$plugin_names $plugin_name"
done

# Clean leading/trailing spaces
plugin_names="$(echo "$plugin_names" | xargs)"

# 3. Update ~/.zshrc plugins line safely
if [ -f "$HOME/.zshrc" ]; then
    echo "⚙️ Updating ~/.zshrc with the plugins..."
    
    for plugin_entry in "${PLUGINS[@]}"; do
        plugin_name="${plugin_entry%%:*}"
        if ! grep -q "$plugin_name" "$HOME/.zshrc"; then
            sed -i '' "s/\(^plugins=([^)]*\)/\1 $plugin_name/" "$HOME/.zshrc"
        fi
    done
    
    echo "✅ Configuration added to ~/.zshrc successfully!"
    echo ""
    echo "Current plugins line in ~/.zshrc:"
    cat "$HOME/.zshrc" | grep "plugins=("
    
    echo ""
    echo "🔄 Run 'source ~/.zshrc' to apply changes."
else
    echo "❌ Error: ~/.zshrc not found. Make sure Oh My Zsh is installed."
    exit 1
fi