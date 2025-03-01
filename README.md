# Winget Auto Update Script

This PowerShell script automates the process of updating installed applications using **Winget** and logs the results to a file.

## Features

- Checks for available updates using `winget upgrade`.
- Logs all actions and results to a log file.
- Automatically updates all installed packages.
- Provides error detection and logging for troubleshooting.

## Prerequisites

Ensure that you have the following installed and configured:

- Windows Package Manager (**Winget**) installed.
- PowerShell 5.1 or later.
- Administrative privileges (some updates may require admin rights).

## Installation

1. Download the script or copy the contents into a new PowerShell file, e.g., `winget_update.ps1`.
2. Save the script in a convenient location.

## Usage

### Running the Script

1. Open PowerShell **as Administrator**.
2. Navigate to the script location:
   ```powershell
   cd "C:\Path\To\Script"
   ```
3. Execute the script:
   ```powershell
   .\winget_update.ps1
   ```

## Automating with Task Scheduler

You can automate this script using Windows Task Scheduler.

### Suggested Task Scheduler Settings:

- **Task Name:** `winget_update`
- **Run Whether User is Logged On or Not**
- **Run with Highest Privileges**
- **Triggers:** Weekly on **Sunday and Wednesday at 19:30 PM**
- **Program:** `powershell.exe`
- **Arguments:** `-ExecutionPolicy Bypass -File "C:\Scripts\winget_update.ps1"`
- **Additional Settings:**
  - Allow task to be run on demand
  - Run as soon as possible if missed schedule
  - If task fails, restart every 30 minutes (up to 4 times)
  - Stop task if running longer than 3 days

## Logging

- The script logs all actions and results to a log file located at:
  ```
  %USERPROFILE%\winget_update_log.txt
  ```
- The log includes timestamps, update results, and any errors encountered.

## Expected Output

- If no updates are available:
  ```
  No updates available.
  ```
- If updates are found, they will be installed automatically, and results will be logged.
- If any updates fail, an error message will be recorded in the log file.

## Troubleshooting

- If updates fail, check the log file for details.
- Ensure Winget is installed and properly configured by running:
  ```powershell
  winget --version
  ```
- Run PowerShell as Administrator if required updates fail due to permission issues.

## License

This script is provided under the [MIT License](LICENSE).

## Contributions

Feel free to fork, modify, and submit pull requests to improve the script.

---
