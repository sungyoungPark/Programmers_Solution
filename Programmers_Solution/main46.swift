import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var dic_report : [String : Int] = [:]
    var dic_set : [String :Set<String>] = [:]
    
    for re in report {
        //a[0] 신고자, a[1] 신고 당한자
        let data = re.components(separatedBy: " ")
        let reporter = data[0]
        let criminal = data[1]
        
        if var arr = dic_set[reporter] {
            //arr.append(a[1])
            if !(arr.contains(criminal)){
                arr.update(with: criminal)
                dic_set.updateValue(arr, forKey: reporter)
                dic_report.updateValue((dic_report[criminal] ?? 0) + 1, forKey: criminal)
            }
        }
        else{
            dic_report.updateValue((dic_report[criminal] ?? 0) + 1, forKey: criminal)
            dic_set.updateValue([criminal], forKey: reporter)
        }
    }
    
    var res : [Int] = []
    for id in id_list{
        if let arr = dic_set[id] {
            var add = 0
            for a in arr {
                if let p = dic_report[a], p >= k {
                    add += 1
                }
            }
            res.append(add)
        }
        else{
            res.append(0)
        }
    }
    
    return res
}
