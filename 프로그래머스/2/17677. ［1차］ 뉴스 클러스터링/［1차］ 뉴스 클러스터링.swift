import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    var jakade = 0.0
    var union = 0.0 //    합집합
    var intersection = 0.0 //교집합
    var array1 : [String] = []
    var array2 : [String] = []
    let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ") //글자쌍이 영어일 경우만...
    var add_str = ""
    var before = ""
    var check : [String:Int] = [:]
    
    for i in str1{
        if before == ""{
            before = String(i)
        }
        else{
            add_str = before+String(i)
            if add_str.rangeOfCharacter(from: characterset.inverted) == nil {
                if array1.firstIndex(of: add_str.capitalized) != nil {  //중복이면
                    check.updateValue(check[add_str.capitalized]! + 1, forKey: add_str.capitalized)
                    array1.append(add_str.capitalized + String(check[add_str.capitalized]!))
                }
                else{//중복이 아니면
                check.updateValue(0, forKey: add_str.capitalized)
                array1.append(add_str.capitalized)
                }
            }
            before = String(i)
        }
    }
    before = ""
    check.removeAll()
    for i in str2{
        if before == ""{
            before = String(i)
        }
        else{
            add_str = before+String(i)
            if add_str.rangeOfCharacter(from: characterset.inverted) == nil {
                if array2.firstIndex(of: add_str.capitalized) != nil {
                    check.updateValue(check[add_str.capitalized]! + 1, forKey: add_str.capitalized)
                    array2.append(add_str.capitalized + String(check[add_str.capitalized]!))
                   
                }
                else{
                    check.updateValue(0, forKey: add_str.capitalized)
                    array2.append(add_str.capitalized)
                }
            }
            before = String(i)
        }
    }
    
    let set1:Set<String> = Set(array1)
    let set2:Set<String> = Set(array2)
    union = Double(set1.union(set2).count)
    intersection = Double(set1.intersection(set2).count)
    
    if intersection == 0 && union == 0 {
        jakade = 1
    }
//    else if intersection == 1 && union == 1 {
//        if array2.count > array1.count{
//            union = Double(array2.count)
//            intersection = Double(array1.count)
//        }
//        else{
//            union = Double(array1.count)
//            intersection = Double(array1.count)
//        }
//        jakade = intersection/union
//    }
    else{
        jakade = intersection/union
    }
//    print(array1)
//    print(array2)
//
//    print(union)
//    print(intersection)
    
    return Int(jakade*65536)
}