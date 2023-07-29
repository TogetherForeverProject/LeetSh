#!/usr/bin/bash

# Problem 740
# Title: Delete and Earn
# Difficulty: Medium
# Link: https://leetcode.com/problems/delete-and-earn/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 15:58:39 AEST

# Function to check if an element exists in an array
# Arguments:
#   $1: The element to check
#   $2: The array to search in
# Returns:
#   0 if the element exists in the array, 1 otherwise
function containsElement() {
    local element="$1"
    shift
    local arr=("$@")
    for item in "${arr[@]}"; do
        if [[ "$item" == "$element" ]]; then
            return 0
        fi
    done
    return 1
}

# Function to calculate the maximum number of points you can earn by performing the operation
# Arguments:
#   $1: The array of numbers
# Returns:
#   The maximum number of points you can earn
function deleteAndEarn() {
    local nums=("$@")  # Convert command-line arguments into an array
    local n=${#nums[@]}  # Get the size of the array

    # Create an associative array to store the frequency of each number
    declare -A dic

    # Calculate the frequency of each number
    for (( i = 0; i < n; i++ )); do
        (( dic[${nums[i]}]+=nums[i] ))
    done

    # Create a new sorted list with unique numbers
    local newList=()
    for num in "${nums[@]}"; do
        containsElement "$num" "${newList[@]}"
        if (( $? == 1 )); then
            newList+=("$num")
        fi
    done

    # Sort the new list numerically
    mapfile -t newList < <(printf '%s\n' "${newList[@]}" | sort -n)

    # Calculate the points
    local point=()
    local prev=0
    local N=${#newList[@]}
    for (( i = 1; i < N; i++ )); do
        if (( newList[i] - newList[i-1] > 1 )); then
            point+=("$i")
        fi
    done
    if (( ${#point[@]} == 0 )) || (( point[-1] != N )); then
        point+=("$N")
    fi

    local earning=0
    for indx in "${point[@]}"; do
        local dp=(-1000000000000 -1000000000000)
        for (( i = prev; i < indx; i++ )); do
            if (( i == prev )); then
                dp[0]=${dic[${newList[i]}]}
            elif (( i == prev+1 )); then
                dp[1]=${dic[${newList[i]}]}
            else
                temp=${dp[1]}
                dp[1]=$(( dic[${newList[i]}] > dp[0]+dic[${newList[i]}] ? dic[${newList[i]}] : dp[0]+dic[${newList[i]}] ))
                dp[0]=$(( temp > dp[0] ? temp : dp[0] ))
            fi
        done
        (( earning += (dp[0] > dp[1] ? dp[0] : dp[1]) ))
        prev=$indx
    done

    echo $earning
}

# Define the input array of numbers
# Input: nums = [2, 2, 3, 3, 3, 4]
nums=(2 2 3 3 3 4)

# Calculate the maximum number of points you can earn
result=$(deleteAndEarn "${nums[@]}")

# Output the result
echo "Maximum number of points you can earn: $result"

