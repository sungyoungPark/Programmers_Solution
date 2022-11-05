import Foundation

func solution(_ food:[Int]) -> String {
    let onlyFood = Array(food[1...])
    var a = 1
    let des = onlyFood.map { (number: Int) -> String in
        var res = ""
        
        if number > 1 {
            for _ in 0...number / 2 - 1{
                res += String(a)
            }
        }
        
        a += 1
        return res
    }.joined()
  
    return des + "0" + des.reversed()
}


solution([1, 3, 4, 6])
solution([1, 7, 1, 2])
