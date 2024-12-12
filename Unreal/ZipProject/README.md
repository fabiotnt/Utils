# ZIP Generator with .gitignore Support

-This script creates a ZIP file of your project while respecting the `.gitignore` file. It uses [7-Zip](https://www.7-zip.org/) to handle compression and exclusion of files or folders listed in `.gitignore`.
- I created this script to use with Unreal Engine projects, but as it uses the Git standard, it can be used in any project.


## Features

- Automatically excludes files and directories defined in your `.gitignore`.
- Creates a compressed `.zip` file for easy sharing.
- Simple and efficient, with minimal setup required.

## Requirements

- [7-Zip](https://www.7-zip.org/) installed on your system.
- A valid `.gitignore` file in the root of your project.
- Windows operating system (supports `.BAT` scripts).

## Usage

1. Clone or download this script to your project directory.
2. Ensure 7-Zip is installed and added to your system's PATH, or update the `ZIP_TOOL_PATH` variable in the script to the location of your `7z.exe`.
3. Run the script by double-clicking it or using the command line:
   ```bash
   ./zip_project.bat
4. The script will create a ZIP file named project.zip in the current directory.

## Customization

- To change the name of the output ZIP file, modify the ZIP_NAME variable in the script.
- To specify a different .gitignore file, update the GITIGNORE_PATH variable.
- If your project directory is not the script's current location, update the BASE_PATH variable.

## Limitations

- This script uses the .gitignore format but relies on 7-Zip for interpretation. Complex .gitignore patterns may require additional testing.
- Only works on Windows systems with 7-Zip installed.

## License

- This script is open-source and released under the MIT License. Feel free to modify and share it!

## Acknowledgments

- 7-Zip for the powerful compression tool.
- Git's .gitignore standard for simplifying project file management.
- This `README.md` provides clear instructions, customization options, and requirements for your script. Let me know if you'd like any changes! 🚀
