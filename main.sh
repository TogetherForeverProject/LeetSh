#!/usr/bin/bash

function extract_title() {
  local problem_file=$1
  local title
  title=$(grep -Po "(?<=# Title: ).*" "$problem_file")
  echo "$title"
}

# Function to execute a single problem script
# Arguments:
#   $1: The problem number
function execute_problem_script() {
  local problem_number=$1
  local problem_script="problems/problem${problem_number}.sh"

  # Check if the problem file exists
  if [ ! -f "$problem_script" ]; then
    echo "Error: $problem_script not found."
    return
  fi

  # Check if the problem file is executable, if not, make it executable
  if [ ! -x "$problem_script" ]; then
    chmod +x "$problem_script"
  fi

  # Get the title from the problem file
  local title
  title=$(extract_title "$problem_script")

  local bold
  bold=$(tput bold)

  local normal
  normal=$(tput sgr0)

  local blue_color="\033[38;2;137;180;250m"
  local text_color="\033[38;2;180;190;254m"
  local reset="\033[0m"

  local top_title="Problem $problem_number | $title"
  local top_title_edited="${bold}${blue_color}Problem $problem_number${reset} | ${normal}${text_color}${title}${reset}"
  # local top_title_edited="${bold}${color}Problem $problem_number │ ${normal}$title"
  local top_title_length=${#top_title}

  # Calculate the number of dashes needed for the separator line
  local separator_length=$((top_title_length))  # 5 accounts for "Problem ", " | ", and " │ "

  echo -e "$top_title_edited"
  printf "─%.0s" $(seq 1 "$separator_length")
  echo

  # Get the current time
  local time_executed
  time_executed=$(date +"%a, %Y-%m-%d %H:%M:%S %Z")

  # Check if "Last Executed:" already exists in the problem file below the "# Link:" line
  if grep -q "# Link:" "$problem_script" && grep -q "# Last Executed:" "$problem_script"; then
    # If "# Link:" and "# Last Executed:" both exist, replace the "Last Executed" line with the new timestamp
    sed -i "s/# Last Executed:.*/# Last Executed: $time_executed/" "$problem_script"
  else
    # If "# Link:" does not exist or "# Last Executed:" does not exist, append the "Last Executed" line below the "# Link:" line
    sed -i "/# Link:/a # Last Executed: $time_executed" "$problem_script"
  fi

  # Extract the input from the problem file (if available)
  local input
  local input_color="\033[38;2;243;139;168m"
  input=$(grep -Po "(?<=# Input: ).*" "$problem_script")
  if [ -n "$input" ]; then
    echo -e "[${input_color}${bold} Input ${reset}]${normal} $input"
  fi

  # Execute the problem script and capture the output
  local output
  output=$(./"$problem_script")

  local output_color="\033[38;2;166;227;161m"

  # Print the output of the problem script with the "Last Executed" information appended or replaced accordingly
  echo -e "[${output_color}${bold} Output ${reset}]${normal} $output"
}

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <problem_number|all>"
  exit 1
fi

# Get the argument from the command-line
argument=$1

# Check if the argument is "all"
if [ "$argument" = "all" ]; then
  # Execute all problem scripts in the "problems/" directory
  for problem_script in problems/problem*.sh; do
    if [ -x "$problem_script" ]; then
      # Get the problem number from the file name (e.g., "problems/problem123.sh" -> "123")
      problem_number=${problem_script#problems/problem}
      problem_number=${problem_number%.sh}

      execute_problem_script "$problem_number"
      echo
    fi
  done
else
  # Execute a single problem script
  execute_problem_script "$argument"
fi
