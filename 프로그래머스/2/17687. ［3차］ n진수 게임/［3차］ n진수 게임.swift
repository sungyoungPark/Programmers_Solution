import Foundation


func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var number = 0
    var str = ""
    var tube_count = t
    //var participant = m
    var count = 1
    var result = ""
    
    while true {
        str = String(number, radix: n)
       // print(str)
        for i in str{
            if count == p{
                tube_count -= 1
                
                result.append(i.uppercased())
            }
            count += 1
            if count > m{
                count = 1
            }
            if tube_count <= 0{
                       break
                   }
        }
        
        
        number += 1
        
        if tube_count <= 0{
            break
        }
        
    }
    
    //print(result)
    return String(result)
}