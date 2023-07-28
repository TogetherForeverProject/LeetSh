#!/usr/bin/bash

# Problem 1137
# Title: N-th Tribonacci Number
# Link: https://leetcode.com/problems/n-th-tribonacci-number/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 06:41:54 AEST

# Recursive function to calculate the Tribonacci number for a given value of n
# Arguments:
#   $1: The value of n
# Returns:
#   The Tribonacci number for the given value of n
function tribonacci() {
    local n=$1

    # Base cases: T(0) = 0, T(1) = 1, and T(2) = 1
    if (( n == 0 )); then
        echo 0
    elif (( n == 1 || n == 2 )); then
        echo 1
    else
        # Recursive step: T(n) = T(n-1) + T(n-2) + T(n-3)
        local t1
        local t2
        local t3
        t1=$(tribonacci $((n-1)))
        t2=$(tribonacci $((n-2)))
        t3=$(tribonacci $((n-3)))
        local result=$((t1 + t2 + t3))
        echo $result
    fi
}

# Read the value of n from the user
# Input: n = 4
n=4

# Calculate the Tribonacci number for the given value of n
result=$(tribonacci $n)

# Output the result
echo "T($n) = $result"

