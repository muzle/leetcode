// https://leetcode.com/problems/add-two-numbers/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

// Runtime: 40 ms, faster than 86.77% of Swift online submissions for Add Two Numbers.
// Memory Usage: 14 MB, less than 50.67% of Swift online submissions for Add Two Numbers.
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        addTwoNumbers(l1, l2, remainder: nil)
    }
    
    private func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, remainder: Int? = nil) -> ListNode? {
        if l1 == nil && l2 == nil {
            guard let remainder = remainder else { return nil }
            return ListNode(remainder)
        }
        let first = l1?.val ?? 0
        let second = l2?.val ?? 0
        let remainder = remainder ?? 0
        let sum = first + second + remainder
        let value = sum % 10
        let nextRemainder = sum >= 10 ? sum / 10 : nil
        return ListNode(value, addTwoNumbers(l1?.next, l2?.next, remainder: nextRemainder))
    }
}
