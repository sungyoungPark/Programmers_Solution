import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var myToday = today.components(separatedBy: ".").map { Int($0)! }
    
    var termsDic = [String : Int]()
    
    terms.forEach { term in
        let t = term.components(separatedBy: " ")
        termsDic[t[0]] = Int(t[1])
    }
    var ans = [Int]()
    var index = 0
    privacies.forEach { privacy in
        index += 1
        let priArr = privacy.components(separatedBy: " ")
        let date = priArr[0].components(separatedBy: ".").map { Int($0)! }
        
        let key = priArr[1]
        let myTerm = termsDic[key]!
        
        var day = date[2] - 1
        var month = date[1] + myTerm
        var year = date[0]

        if month > 12 {
            year += month / 12
            month = month % 12
            
            if month == 0 {
                month = 12
                year -= 1
            }
        }

        //compare
        if myToday[0] > year {
            ans.append(index)
        }
        else if myToday[0] == year {
            if myToday[1] > month {
                ans.append(index)
            }
            else if myToday[1] == month {
                if myToday[2] > day {
                    ans.append(index)
                }
            }
        }
    }

    return ans
}
