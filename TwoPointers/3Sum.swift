// https://leetcode.com/problems/3sum/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        let sortedNums = nums.sorted()
        var result = [[Int]]()
        var lastValue: Int?
        
        for i in 0 ..< sortedNums.count where sortedNums[i] != lastValue {
            var j = i + 1
            var p = sortedNums.count - 1
            
            let current = sortedNums[i]
            
            while j < p {
                let first = sortedNums[j]
                let second = sortedNums[p]
                let sum = current + first + second
                if sum == 0 {
                    result.append([first, second, current])
                    j += 1
                    p -= 1
                    while j < p, sortedNums[j] == sortedNums[j-1] {
                        j += 1
                    }
                } else if sum < 0 {
                    j += 1
                } else {
                    p -= 1
                }
            }
            
            lastValue = current
        }
        
        return result
    }
}
