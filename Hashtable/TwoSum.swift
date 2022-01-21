// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (index, element) in nums.enumerated() {
            let dif = target - element
            if let remainderIndex = dict[dif] {
                return [remainderIndex, index]
            }
            dict[element] = index
        }
        return []
    }
}
