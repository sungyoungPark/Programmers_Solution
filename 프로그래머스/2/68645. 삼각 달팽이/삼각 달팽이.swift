import Foundation

func move1(_ id1 : Int, _ id2 : Int)->[Int]{
    let arr = [id1+1, id2]
    return arr
}

func move2(_ id1 : Int, _ id2 : Int)->[Int]{
    let arr = [id1,id2+1]
    return arr
}

func move3(_ id1 : Int, _ id2 : Int)->[Int]{
    let arr = [id1-1,id2-1]
    return arr
}

func solution(_ n:Int) -> [Int] {
    var arr = [[Int]](repeating : [Int](), count : n + 1)
    var count = 0
    for i in 1...n{
        count = count + i
        var add = [Int](repeating : 0, count : i + 1)
        arr[i] = add
    }
    
    var id = [1,1]
    var cur = 1
    
    var max0 = n
    var max1 = n
   // var min = 2
    var cas = 1
    
    while count+1 != cur{
        
        if(cas == 1){
            arr[id[0]][id[1]] = cur
            cur += 1
            id = move1(id[0],id[1])
            if(id[0] == max0){
                cas = 2
                max0 -= 1
                continue
            }
        }
        else if(cas == 2){
            arr[id[0]][id[1]] = cur
            cur += 1
            id = move2(id[0],id[1])
            if(id[1] == max1){
                cas = 3
                max1 -= 1
                continue
            }
        }
        else if(cas == 3){
            if(arr[id[0]][id[1]] != 0){
                id[0] += 2
                id[1] += 1
                cas = 1
                max1 -= 1
                continue
            }
            else{
                arr[id[0]][id[1]] = cur
                cur += 1
                id = move3(id[0], id[1])
                
            }
        }
        
    }
    
    var result = [Int]()
    for i in 1...n{
        for j in 1...i{
            result.append(arr[i][j])
        }
    }
    
    return result
}