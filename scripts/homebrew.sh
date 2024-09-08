#!/bin/bash

# Arrays to store user choices for packages and casks
selected_packages=()
selected_casks=()

# Define color codes for better readability
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

# Function to ask for user confirmation with default to "none"
ask_install() {
  printf "${CYAN}Do you want to install ${MAGENTA}%s${CYAN} packages?${NC}\n" "$1" >/dev/tty
  printf "${YELLOW}Enter [A]ll, [N]one, or [S]elect individual packages [default: N]:${NC} " >/dev/tty
  read -r choice </dev/tty
  choice=${choice:-N}
  choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

  # Convert single letters to corresponding full words
  case "${choice}" in
  a) choice="all" ;;
  n) choice="none" ;;
  s) choice="select" ;;
  *) choice="none" ;; # Default to "none" for invalid input
  esac

  echo "$choice"
}

# Function to record selected package
ask_specific_install() {
  local package=$1
  printf "${YELLOW}Do you want to install package ${GREEN}%s${YELLOW}? (y/n):${NC} " "$package" >/dev/tty
  read -r choice </dev/tty
  case "${choice}" in
  y | Y)
    selected_packages+=("$package")
    ;;
  *) ;;
  esac
}

# Function to record selected cask
ask_specific_cask_install() {
  local cask=$1
  printf "${YELLOW}Do you want to install cask ${GREEN}%s${YELLOW}? (y/n):${NC} " "$cask" >/dev/tty
  read -r choice </dev/tty
  case "${choice}" in
  y | Y)
    selected_casks+=("$cask")
    ;;
  *) ;;
  esac
}

# Function to parse Brewfile and select packages
install_from_brewfile() {
  local file=$1
  local section_name=$2

  # Check if Brewfile exists
  if [[ ! -f $file ]]; then
    printf "${RED}Brewfile %s not found!${NC}\n" "$file" >/dev/tty
    return
  fi

  # Ask user if they want to install all, none, or select packages
  choice=$(ask_install "$section_name")

  case "$choice" in
  all)
    printf "${GREEN}Selecting all packages from %s...${NC}\n" "$section_name" >/dev/tty
    while IFS= read -r line; do
      # Skip empty lines and comments
      [[ -z $line || $line == \#* ]] && continue

      # Add all brews and casks from Brewfile
      if [[ $line == brew* ]]; then
        package=$(echo "$line" | awk '{print $2}' | tr -d '"')
        selected_packages+=("$package")
      elif [[ $line == cask* ]]; then
        cask=$(echo "$line" | awk '{print $2}' | tr -d '"')
        selected_casks+=("$cask")
      fi
    done <"$file"
    ;;
  select)
    printf "${CYAN}Selecting individual packages from %s...${NC}\n" "$section_name" >/dev/tty
    while IFS= read -r line; do
      # Skip empty lines and comments
      [[ -z $line || $line == \#* ]] && continue

      # Parse brews and casks from Brewfile
      if [[ $line == brew* ]]; then
        package=$(echo "$line" | awk '{print $2}' | tr -d '"')
        ask_specific_install "$package"
      elif [[ $line == cask* ]]; then
        cask=$(echo "$line" | awk '{print $2}' | tr -d '"')
        ask_specific_cask_install "$cask"
      fi
    done <"$file"
    ;;
  none)
    printf "${YELLOW}Skipping installation of %s.${NC}\n" "$section_name" >/dev/tty
    ;;
  *)
    printf "${YELLOW}Invalid choice. Defaulting to 'none' for %s.${NC}\n" "$section_name" >/dev/tty
    ;;
  esac
}

# Function to install selected packages and casks
perform_installations() {
  printf "\n${BLUE}Starting batch installation of selected packages and casks...${NC}\n" >/dev/tty

  # Install all selected packages
  if [[ ${#selected_packages[@]} -gt 0 ]]; then
    printf "${GREEN}Installing packages:${NC} %s\n" "${selected_packages[@]}" >/dev/tty
    for package in "${selected_packages[@]}"; do
      printf "${MAGENTA}Installing package:${NC} %s\n" "$package" >/dev/tty
      brew install "$package"
    done
  else
    printf "${YELLOW}No packages selected for installation.${NC}\n" >/dev/tty
  fi

  # Install all selected casks
  if [[ ${#selected_casks[@]} -gt 0 ]]; then
    printf "${GREEN}Installing casks:${NC} %s\n" "${selected_casks[@]}" >/dev/tty
    for cask in "${selected_casks[@]}"; do
      printf "${MAGENTA}Installing cask:${NC} %s\n" "$cask" >/dev/tty
      brew install --cask "$cask"
    done
  else
    printf "${YELLOW}No casks selected for installation.${NC}\n" >/dev/tty
  fi

  printf "${BLUE}Batch installation complete!${NC}\n" >/dev/tty
}

# Check for Homebrew installation
if ! command -v brew &>/dev/null; then
  printf "${RED}Homebrew not found. Installing Homebrew...${NC}\n" >/dev/tty
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  printf "${GREEN}Homebrew is already installed.${NC}\n" >/dev/tty
fi

# Start the selection process
printf "\n${BLUE}=== Package Selection ===${NC}\n" >/dev/tty

# IDE
printf "${MAGENTA}IDE & Terminal:${NC}\n" >/dev/tty
install_from_brewfile "$HOME/.config/brewfiles/Brewfile.ide" "IDE & Terminal"

# Developer tools
printf "\n${MAGENTA}Developer Tools:${NC}\n" >/dev/tty
install_from_brewfile "$HOME/.config/brewfiles/Brewfile.dev" "Developer tools"

# Developer tools
printf "\n${MAGENTA}Programming languages & Tools:${NC}\n" >/dev/tty
install_from_brewfile "$HOME/.config/brewfiles/Brewfile.langs" "Programming languages"

# Game tools
printf "\n${MAGENTA}Game Tools:${NC}\n" >/dev/tty
install_from_brewfile "$HOME/.config/brewfiles/Brewfile.game" "Game tools"

# Perform the batch installation
perform_installations

printf "\n${GREEN}Setup complete!${NC}\n" >/dev/tty
