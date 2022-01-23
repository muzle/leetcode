//https://leetcode.com/problems/partition-labels/

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var indexies = [Int](repeating: 0, count: 26)
        
        let characterOffset = Character("a").asciiValue!
        for (index, character) in s.enumerated() {
            indexies[Int(character.asciiValue! - characterOffset)] = index
        }
        
        var result = [Int]()
        var endIndex = 0
        var start = 0
        for (index, character) in s.enumerated() {
            endIndex = max(endIndex, indexies[Int(character.asciiValue! - characterOffset)])
            if endIndex == index {
                result.append(index - start + 1)
                start = index + 1
            }
        }
        
        return result
    }
}
