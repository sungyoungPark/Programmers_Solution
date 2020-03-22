import Foundation

func solution(_ n:Int) -> [Int] {
    let arr1 = [0,0,1]
    let arr2 = [0,0,1,0,0,1,1]
    var next = arr2
    var temp = [Int]()
    if n == 1{
        return [0]
    }
    else if n == 2 {
        return arr1
    }
    else if n == 3 {
        return arr2
    }
    else{
        for _ in 4...n{
            
            for i in next.reversed() {
                if i == 0{
                    temp.append(1)
                }
                else if i == 1 {
                    temp.append(0)
                }
            }
            next.append(0)
            next += temp
            temp.removeAll()
        }
        return next
    }
}

print(solution(3))
