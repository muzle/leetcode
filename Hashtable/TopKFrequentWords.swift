// https://leetcode.com/problems/top-k-frequent-words/

class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var dict = [String: Int]()
        for word in words {
            dict[word, default: 0] += 1
        }
        
        return Array(
            dict
                .sorted(by: { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value })
                .map { $0.key }
                .prefix(k)
        )
    }
}
