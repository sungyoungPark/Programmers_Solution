import Foundation

var ans = [String]()
var dic = [String:[String]]()
var count = 0

func solution(_ tickets:[[String]]) -> [String] {
    count = tickets.count + 1
    for ticket in tickets{
        var arr = dic[ticket[0]]
        if arr == nil {
            dic.updateValue([ticket[1]], forKey: ticket[0])
        }
        else{
            arr?.append(ticket[1])
            arr?.sort()
            dic.updateValue(arr!, forKey: ticket[0])
        }
        //        print(arr)
    }
    //ans.append("ICN")
    dfs("ICN" )
    //ans.append(last)
    //print(last)
    return ans
}


func dfs(_ start : String){
    
    let dest = dic[start]
    ans.append(start)
    if dest != nil{
        for i in dest!{
            dic[start]?.removeFirst()
            dfs(i)
            if ans.count == count{
                //last = i
                return
            }
            ans.removeLast()
            dic[start]?.append(i)
        }
    }
   
}



print(solution([["ICN","BOO" ], [ "ICN", "COO"], [ "COO", "DOO" ], ["DOO", "COO"], [ "BOO", "DOO"] ,["DOO", "BOO"], ["BOO", "ICN" ], ["COO", "BOO"]]))
//print(solution([["ICN", "COO"], ["ICN", "BOO"], ["COO", "ICN"], ["BOO", "DOO"]]))
