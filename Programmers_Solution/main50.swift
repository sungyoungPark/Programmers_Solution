import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    
    var dic = [String : Int]()
    
    for i in 0...name.count - 1 {
        dic[name[i]] = yearning[i]
    }
    
    var res = [Int]()
    
    photo.forEach { pho in
        var point = 0
        pho.forEach { str in
            point += dic[str] ?? 0
        }
        res.append(point)
    }
    
    return res
}
