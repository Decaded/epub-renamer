#!/bin/bash

# Define color codes for blue (info), green (success), red (error), and orange (warning)
BLUE='\033[1;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No color

# Function to display a warning message
display_warning_message() {
  clear
  echo -e "${ORANGE}[!][Warning]${NC}"
  echo -e "This script is designed to rename epub files in folders based on specific criteria."
  echo -e "It will search for folders containing epub files and rename them according to the folder's name."
  echo -e "Please be aware of the following:"
  echo -e "- This script will rename files according to the naming pattern: '[folder name] v[XX].epub', where '[XX]' represents a two-digit volume number."
  echo -e "- If a folder already follows this naming pattern, it will be skipped."
  echo -e "- The script looks for 'v[XX]' in file names and uses it for renaming."
  echo -e "- If 'v[XX]' is not found in a file name, the script will ask for user confirmation."
  echo -e "- Always have a backup of your data before using this script."
  echo -e "- Use this script only on folders where you are certain about the naming pattern."
  echo -e "Proceed with caution and make sure you understand the potential consequences."
  echo -e "[${ORANGE}!${NC}] Do you want to proceed? (Y/n): "

  read -p "" proceed
  if [[ ! "$proceed" =~ ^[nN] ]]; then
    clear
    list_folders
  else
    echo -e "[${ORANGE}I${NC}] Script aborted."
  fi
}

# Function to list all folders found as a bullet list
list_folders() {
  # Define the root folder as the folder where the script is located
  root_folder=$(cd "$(dirname "$0")" && pwd)  # Get the absolute path of the script's folder
  root_folder_name=$(basename "$root_folder") # Get the name of the root folder

  found_folders=0
  echo -e "Folders found in \"$root_folder_name\":"
  for folder in "$root_folder"/*; do
    if [ -d "$folder" ]; then
      folder_name=$(basename "$folder")
      echo -e "  • $folder_name"
      found_folders=$((found_folders + 1))
    fi
  done
  if [ "$found_folders" -eq 0 ]; then
    echo -e "[${ORANGE}I${NC}] No folders found to process."
  fi

  echo -e "[${ORANGE}!${NC}] Do you want to proceed? (Y/n): "
  read -p "" proceed
  if [[ ! "$proceed" =~ ^[nN] ]]; then
    clear
    run_script
  else
    echo -e "[${ORANGE}I${NC}] Script aborted."
  fi
}

# Function to rename epub files in a folder
rename_epub_files() {
  folder="$1"
  folder_name=$(basename "$folder") # Get the folder name as the title
  echo -e "[${BLUE}I${NC}] Checking folder \"$folder_name\""

  changed_files=0 # Count of changed files
  skipped_files=0 # Count of skipped files

  for file in "$folder"/*.epub; do
    if [ -f "$file" ]; then
      filename=$(basename "$file")
      base_name="${filename%.*}" # Remove file extension

      if [[ $base_name =~ v([0-9]{2}) ]]; then
        volume="${BASH_REMATCH[1]}"
        new_name="${folder_name} v${volume}.epub"

        if [ "$file" != "$folder/$new_name" ]; then
          if mv "$file" "$folder/$new_name"; then
            changed_files=$((changed_files + 1))
            echo -e "[${GREEN}✓${NC}] File renamed: \"$filename\" to \"$new_name\""
          else
            echo -e "[${RED}✗${NC}] Failed to rename: \"$filename\""
          fi
        fi

      elif [[ $base_name =~ ([0-9]{2}) && ! $base_name =~ v[0-9]{2} ]]; then
        volume="${BASH_REMATCH[1]}"
        new_name="${folder_name} v${volume}.epub"
        placeholder_name="${folder_name} v.epub"

        # Display the original and new names on separate lines with an orange exclamation mark
        echo -e "[${ORANGE}!${NC}] Original Name: \"$filename\"\n[${ORANGE}!${NC}] New Name: \"$placeholder_name\""
        echo -e "[${ORANGE}!${NC}] Cannot detect volume number, please input it (press Enter to skip): "

        # Ask for user confirmation or provide volume number
        read -p "" choice
        case "$choice" in
        [0-9][0-9])
          new_name="${folder_name} v${choice}.epub"
          if mv "$file" "$folder/$new_name"; then
            changed_files=$((changed_files + 1))
            echo -e "[${GREEN}✓${NC}] File renamed: \"$filename\" to \"$new_name\""
          else
            echo -e "[${RED}✗${NC}] Failed to rename: \"$filename\""
          fi
          ;;
        *)
          echo -e "[${ORANGE}!${NC}] Skipped renaming \"$filename\""
          skipped_files=$((skipped_files + 1))
          ;;
        esac
      else
        skipped_files=$((skipped_files + 1))
      fi

    fi
  done

  if [ $changed_files -gt 0 ]; then
    echo -e "[${GREEN}✓${NC}] Renamed $changed_files file(s) in \"$folder_name\""
  elif [ $skipped_files -eq 0 ]; then
    echo -e "[${ORANGE}I${NC}] No files to rename in \"$folder_name\""
  fi
}

# Main function to execute the script
run_script() {
  # Function to process folders
  for folder in "$root_folder"/*; do
    if [ -d "$folder" ]; then
      rename_epub_files "$folder"
    fi
  done
}

# Call the main script function
display_warning_message
