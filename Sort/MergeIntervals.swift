// https://leetcode.com/submissions/detail/628529714/

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        for interval in intervals {
            if
                let last = result.last,
                last[1] >= interval[0] {
                result[result.endIndex - 1] = [last[0], max(last[1], interval[1])]
            } else {
                result.append(interval)
            }
        }
        return result
    }
}
