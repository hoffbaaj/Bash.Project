# Bash-Project

Text Analyzer Project

Overview:

The Text Analyzer Script is a simple Bash utility that allows you to analyze text files by searching for regular expressions and optionally counting occurrences of the matches. This tool is ideal for quickly processing log files, searching for specific patterns, or analyzing textual data based on user-defined regular expressions.


Features:

    Regular Expression Matching: Search for any pattern using a regular expression within a text file.
    Count Mode: Use the -count option to count how many times the pattern appears in the file.
    Help Command: Provides detailed usage instructions via the -h option.
    Error Handling: Gracefully handles invalid input files or missing arguments.
    Requirements
    Bash: The script requires Bash (version 4.x or higher) to run.
    grep: The script uses grep to search for patterns.
    This script works on Linux, macOS, and Windows via WSL or Git Bash.
    

Arguments:

    -i <input file>: Specifies the input CSV to be processed.
    -o <output_file>: (optional) Specifies the output CSV file. If not file is recorded, the script will output the results to the terminal.
    -f <filter>: (optional) A filter to apply to a specific columns/row using regilar expressions (Example: column_name=^pattern$)
    -s <sort_column>: (optional)The column by which to start the rows.
    -calc <sum|avg> (optional) Calculates the sum or average of a specific column.


Installation:

    Clone this repository or download the text_analyzer.sh script:

        git clone https://github.com/yourusername/text-analyzer-script.git
        cd text-analyzer-script
    
    Make the script executable by running:

        chmod +x text_analyzer.sh

    
Usage:
    
    The basic usage of the script is as follows:

    ./text_analyzer.sh -f <file> -r <regex> [-count] [-h]

Options
-f <file>: Specify the input text file to be analyzed.
-r <regex>: Provide a regular expression to search for.
-count: (Optional) Count how many times the pattern appears, instead of printing the matched lines.
-h: Display the help message with usage details.

Error Handling:

The script handles errors such as:

Missing required arguments (file or regular expression).
Specified file does not exist.
Invalid options or arguments.
Example of an error message when the input file is missing:

    Error: File 'myfile.txt' not found!
