# *system-details-multilevel* 

This Bash script gathers system details based on the specified detail level (1, 2, or 3) and provides the option to save the information to a log file. It is recommended to run the script from the terminal.

Usage:

1. Open a terminal.
2. Navigate to the directory containing the script.
3. Run the script using the following command (if running the latest version 1.1-bash)

        ./system-details-multilevel-1.1-bash.sh

# INFO: For detail levels 2 and 3, and for writing to some directories, root privileges are required (use *sudo* then).

Detail Levels

    Level 1: Basic system information.
    Level 2: Detailed system and hardware information.
    Level 3: Advanced system, hardware, driver, and firmware information.

After displaying the information, the script prompts whether to save the log. If chosen, it asks for the location and filename for the log. If the specified directory does not exist, it is created.

*(Displayed/Saved in log file) data can be used for system diagnostics or simply for information.*
