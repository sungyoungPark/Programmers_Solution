import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let alpha = "abcdefghijklmnopqrstuvwxyz"
    
    var decode = alpha.filter { c in
        if !(skip.contains(c)) {
            return true
        }
        return false
    }
    
    let decodeCount = decode.count
    decode += decode + decode

    let ans = s.map {
        
        decode[decode.index(decode.firstIndex(of: $0)!, offsetBy: index % decodeCount)]
   
    }
    
    return String(ans)
}
