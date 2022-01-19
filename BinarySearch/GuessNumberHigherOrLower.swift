// https://leetcode.com/problems/guess-number-higher-or-lower/submissions/

/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if the picked number is lower than your guess number
 *                  1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        search(0, n, check: guess)
    }
    
    private func search(_ start: Int, _ finish: Int, check: (Int) -> Int) -> Int {
        var start = 0
        var finish = finish
        
        while start <= finish {
            let midle = (finish + start) / 2
            let element = check(midle)
            if element == 0 {
                return midle
            } else if element == -1 {
                finish = midle - 1
            } else {
                start = midle + 1
            }
        }
        return -1
    }
}
