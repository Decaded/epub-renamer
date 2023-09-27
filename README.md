# Epub File Renamer Script

This handy Bash script is here to make renaming ePub files a breeze. It's designed to help you organize your digital book collection by following a specific naming pattern. Let's
dive into it!

<div align="center">
  <a href="https://github.com/Decaded/epub-renamer">
    <img src="https://img.shields.io/github/languages/code-size/Decaded/epub-renamer" alt="Code Size">
  </a>
  <a href="https://github.com/Decaded/epub-renamer/issues">
    <img src="https://img.shields.io/github/issues/Decaded/epub-renamer" alt="Open Issues">
  </a>
  <a href="https://github.com/Decaded/epub-renamer/pulls">
    <img src="https://img.shields.io/github/issues-pr/Decaded/epub-renamer" alt="Open PRs">
  </a>
  <a href="https://github.com/Decaded/epub-renamer/commits">
    <img src="https://img.shields.io/github/last-commit/Decaded/epub-renamer" alt="Last Commit">
  </a>
</div>

## Features

- **Automatic Renaming**: The script renames ePub files based on this naming pattern: `[folder name] v[XX].epub`, where `[XX]` is a two-digit volume number.
- **Skip Existing Names**: If a folder already follows this naming pattern, it won't be renamed.
- **User-Friendly**: Handles cases where it can't detect the volume number and asks for your input. You can also skip renaming in such cases.
- **Informative Messages**: The script provides clear and helpful messages during the renaming process.
- **Folder Listing**: It lists the folders it finds for processing in a user-friendly bullet point format.

## Usage

1. **Download the Script**: Click [here](https://raw.githubusercontent.com/Decaded/epub-renamer/master/renamer.sh) to download the script. Place it in the root folder where you
   have folders with files you want to rename.

- You can also use `wget`:

```sh
wget https://raw.githubusercontent.com/Decaded/epub-renamer/master/renamer.sh
```

2. **Make it Executable**: Open your terminal and navigate to the script's folder. Run this command to make the script executable:

```sh
chmod +x renamer.sh
```

3. **Run the Script**: Execute the script with:

```sh
./renamer.sh
```

## Folder Structure

This structure represents how your existing folder structure should be organized for the script to work effectively.

```sh
- My ePubs
  - Light Novel Series
    - Volume 01.epub
    - Volume 02.epub
    - Volume 03.epub

  - Another Light Novel
    - Volume 01.epub
    - Volume 02.epub
    - Volume 03.epub

  - Random Folder
    - Random File.epub

```

## Tested on Ubuntu

Please note that this script has been tested on Ubuntu systems. While it's likely to work on other Linux distributions, results on other operating systems may vary.

## Join the Fun

We're all ears! If you spot something funky or have ideas for making this script even cooler, share it with us via [issues](https://github.com/Decaded/epub-renamer/issues).

## License

This script is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
