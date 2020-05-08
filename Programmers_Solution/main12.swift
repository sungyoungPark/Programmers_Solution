import Foundation

var answer = [Int]()
func solution(_ baseball:[[Int]]) -> Int {
    
    for target in 123...987{
        var count = 0
        let trans = target.description
        if trans[returnIndex(0, trans)] == "0" || trans[returnIndex(1, trans)] == "0" || trans[returnIndex(2, trans)] == "0"{
            continue
        }
        
        if trans[returnIndex(0, trans)] == trans[returnIndex(1, trans)] || trans[returnIndex(1, trans)] == trans[returnIndex(2, trans)] || trans[returnIndex(2, trans)] == trans[returnIndex(0, trans)]{
            continue
        }
        
        
        //스트라이크, 볼 비교
        
        for base in baseball{
            let compare = String(base[0])
            var strike = base[1]
            var ball = base[2]
      
            //if strike != 0 {  //스트라이크가 있으면
                for i in 0...2{  //자리 비교
                    if compare[returnIndex(i, compare)] == trans[returnIndex(i, trans)]{
                        strike -= 1
                    }
                }
            //}
            if strike == 0 {  //스트라이크가 0이면
                //if ball != 0{
                    for j in 0...2{
                        if compare[returnIndex(j, compare)] == trans[returnIndex((j+1)%3, trans)]{
                            ball -= 1
                        }
                        else if compare[returnIndex(j, compare)] == trans[returnIndex((j+2)%3, trans)]{
                            ball -= 1
                        }
                    }
               // }
                
            }
            if strike != 0 || ball != 0 {
                break
            }
            else{
                count += 1
            }
        }
        
        if count == baseball.count{
            answer.append(target)
        }
        //answer.append(target)
        
        
    }
    //print(answer)
    return answer.count
}


func returnIndex(_ num : Int,_ arr : String ) ->String.Index {
    return arr.index(arr.startIndex, offsetBy: num)
}


//print(solution([[123,3,0]]))
print(solution([[123, 1, 1], [356, 1, 0], [327, 2, 0], [489, 0, 1]]))
