#!/usr/bin/bash

# Problem 62
# Title: Unique Paths
# Difficulty: Medium
# Link: https://leetcode.com/problems/unique-paths/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 15:50:30 AEST

# Function to calculate the number of unique paths from the top-left corner to the bottom-right corner
# Arguments:
#   $1: The number of rows (m)
#   $2: The number of columns (n)
# Returns:
#   The number of unique paths
function uniquePaths() {
    local m=$1
    local n=$2

    # Create a 2D array to store the number of unique paths
    declare -A dp

    # Base cases: there is only one way to reach the starting cell
    dp[0,0]=1

    # Initialize the first column and first row to 1
    for (( i = 1; i < m; i++ )); do
        dp[$i,0]=1
    done
    for (( j = 1; j < n; j++ )); do
        dp[0,$j]=1
    done

    # Calculate the number of unique paths for each cell in the grid
    for (( i = 1; i < m; i++ )); do
        for (( j = 1; j < n; j++ )); do
            dp[$i,$j]=$(( dp[$((i-1)),$j] + dp[$i,$((j-1))] ))
        done
    done

    echo "${dp[$((m-1)),$((n-1))]}"
}

# Input: m = 3, n = 7
# Define the number of rows (m) and columns (n)
m=3
n=7

# Calculate the number of unique paths
result=$(uniquePaths $m $n)

# Output the result
echo "Number of unique paths: $result"
