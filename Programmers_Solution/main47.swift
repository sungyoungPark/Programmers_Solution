import Foundation

func solution(_ babbling:[String]) -> Int {
    let pronunciation = ["aya", "ye", "woo", "ma"]
    var res = 0
    
    for babble in babbling {
        var k = babble
        for pro in pronunciation {
            //print(k)
            k = k.replacingOccurrences(of: pro, with: " ")
            if k.replacingOccurrences(of: " ", with: "").isEmpty{
                res += 1
                break
            }
        }
    }
    //print(res)
    return res
}
