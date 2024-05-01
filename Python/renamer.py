import os
import re

# Define color codes for formatting output
class Color:
    ORANGE = '\033[0;33m'
    BLUE = '\033[1;34m'
    GREEN = '\033[0;32m'
    RED = '\033[0;31m'
    NC = '\033[0m'  # No color

# Function to display a warning message
def display_warning_message():
    os.system('cls' if os.name == 'nt' else 'clear')
    print(f"{Color.ORANGE}[!][Warning]{Color.NC}")
    print("This script is designed to rename epub files in folders based on specific criteria.")
    print("It will search for folders containing epub files and rename them according to the folder's name.")
    print("Please be aware of the following:")
    print("- This script will rename files according to the naming pattern: '[folder name] v[XX].epub', where '[XX]' represents a two-digit volume number.")
    print("- If a folder already follows this naming pattern, it will be skipped.")
    print("- The script looks for 'v[XX]' in file names and uses it for renaming.")
    print("- If 'v[XX]' is not found in a file name, the script will ask for user confirmation.")
    print("- Always have a backup of your data before using this script.")
    print("- Use this script only on folders where you are certain about the naming pattern.")
    print("Proceed with caution and make sure you understand the potential consequences.")
    proceed = input(f"[{Color.ORANGE}!{Color.NC}] Do you want to proceed? (Y/n): ").strip().lower()
    if proceed not in ['n', 'no']:
        os.system('cls' if os.name == 'nt' else 'clear')
        list_folders()
    else:
        print(f"[{Color.ORANGE}I{Color.NC}] Script aborted.")

# Function to list all folders found as a bullet list
def list_folders():
    root_folder = os.path.abspath(os.path.dirname(__file__))
    root_folder_name = os.path.basename(root_folder)

    found_folders = 0
    print(f"Folders found in \"{root_folder_name}\":")
    for folder in os.listdir(root_folder):
        if os.path.isdir(os.path.join(root_folder, folder)):
            print(f"  • {folder}")
            found_folders += 1

    if found_folders == 0:
        print(f"[{Color.ORANGE}I{Color.NC}] No folders found to process.")

    proceed = input(f"[{Color.ORANGE}!{Color.NC}] Do you want to proceed? (Y/n): ").strip().lower()
    if proceed not in ['n', 'no']:
        os.system('cls' if os.name == 'nt' else 'clear')
        run_script()
    else:
        print(f"[{Color.ORANGE}I{Color.NC}] Script aborted.")

# Function to rename epub files in a folder
def rename_epub_files(folder):
    folder_name = os.path.basename(folder)
    print(f"[{Color.BLUE}I{Color.NC}] Checking folder \"{folder_name}\"")

    changed_files = 0
    skipped_files = 0

    for filename in os.listdir(folder):
        if filename.endswith('.epub'):
            base_name, ext = os.path.splitext(filename)
            match = re.match(r'.*v(\d{2})', base_name)
            if match:
                volume = match.group(1)
                new_name = f"{folder_name} v{volume}.epub"
                if filename != new_name:
                    try:
                        os.rename(os.path.join(folder, filename), os.path.join(folder, new_name))
                        changed_files += 1
                        print(f"[{Color.GREEN}✓{Color.NC}] File renamed: \"{filename}\" to \"{new_name}\"")
                    except Exception as e:
                        print(f"[{Color.RED}✗{Color.NC}] Failed to rename: \"{filename}\" ({e})")
            else:
                volume = input(f"[{Color.ORANGE}!{Color.NC}] Cannot detect volume number for \"{filename}\". Please input it (press Enter to skip): ")
                if volume.strip() != '':
                    new_name = f"{folder_name} v{volume}.epub"
                    try:
                        os.rename(os.path.join(folder, filename), os.path.join(folder, new_name))
                        changed_files += 1
                        print(f"[{Color.GREEN}✓{Color.NC}] File renamed: \"{filename}\" to \"{new_name}\"")
                    except Exception as e:
                        print(f"[{Color.RED}✗{Color.NC}] Failed to rename: \"{filename}\" ({e})")
                else:
                    print(f"[{Color.ORANGE}!{Color.NC}] Skipped renaming \"{filename}\"")
                    skipped_files += 1

    if changed_files > 0:
        print(f"[{Color.GREEN}✓{Color.NC}] Renamed {changed_files} file(s) in \"{folder_name}\"")
    elif skipped_files == 0:
        print(f"[{Color.ORANGE}I{Color.NC}] No files to rename in \"{folder_name}\"")

# Main function to execute the script
def run_script():
    root_folder = os.path.abspath(os.path.dirname(__file__))
    for folder in os.listdir(root_folder):
        if os.path.isdir(os.path.join(root_folder, folder)):
            rename_epub_files(os.path.join(root_folder, folder))

# Call the main script function
display_warning_message()
