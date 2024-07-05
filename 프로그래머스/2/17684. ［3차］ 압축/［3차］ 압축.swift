import Foundation

func solution(_ msg:String) -> [Int] {
    var ans = [Int]()
    var arr :[String : Int] = ["A":1,"B":2,"C":3,"D":4,"E":5,"F":6,"G":7,"H":8,"I":9,"J":10,"K":11,"L":12,"M":13,"N":14,"O":15,"P":16,"Q":17,"R":18,"S":19,"T":20,"U":21,"V":22,"W":23,"X":24,"Y":25,"Z":26]
    var last = 27
    var cur =  String(msg[msg.index(msg.startIndex, offsetBy: 0)])
    var next = ""
    var index = 0
    
    while true {
        if(index > msg.count-1){
            break
        }
        if(arr[cur] != nil){ //사전에 있으면
            index += 1
            if(index > msg.count-1){
                next = ""
            }
            else{
                next = String(msg[msg.index(msg.startIndex, offsetBy: index)])
            }
            if(arr[cur+next] == nil){ //합친게 사전에 없으면
                ans.append(arr[cur]!)
                cur = cur+next
            }
            else{ //합친게 사전에 있으면
                cur = cur+next
            }
        
        }
        else{
            arr.updateValue(last, forKey: cur)
            last += 1
            cur = String(msg[msg.index(msg.startIndex, offsetBy: index)])
        }
        
        
    }
   
    ans.append(arr[cur]!)
    //print(cur)
    
    //print(ans)
    return ans
}