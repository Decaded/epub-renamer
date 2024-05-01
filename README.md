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

## Bash version

1. **Download the Script**: Click [here](https://raw.githubusercontent.com/Decaded/epub-renamer/master/Bash/renamer.sh) to download the script. Place it in the root folder where you
   have folders with files you want to rename.

- You can also use `wget`:

```sh
wget https://raw.githubusercontent.com/Decaded/epub-renamer/master/Bash/renamer.sh
```

2. **Make it Executable**: Open your terminal and navigate to the script's folder. Run this command to make the script executable:

```sh
chmod +x renamer.sh
```

3. **Run the Script**: Execute the script with:

```sh
./renamer.sh
```

## Python version (Linux and Windows)

If you prefer using Python, you can also utilize the script provided in the `./Python` folder. Follow the steps below to rename your ePub files using Python:

1. **Download the Python Script**: Navigate to the [Python folder](./Python) in the project repository and download the `renamer.py` file. 
Or you can use the following commands in your terminal or command prompt:

  - **For Linux**:

  ```sh
  wget https://raw.githubusercontent.com/Decaded/epub-renamer/master/Python/renamer.py
  ```
  - **For Windows**:

  ```curl
  curl -O https://raw.githubusercontent.com/Decaded/epub-renamer/master/Python/renamer.py
  ```

2. **Run the Python Script**: Place it in the root folder where you have folders with files you want to rename. Open your terminal, navigate to the folder where you placed `renamer.py`, and execute the script using Python 3:

  ```sh
  python3 renamer.py
  ```
Alternatively, if you're using Windows, you can execute the script by double-clicking on it.

3. **Follow the Prompts**: The Python script will guide you through the renaming process, providing instructions and asking for user input when necessary.
4. **Enjoy the Renamed ePub Files**: Sit back and enjoy your organized digital book collection!

⚠️ **Note**: the Python script offers the same functionality as the Bash script but may be more convenient for users comfortable with Python programming.
## Folder Structure

This structure represents how your existing folder structure should be organized for the script to work:

```sh
- My ePubs/
  - Light Novel Series/
    - Some Title v01.epub
    - Some Title v02.epub
    - Some Title v03.epub

  - Another Light Novel/
    - Some Title v01.epub
    - Some Title v02.epub
    - Some Title v03.epub

  - Random Folder/
    - Random File.epub
```

This structure represents how the script works, based on the structure above:

```sh
- My ePubs/
  - Light Novel Series/
    - Light Novel Series v01.epub
    - Light Novel Series v02.epub
    - Light Novel Series v03.epub

  - Another Light Novel/
    - Another Light Novel v01.epub
    - Another Light Novel v02.epub
    - Another Light Novel v03.epub

  - Random Folder/
    - Random File.epub # script will ask what to do with this file
```

## Tested on Ubuntu and Windows 11

Please note that this script has been tested on Ubuntu and Windows 11 systems. While it's likely to work on other Linux and Windows distributions, results on other operating systems may vary.

## Join the Fun

We're all ears! If you spot something funky or have ideas for making this script even cooler, share it with us via [issues](https://github.com/Decaded/epub-renamer/issues).

## License

This script is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
