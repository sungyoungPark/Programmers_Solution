import Foundation

let n = 2
var r = 0
var rePerArr1 = [Int]()
var result = 0
var myNum = [Int]()
//중복순열 (순서있게 배열 + 자시자신도 포함)


func rePermutation(_ n : Int , _ r : Int , _ rePerArr : [Int], _ target : Int){
    if rePerArr.count == r {
        var count = 0
        var tmp = 0
        for i in rePerArr{
            
            if i == 0 {
                tmp = tmp + myNum[myNum.index(myNum.startIndex, offsetBy: count)] * -1
               // print( -1, terminator : " ")
            }
            else{
                tmp = tmp + myNum[myNum.index(myNum.startIndex, offsetBy: count)] * i
               // print(i, terminator: " ")
            }
            count += 1
        }
        if tmp == target{
            //print("target 확인")
            result += 1
        }
        
        //print()
        return
    }
    
    for i in 0...n-1 {
        rePerArr1.append(i)
        rePermutation(n, r, rePerArr1, target)
        rePerArr1.removeLast()
    }
    
}


func solution(_ numbers:[Int], _ target:Int) -> Int {
    myNum = numbers
    r = numbers.count
   // print("***중복순열(0,1,2)***")

    rePermutation(n, r, rePerArr1, target)
    
    return result
}