# 740. Delete and Earn

<span style="color:rgb(255, 196, 45);">Medium</span>

You are given an integer array `nums`. You want to maximize the number of points you get by performing the following operation any number of times:

- Pick any `nums[i]` and delete it to earn `nums[i]` points. Afterwards, you must delete **every** element equal to `nums[i] - 1` and **every** element equal to `nums[i] + 1`.

Return *the **maximum number of points** you can earn by applying the above operation some number of times*.

<p>
    <strong>Example 1</strong>
</p>
<pre>
    <strong>Input:</strong> nums = [3,4,2]
    <strong>Output:</strong> 6
    <strong>Explanation:</strong> You can perform the following operations:
    - Delete 4 to earn 4 points. Consequently, 3 is also deleted. nums = [2].
    - Delete 2 to earn 2 points. nums = [].
    You earn a total of 6 points.
</pre>

<p>
    <strong>Example 2</strong>
</p>
<pre>
    <strong>Input:</strong> nums = [2,2,3,3,3,4]
    <strong>Output:</strong> 9
    <strong>Explanation:</strong> You can perform the following operations:
    - Delete a 3 to earn 3 points. All 2's and 4's are also deleted. nums = [3,3].
    - Delete a 3 again to earn 3 points. nums = [3].
    - Delete a 3 once more to earn 3 points. nums = [].
    You earn a total of 9 points.
</pre>

<p>
    <strong>Constraints:</strong>
<p>

- <code>2 <= nums.length <= 2 * 10<sup>4</sup></code>
- <code>1 <= nums[i] <= 10<sup>4</sup></code>