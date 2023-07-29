# 62. Unique Paths

<span style="color:rgb(255, 196, 45);">Medium</span>

There is a robot on an `m x n` grid. The robot is initially located at the **top-left corner** (i.e., `grid[0][0]`). The robot tries to move to the **bottom-right corner** (i.e., `grid[m - 1][n - 1]`). The robot can only move either down or right at any point in time.

Given the two integers `m` and `n`, return *the number of possible unique paths that the robot can take to reach the bottom-right corner*.

The test cases are generated so that the answer will be less than or equal to <code>2 * 10<sup>9</sup></code>.

<p>
    <strong>Example 1</strong>
</p>
<img src="../../assets/problem62.png" style="width: 400px; height: 183px;">
<pre>
    <strong>Input:</strong> m = 3, n= 7
    <strong>Output:</strong> 28
</pre>

<p>
    <strong>Example 2</strong>
</p>
<pre>
    <strong>Input:</strong> m = 3, n = 2
    <strong>Output:</strong> 3
    <strong>Explanation:</strong> From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
    1. Right -> Down -> Down
    2. Down -> Down -> Right
    3. Down -> Right -> Down
</pre>

<p>
    <strong>Constraints:</strong>
<p>

- `1 <= m, n <= 100`