#!/usr/bin/bash

# Problem 746
# Title: Min Cost Climbing Stairs
# Link: https://leetcode.com/problems/n-th-tribonacci-number/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 14:26:45 AEST

# Function to calculate the minimum cost to reach the top floor
# Arguments:
#   $1: The array of costs for each step
# Returns:
#   The minimum cost to reach the top floor
function minCostClimbingStairs() {
    local cost=("$@")  # Convert command-line arguments into an array
    local n=${#cost[@]}  # Get the size of the array

    # Initialize an array to store the minimum cost to reach each step
    local dp=()

    # Base case: The minimum cost to reach the first two steps is the cost itself
    dp[0]=${cost[0]}
    dp[1]=${cost[1]}

    # Calculate the minimum cost for each step starting from the third step
    for ((i = 2; i < n; i++)); do
        dp[i]=$(( cost[i] + (dp[i-1] < dp[i-2] ? dp[i-1] : dp[i-2]) ))
    done

    # The minimum cost to reach the top floor is the minimum of the last two steps
    local result=$(( dp[n-1] < dp[n-2] ? dp[n-1] : dp[n-2] ))

    echo $result
}

# Read the array of costs from the user
# Input: cost = [1, 100, 1, 1, 1, 100, 1, 1, 100, 1]
cost_array=(1 100 1 1 1 100 1 1 100 1)

# Calculate the minimum cost to reach the top floor
result=$(minCostClimbingStairs "${cost_array[@]}")

# Output the result
echo "Minimum cost to reach the top floor: $result"
