#!/bin/bash

# Function to display usage instructions
function print_help() {
    echo "Usage: analyze_text.sh -f <file> -r <regex> [-count] [-h]"
    echo ""
    echo "Options:"
    echo "  -f <file>      Specify the input text file."
    echo "  -r <regex>     Provide a regular expression to search for."
    echo "  -count         (Optional) Count the occurrences of the regular expression instead of printing the matches."
    echo "  -h             Display this help message."
    exit 0
}

# Function to check if a file exists
function file_exists() {
    if [[ ! -f "$1" ]]; then
        echo "Error: File '$1' not found!"
        exit 1
    fi
}

# Function to search the file for the provided pattern
function search_file() {
    local file=$1
    local regex=$2
    local count_mode=$3

    if [[ "$count_mode" == "true" ]]; then
        # Count occurrences of the regex
        local matches=$(grep -Eo "$regex" "$file" | wc -l)
        echo "The pattern '$regex' was found $matches times in the file '$file'."
    else
        # Print matching lines
        echo "Lines containing the pattern '$regex' in the file '$file':"
        grep -E "$regex" "$file"
    fi
}

# Parse the input arguments
file=""
regex=""
count_mode="false"

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -f)
            file="$2"
            shift 2
            ;;
        -r)
            regex="$2"
            shift 2
            ;;
        -count)
            count_mode="true"
            shift 1
            ;;
        -h)
            print_help
            ;;
        *)
            echo "Unknown option: $1"
            print_help
            ;;
    esac
done

# Validate that both file and regex are provided
if [[ -z "$file" || -z "$regex" ]]; then
    echo "Error: Missing required arguments!"
    print_help
fi

# Check if the file exists
file_exists "$file"

# Search the file with the provided regex and options
search_file "$file" "$regex" "$count_mode"
