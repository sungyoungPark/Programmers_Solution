import Foundation

func solution(_ record:[String]) -> [String] {
    var dic : [String:String] = [:]
    var result :[String] = []
    var enter = "님이 들어왔습니다."
    var leave = "님이 나갔습니다."
    for i in record{
        var val = i.components(separatedBy: " ")

        switch val[val.startIndex] {
        case "Enter" :
            dic.updateValue(val[val.index(val.startIndex, offsetBy: 2)], forKey: val[val.index(val.startIndex, offsetBy: 1)])  //[uid:이름]
            break
        case "Change" :
            dic.updateValue(val[val.index(val.startIndex, offsetBy: 2)], forKey: val[val.index(val.startIndex, offsetBy: 1)])  //[uid:이름]
            break
        case "Leave" :
            break
        default:
            break
            
        }
    }
    for j in record{
        var val2 = j.components(separatedBy: " ")
        switch val2[val2.startIndex]{
        case "Enter" :
            result.append(dic[val2[val2.index(val2.startIndex, offsetBy: 1)]]!+enter)
            break
        case "Leave" :
            result.append(dic[val2[val2.index(val2.startIndex, offsetBy: 1)]]!+leave)
            break
            
        default:
            break
        }
        
    }
    
    return result
}