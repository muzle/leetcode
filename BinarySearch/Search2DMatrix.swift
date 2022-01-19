// https://leetcode.com/problems/search-a-2d-matrix/submissions/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var start = matrix.startIndex
        var finish = matrix.endIndex - 1
        
        while start <= finish {
            let midle = (finish + start) / 2
            let nums = matrix[midle]
            if nums.first! <= target && nums.last! >= target {
                return search(nums, target)
            } else if nums.last! > target {
                finish = midle - 1
            } else {
                start = midle + 1
            }
        }
        return false
    }
    
    private func search(_ nums: [Int], _ target: Int) -> Bool {
        var start = nums.startIndex
        var finish = nums.endIndex - 1
        
        while start <= finish {
            let midle = (finish + start) / 2
            let element = nums[midle]
            if element == target {
                return true
            } else if element > target {
                finish = midle - 1
            } else {
                start = midle + 1
            }
        }
        return false
    }
}
