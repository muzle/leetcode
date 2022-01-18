// https://leetcode.com/problems/merge-k-sorted-lists/

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

// Runtime: 1232 ms, faster than 26.64% of Swift online submissions for Merge k Sorted Lists.
// Memory Usage: 16.1 MB, less than 47.95% of Swift online submissions for Merge k Sorted Lists.
// O(m*n) where m - lists count, n - list lenght
class SolutionFirst {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        var lists = lists
        let resultList = ListNode()
        var resultListTail = resultList
        
        while true {
            var minIndex = 0
            var minValue = Int.max
            
            for index in lists.indices {
                guard
                    let value = lists[index]?.val,
                    value < minValue
                else { continue }
                minIndex = index
                minValue = value
            }
            
            guard let node = lists[minIndex] else { return resultList.next }
            resultListTail.next = node
            resultListTail = node
            lists[minIndex] = node.next
        }
    }
}

// Runtime: 111 ms, faster than 47.54% of Swift online submissions for Merge k Sorted Lists.
// Memory Usage: 15.5 MB, less than 98.36% of Swift online submissions for Merge k Sorted Lists.
// O(m*ln(n)) where m elements count, n - number of lists
class SolutionSecond {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        var lists = lists
        var endIndex = lists.endIndex - 1
        var startIndex = lists.startIndex
        
        while endIndex > lists.startIndex {
            startIndex = lists.startIndex
            while startIndex < endIndex {
                lists[startIndex] = merge(firstList: lists[startIndex], secondList: lists[endIndex])
                startIndex += 1
                endIndex -= 1
            }
        }
        
        return lists.first!
    }
    
    func merge(
        firstList: ListNode?,
        secondList: ListNode?
    ) -> ListNode? {
        let result = ListNode()
        var tail = result
        var firstList = firstList
        var secondList = secondList
        
        while firstList != nil && secondList != nil {
            if firstList!.val < secondList!.val {
                tail.next = firstList
                firstList = firstList?.next
            } else {
                tail.next = secondList
                secondList = secondList?.next
            }
            tail = tail.next!
        }
        
        tail.next = firstList ?? secondList
        return result.next
    }
}
