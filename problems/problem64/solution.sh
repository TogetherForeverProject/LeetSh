#!/usr/bin/bash

# Title: Minimum Path Sum
# Difficulty: Medium
# Link: https://leetcode.com/problems/minimum-path-sum/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 17:09:16 AEST

# Function to calculate the minimum path sum in a grid
# Arguments:
#   $1: The grid (2D array) with non-negative numbers
# Returns:
#   The minimum path sum
function minPathSum() {
    local grid=("$@")
    local m=${#grid[@]}
    local n=${#grid[0]}

    # Create a 2D array to store the minimum path sum for each cell in the grid
    declare -A dp

    # Create a 2D array to store the path taken to reach each cell
    declare -A path

    # Initialize the first cell with its value
    dp[0,0]=${grid[0,0]}
    path[0,0]="[${grid[0,0]}]"

    # Initialize the first column and first row with the cumulative sums and paths
    for (( i = 1; i < m; i++ )); do
        dp[$i,0]=$((dp[$((i-1)),0] + grid[i,0]))
        path[$i,0]="${path[$((i-1)),0]} → [${grid[$i,0]}]"
    done
    for (( j = 1; j < n; j++ )); do
        dp[0,$j]=$((dp[0,$((j-1))] + grid[0,j]))
        path[0,$j]="${path[0,$((j-1))]} → [${grid[0,$j]}]"
    done

    # Calculate the minimum path sum and the path taken for each cell in the grid
    for (( i = 1; i < m; i++ )); do
        for (( j = 1; j < n; j++ )); do
            local left_sum=$((dp[$i,$((j-1))]))
            local top_sum=$((dp[$((i-1)),$j]))

            if (( left_sum <= top_sum )); then
                dp[$i,$j]=$((grid[i,j] + left_sum))
                path[$i,$j]="${path[$i,$((j-1))]} → [${grid[$i,$j]}]"
            else
                dp[$i,$j]=$((grid[i,j] + top_sum))
                path[$i,$j]="${path[$((i-1)),$j]} → [${grid[$i,$j]}]"
            fi
        done
    done

    local min_sum=${dp[$((m-1)),$((n-1))]}
    echo "$min_sum"
}

# Example Input: a 3x3 grid filled with non-negative numbers
# Define the grid as a 2D array
# Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
grid=(
    [0,0]=1 [0,1]=3 [0,2]=1
    [1,0]=1 [1,1]=5 [1,2]=1
    [2,0]=4 [2,1]=2 [2,2]=1
)

result=$(minPathSum "${grid[@]}")

echo "Minimum path sum: $result"
