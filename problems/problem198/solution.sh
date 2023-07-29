#!/usr/bin/bash

# Problem 198
# Title: House Robber
# Difficulty: Medium
# Link: https://leetcode.com/problems/house-robber/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 17:09:16 AEST

# Function to calculate the maximum amount of money you can rob without alerting the police
# Arguments:
#   $1: The array of money in each house
# Returns:
#   The maximum amount of money you can rob without alerting the police
function robHouses() {
    local nums=("$@")  # Convert command-line arguments into an array
    local n=${#nums[@]}  # Get the size of the array

    # Base cases: If there are no houses or only one house, return the money from that house
    if (( n == 0 )); then
        echo 0
        return
    elif (( n == 1 )); then
        echo "${nums[0]}"
        return
    fi

    # Initialize an array to store the maximum amount of money for each house
    local dp=()

    # Calculate the maximum amount of money for the first two houses
    dp[0]=${nums[0]}
    dp[1]=$(( nums[0] > nums[1] ? nums[0] : nums[1] ))

    # Calculate the maximum amount of money for each subsequent house
    for (( i = 2; i < n; i++ )); do
        dp[i]=$(( nums[i] + (dp[i-2] > dp[i-1] ? dp[i-2] : dp[i-1]) ))
    done

    # The last value in the dp array contains the maximum amount of money without alerting the police
    echo $(( dp[n-1] > dp[n-2] ? dp[n-1] : dp[n-2] ))
}

# Define the static array of money in each house
# Input: nums = [1, 2, 3, 1]
money_in_houses=(1 2 3 1)

# Calculate the maximum amount of money you can rob without alerting the police
result=$(robHouses "${money_in_houses[@]}")

# Output the result
echo "Maximum amount of money you can rob without alerting the police: $result"
