import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    
    var ans = [Int :Int]()
    
    tangerine.forEach { tan in
        if let _ = ans[tan] {
            ans[tan]! += 1
        }
        else {
            ans[tan] = 1
        }
    }
    
    let ans2 = ans.sorted {
        if $0.1 == $1.1 {
            return $0.0 < $1.0
        }
        return $0.1 > $1.1
    }
    
    var res = 0
    var count = k
    
    for dic in ans2 {
        if count >= dic.value {
            res += 1
            count -= dic.value
        }
        else {
            break
        }
    }
    
    if count != 0 {
        res += 1
    }

    return res
}
