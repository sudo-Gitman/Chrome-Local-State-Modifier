**Chrome Local State Modifier**
This project contains a Bash script designed to modify the Google Chrome Local State file for macOS users. The script automates the process of enabling experimental flags, such as allowing invalid certificates for localhost.

**Features**
Process Management:

Terminates all Chrome processes before making changes.
Restarts Chrome automatically after modifications.
Local State File Update:

Updates the enabled_labs_experiments section in Chrome’s Local State JSON file.
Adds the experimental flag allow-insecure-localhost for all users on the macOS system.
Multi-User Support:

Iterates through all user accounts and applies the changes if Chrome is installed.
**Prerequisites**
macOS system.
Python 3 installed for modifying JSON files.
Administrator privileges to run the script.
**
How to Use**
Clone or Download this repository to your macOS system.
Make the Script Executable:

chmod +x chrome_local_state_modifier.sh
Run the Script with sudo:

sudo ./chrome_local_state_modifier.sh

**Observe the Output:**
The script provides progress messages, indicating whether the changes were applied successfully for each user.
Notes
Ensure all instances of Google Chrome are closed before running the script.
Test the script in a controlled environment before applying it to production systems.
File Structure
chrome_local_state_modifier.sh: The main script for modifying Chrome’s Local State file.
License
This project is licensed under the MIT License. See the LICENSE file for details.

**Author**
Developed by Sreerag For feedback or contributions, please visit https://github.com/sudo-Gitman.

