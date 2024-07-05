import Foundation

func gcd(a :Int , b : Int) -> Int{
    var x = 0
    var y = 0
    var temp = 1
    if a >= b {
        x = a
        y = b
        
    }
    else{
        x = b
        y = a
    }

    for i in (1...y).reversed() {
        if x % i == 0 && y % i == 0 {
            x = x / i
            y = y / i
            temp = temp * i
        }
     
    }
   
    return temp * x * y
}


func solution(_ arr:[Int]) -> Int {
    var arr1 = arr
    var new_num = 0
    while true{
    
        if arr1.count == 1{
            break
        }
        new_num = gcd(a: arr1[arr1.startIndex],b: arr1[arr1.index(arr1.startIndex, offsetBy: 1)])
        arr1.removeFirst()
        arr1.removeFirst()
        arr1.insert(new_num, at: 0)
        
    }
    

    return arr1[arr1.startIndex]
}