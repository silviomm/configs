#!/bin/bash

# ==============================================================================
# PACKAGE LIST (Easily add new items here)
# ==============================================================================
FORMULAS=(
    "wget"
    "awscli"
    "autojump"
)

CASKS=(
    "telegram-desktop"
    "docker-desktop"
    "claude"
    "visual-studio-code"
    "google-chrome"
    "tabby"
    "claude"
    "antigravity"
    "antigravity-cli"
    "stremio"
    "discord"
)

# ==============================================================================
# FUNCTIONS
# ==============================================================================

show_list() {
    echo "📦 Formulas (brew install):"
    for item in "${FORMULAS[@]}"; do
        echo "  - $item"
    done
    
    echo ""
    echo "🖥️  Casks (brew install --cask):"
    for item in "${CASKS[@]}"; do
        echo "  - $item"
    done
}

# ==============================================================================
# MAIN FLOW
# ==============================================================================

clear
echo "=========================================="
echo "    HOMEBREW INSTALLATION MANAGER"
echo "=========================================="
echo ""

echo "The following tools are registered for installation:"
echo "----------------------------------------------------------"
show_list
echo "----------------------------------------------------------"
echo ""

echo "What would you like to do?"
echo "  [1] Install ALL packages in the list"
echo "  [2] Select manually what to install"
echo "  [3] Exit"
read -p "Choose an option [1-3]: " general_option

case $general_option in
    1)
        echo ""
        echo "🚀 Starting installation of ALL packages..."
        brew install "${FORMULAS[@]}"
        brew install --cask "${CASKS[@]}"
        echo "✅ Installation completed successfully!"
        ;;
    2)
        echo ""
        echo "--- MANUAL SELECTION ---"
        
        SELECTED_FORMULAS=()
        SELECTED_CASKS=()
        
        echo "Select the Formulas you want to install (enter numbers separated by space, or press Enter to skip):"
        for i in "${!FORMULAS[@]}"; do
            echo "  [$((i+1))] ${FORMULAS[i]}"
        done
        read -p "Enter numbers (ex: 1 3): " -a choices_f
        
        for num in "${choices_f[@]}"; do
            if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "${#FORMULAS[@]}" ]; then
                SELECTED_FORMULAS+=("${FORMULAS[$((num-1))]}")
            fi
        done
        
        echo ""
        echo "Select the Casks you want to install (enter numbers separated by space, or press Enter to skip):"
        for i in "${!CASKS[@]}"; do
            echo "  [$((i+1))] ${CASKS[i]}"
        done
        read -p "Enter numbers (ex: 1 2 4): " -a choices_c
        
        for num in "${choices_c[@]}"; do
            if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -ge 1 ] && [ "$num" -le "${#CASKS[@]}" ]; then
                SELECTED_CASKS+=("${CASKS[$((num-1))]}")
            fi
        done
        
        echo ""
        echo "=========================================="
        echo "SUMMARY OF YOUR SELECTION:"
        [ ${#SELECTED_FORMULAS[@]} -gt 0 ] && echo "Formulas: ${SELECTED_FORMULAS[*]}"
        [ ${#SELECTED_CASKS[@]} -gt 0 ] && echo "Casks: ${SELECTED_CASKS[*]}"
        echo "=========================================="
        
        read -p "Do you want to proceed with the installation of these items? [y/N]: " confirm
        if [[ "$confirm" =~ ^[yY]$ ]]; then
            [[ ${#SELECTED_FORMULAS[@]} -gt 0 ]] && brew install "${SELECTED_FORMULAS[@]}"
            [[ ${#SELECTED_CASKS[@]} -gt 0 ]] && brew install --cask "${SELECTED_CASKS[@]}"
            echo "✅ Selected installation completed successfully!"
        else
            echo "❌ Installation cancelled by user."
        fi
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac