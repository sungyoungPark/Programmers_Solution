import Foundation
 
 var row = [Int](repeating: 0, count: 12)
 var answer = 0
 var a = 0
 
 func solution(_ n:Int) -> Int {
    a = n
    
    dfs(0)
    return answer
 }
 
 func check(_ k:Int)->Bool{
    if k-1 >= 0{
        for i in 0...k-1{
            if row[k] == row[i]{
                return false
            }
            
            if abs((row[k]-row[i])/(k-i)) == 1{
                return false
            }
        }
    }
    return true
 }
 
 func dfs(_ k :Int){
    
    if k == a{
        answer += 1
        return
    }
    else{
        for i in 0...a-1{
            row[k] = i
            if check(k) == true {
                dfs(k+1)
            }
        }
    }
    
    
 }
