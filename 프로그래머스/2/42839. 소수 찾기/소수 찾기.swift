import Foundation

var n = 0
var r = 0

//n개의 수 중에서 r개를 뽑음
//var rePerArr1 = [Int]()
//var myArr = [Int]()

var myArr = [Int]()
var count = 0
var checkedNum = [Int]()
var perArr1 = [Int]()
var perCheck1 = [Int](repeating: 0, count: n)


func checkNum( _ tmp : Int)->Bool{
    if tmp <= 1{
        return false
    }
    else if tmp == 2 {
        if checkedNum.contains(2) == false{
            checkedNum.append(tmp)
            return true
        }
        else{
            return false
        }
    }
    else {
        for i in 2...tmp-1{
            if tmp % i == 0 {
                return false
            }
        }
    }
    if checkedNum.contains(tmp) == false{
        checkedNum.append(tmp)
        return true
    }
    else {
        return false
    }
}


//순열 (순서있게 배열)
func permutation(_ n : Int , _ r : Int, _ perArr : [Int] ,  _ perCheck : [Int]){
    if perArr.count == r {
        let mul = 10
        var tmp = 0
        for i in perArr {
            tmp = tmp * mul + i
            // print(i , terminator : " ")
        }
        if checkNum(tmp) == true {
            count += 1
        }
        
        // print()
        return
    }
    
    for i in 0...n-1{
        if perCheck[perCheck.index(perCheck.startIndex, offsetBy: i)] == 0{
            //perArr1.append(i)
            perArr1.append(myArr[myArr.index(myArr.startIndex, offsetBy: i)])
            perCheck1[perCheck1.index(perCheck.startIndex, offsetBy: i)] = 1
            permutation(n, r, perArr1, perCheck1)
            perCheck1[perCheck1.index(perCheck.startIndex, offsetBy: i)] = 0
            perArr1.removeLast()
        }
    }
}


func solution(_ numbers:String) -> Int {
    for i in numbers{
        myArr.append(Int(String(i))!)
    }
    
    //print("***순열(0,1,2)***")
    n = myArr.count
    //var perCheck1 = [Int](repeating: 0, count: n)
    // var perArr = [Int]()
    // var perCheck = [Int](repeating: 0, count: n)
    
    //permutation(n, r, perArr, perCheck)
    
    for i in 1...n{
        perCheck1 = [Int](repeating: 0, count: n)
        permutation(n, i, perArr1, perCheck1)
    }
    
    return count
}