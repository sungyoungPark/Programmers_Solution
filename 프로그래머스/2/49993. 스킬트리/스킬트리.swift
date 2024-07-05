import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var arr = [String]()
    var skill_char = [Character]()
    var count = 0
    for k in skill{
        //print(k)
        skill_char.append(k)
    }
    for i in skill_trees{
        var dic : [Character : Int] = [:]
        var index = 0
        var temp = 0
        var ind = 0
        for j in i{
            dic.updateValue(index, forKey: j)
            index = index + 1
        }
        
        if dic[skill_char[skill_char.index(skill_char.startIndex, offsetBy: 0)]] == nil{
            dic.updateValue(99, forKey: skill_char[skill_char.index(skill_char.startIndex, offsetBy: ind)])
            
        }
        temp = dic[skill_char[skill_char.index(skill_char.startIndex, offsetBy: 0)]]!
        for p in skill_char{
            
            if (dic[skill_char[skill_char.index(skill_char.startIndex, offsetBy: ind)]] == nil){
                dic.updateValue(99, forKey: skill_char[skill_char.index(skill_char.startIndex, offsetBy: ind)])
            }
            if temp > dic[skill_char[skill_char.index(skill_char.startIndex, offsetBy: ind)]]!{
                count = count + 1
//                print(temp)
//                print(dic[skill_char[skill_char.index(skill_char.startIndex, offsetBy: ind)]]!)
//                print("break")
                break
            }
//            print(dic)
            temp = dic[skill_char[skill_char.index(skill_char.startIndex, offsetBy: ind)]]!
            ind = ind + 1
        }
    }
//    print(skill_trees.count - count)
    return skill_trees.count - count
}