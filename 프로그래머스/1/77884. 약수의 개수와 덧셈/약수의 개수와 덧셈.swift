import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var res = 0
    
    if left == right {
        if left == 1 {
            return -1
        }
        if left == 2 {
            return 1
        }
        return calc(target: left)
    }
    
    for i in left...right {
        if i == 1 {
            res -= 1
        }
        else if i == 2 {
            res += 2
        }
        else {
            let t = calc(target: i)
            if t % 2 == 0 {
              
                res += i
            }
            else {
                
                res -= i
            }
        }
        
    }
   
    return res
}

func calc(target : Int) -> Int{
    var count = 2
    for i in 2...target - 1 {
        if target % i == 0 {
            count += 1
        }
    }
    return count
}