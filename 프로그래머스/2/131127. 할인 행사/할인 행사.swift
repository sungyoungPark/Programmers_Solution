import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    
    var count = 0
    var index = 0
    for start in 0...discount.count - 10 {
        let disCountArr = Array(discount[start ..< start + 10])

        for i in 0...want.count - 1{
            if number[i] > disCountArr.filter { $0 == want[i] }.count {
              
                break
            }
            if i == want.count - 1 {
                count += 1
            }
        }
        
        
    }
    

    return count
}