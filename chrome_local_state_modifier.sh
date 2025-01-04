#!/bin/bash
# Kill all Chrome processes
echo "Killing Chrome processes..."
pkill -f "Google Chrome"

# Function to update the Chrome Local State file
update_chrome_local_state() {
  local user_home=$1
  local chromeLocalStateFile="$user_home/Library/Application Support/Google/Chrome/Local State"

  echo "Checking for Local State file at: $chromeLocalStateFile"

  # Check if the file exists
  if [ -f "$chromeLocalStateFile" ]; then
    echo "Local State file found for user $user_home. Modifying..."
    # Use Python to modify the JSON
    /usr/bin/python3 <<EOF
import json

chromeLocalStateFile = "$chromeLocalStateFile"

# Read the existing Local State file
with open(chromeLocalStateFile, "r") as file:
    local_state = json.load(file)

# Set the desired preference
local_state["browser"] = local_state.get("browser", {})
local_state["browser"]["enabled_labs_experiments"] = local_state["browser"].get("enabled_labs_experiments", [])
if "allow-insecure-localhost" not in local_state["browser"]["enabled_labs_experiments"]:
    local_state["browser"]["enabled_labs_experiments"].append("allow-insecure-localhost")

# Write the modified Local State file
with open(chromeLocalStateFile, "w") as file:
    json.dump(local_state, file, indent=4)

EOF

    echo "Chrome flag to allow invalid certificates for localhost has been set for user $user_home."
  else
    echo "Chrome Local State file not found for user $user_home."
  fi
}

# Iterate over all user home directories
for user_home in /Users/*; do
  if [ -d "$user_home/Library/Application Support/Google/Chrome" ]; then
    update_chrome_local_state "$user_home"
  else
    echo "Chrome directory not found for user $user_home."
  fi
done

# Kill Chrome processes
echo "Killing Chrome processes..."
pkill -f "Google Chrome"

# Restart Chrome
echo "Relaunching Chrome..."
open -a "Google Chrome"

exit 0
