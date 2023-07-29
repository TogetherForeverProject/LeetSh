#!/usr/bin/bash

# Problem 70
# Title: Climbing Stairs
# Difficulty: Easy
# Link: https://leetcode.com/problems/climbing-stairs/?envType=study-plan-v2&envId=dynamic-programming
# Last Executed: Sat, 2023-07-29 17:09:16 AEST

# Recursive function to calculate the number of distinct ways to climb n steps
# Arguments:
#   $1: The number of steps to climb (n)
# Returns:
#   The number of distinct ways to climb n steps
function climb_stairs() {
    local n=$1

    # Base case: if n is 0 or 1, there is only one way (no steps or one step)
    if (( n <= 1 )); then
        echo 1
    else
        # Recursive step: The number of ways to reach the nth step is the sum of the
        # ways to reach (n-1)th step and (n-2)th step (since you can take either one step or two steps)
        local ways=$(( $(climb_stairs $((n-1))) + $(climb_stairs $((n-2)))))
        echo $ways
    fi
}

# This is for user input
# read -p "Enter the number of steps: " num_steps

# Input: n = 2
num_steps=2

distinct_ways=$(climb_stairs "$num_steps")

echo "Number of distinct ways to climb $num_steps steps: $distinct_ways"
