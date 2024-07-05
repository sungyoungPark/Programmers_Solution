import Foundation

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    var val = s
    val.removeFirst()
    val.removeLast()
    let arr = val.components(separatedBy: "},")
    var myDic : [Int:[Int]] = [:]
    for i in arr{
        var transfer = i
        transfer = transfer.replacingOccurrences(of: "}", with: "")
        transfer = transfer.replacingOccurrences(of: "{", with: "")
        transfer = transfer.replacingOccurrences(of: ",", with: " ")
        let arr = transfer.components(separatedBy: " ")
        var dicVal : [Int] = []
        for t in arr{
            dicVal.append(Int(String(t))!)
        }
        myDic.updateValue(dicVal, forKey: arr.count)
    }
    if arr.count > 1{
        for i in 1...arr.count{
            let dic = myDic[i]
            for d in dic!{
                if result.contains(d) == false{
                    result.append(d)
                }
            }
            
        }
    }
    else{
        return myDic.first!.value
    }
    return result
}