#!/usr/bin/bash

# Problem 509
# Title: Fibonacci Number
# Difficulty: Easy
# Link: https://leetcode.com/problems/fibonacci-number/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 17:09:16 AEST

# Recursive function to calculate the Fibonacci number for a given value of n
# Arguments:
#   $1: The value of n
# Returns:
#   The Fibonacci number for the given value of n
function fib() {
    local n=$1

    # Base cases: F(0) = 0 and F(1) = 1
    if (( n == 0 )); then
        echo 0
    elif (( n == 1 )); then
        echo 1
    else
        # Recursive steps: F(n) = F(n-1) + F(n-2)
        local f1
        local f2
        f1=$(fib $((n-1)))
        f2=$(fib $((n-2)))
        local result=$((f1 + f2))
        echo $result
    fi
}

# Input: n = 2
n=2

# Calculate the Fibonacci number for the given value of n
result=$(fib "$n")

echo "F($n) = $result"
