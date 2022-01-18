// https://leetcode.com/problems/linked-list-cycle/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

// Runtime: 60 ms, faster than 89.14% of Swift online submissions for Linked List Cycle.
// Memory Usage: 16 MB, less than 11.90% of Swift online submissions for Linked List Cycle.

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var first = head
        var second = head
        
        while first != nil && second?.next != nil {
            first = first?.next
            second = second?.next?.next
            if first === second?.next {
                return true
            }
        }
        return false
    }
}
