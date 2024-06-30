import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var sor_lotto = lottos.sorted()
    var sor_winNum = win_nums.sorted()
    var corr0 = 0
    var corr = 0
    var index1 = 0
    var index2 = 0
    
    let ans = [6:1, 5:2, 4:3, 3:4, 2:5]
    
    while true {
        if index1 == lottos.count || index2 == lottos.count {
            break
        }
        
        if sor_lotto[index1] == 0 {
            corr0 += 1
            index1 += 1
        }
        else {
            if sor_lotto[index1] == sor_winNum[index2] {
                corr += 1
                index1 += 1
                index2 += 1
            }
            else if sor_lotto[index1] > sor_winNum[index2] {
                index2 += 1
            }
            else if sor_lotto[index1] < sor_winNum[index2] {
                index1 += 1
            }
        }
        
    }
    
    let ans1 = ans[corr + corr0] == nil ? 6 : ans[corr + corr0]!
    let ans2 = ans[corr] == nil ? 6 : ans[corr]!

    return [ans1, ans2]
}
