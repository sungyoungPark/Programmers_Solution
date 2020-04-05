import Foundation

var update = 0
var myBoard : [[Int]] = [[]]
var index = 0

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var removes = 0
    
    myBoard = board
    
    var stack : [Int] = []
    
    for i in moves{
        let newUpdate = checkZero(arrs: myBoard, myIndex: i) //스택에 새롭게 추가 될 값
        print(newUpdate)
        if newUpdate != -1{ //스택에 새롭게 추가 될 값이 있으면
            myBoard[index][i-1] = 0
             if stack.count == 0{ //스택이 비어있으면
                 stack.append(newUpdate)
            }
             else{  //스택이 차있으면
                if stack.last == newUpdate{ //스택에 마지막 값이 새로운 값과 같으면
                    stack.removeLast()
                    removes += 2
                }
                else{
                    stack.append(newUpdate)
                }
            }
        }
        index = 0
    }
    return removes
}

func checkZero( arrs :[[Int]], myIndex : Int)->Int{
    for arr in arrs{
        if arr[myIndex-1] != 0{
            return arr[myIndex-1]
        }
        index += 1
    }
    return -1
}
