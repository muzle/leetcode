// https://leetcode.com/problems/binary-search/submissions/

// Solution using recusrion

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(
            start: nums.startIndex,
            end: nums.endIndex - 1,
            array: nums,
            target: target
        )
    }
    
    private func binarySearch(
        start: Int,
        end: Int,
        array: [Int],
        target: Int
    ) -> Int {
        guard end >= start else { return -1 }
        let midle = (end + start) / 2
        let element = array[midle]
        if element == target {
            return midle
        } else if element > target {
            return binarySearch(
                start: start,
                end: midle - 1,
                array: array,
                target: target
            )
        } else {
            return binarySearch(
                start: midle + 1,
                end: end,
                array: array,
                target: target
            )
        }
    }
}

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = nums.startIndex
        var finish = nums.endIndex - 1
        
        while start <= finish {
            let midle = (finish + start) / 2
            let element = nums[midle]
            if element == target {
                return midle
            } else if element > target {
                finish = midle - 1
            } else {
                start = midle + 1
            }
        }
        return -1
    }
}
