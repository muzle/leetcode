// https://leetcode.com/problems/container-with-most-water/

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var start = height.startIndex
        var end = height.endIndex - 1
        
        while start < end {
            result = max(min(height[start], height[end]) * (end - start), result)
            
            if height[start] > height[end] {
                end -= 1
            } else {
                start += 1
            }
        }
        
        return result
    }
}
