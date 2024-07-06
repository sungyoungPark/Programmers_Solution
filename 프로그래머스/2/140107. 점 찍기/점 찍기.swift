import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    
    var count = 0
   
    for y in stride(from: 0, to: d+1, by: k){
        let maxLeng = Int(floor(sqrt(Double(d * d - y * y))))
        
        //print("y == \(y) sum ---",maxLeng, maxLeng / k + 1)
        count += (maxLeng - maxLeng % k) / k + 1
        
    }
    
    return Int64(count)
}