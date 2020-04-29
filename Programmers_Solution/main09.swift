import Foundation

var dic = [String:Int]()
var dic2 = [String:[[Int]]]()

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var ans = [Int]()
    for i in 0...genres.count-1{
        if dic[genres[i]] == nil{
            dic.updateValue(plays[i], forKey: genres[i])
        }
        else{
            let cur = dic[genres[i]]
            dic.updateValue(cur! + plays[i], forKey: genres[i])
        }
        
        if dic2[genres[i]] == nil{
            dic2.updateValue([[plays[i],i]], forKey: genres[i])
        }
        else{
            var cur = dic2[genres[i]]
            let update = [plays[i],i]
            cur?.append(update)
            cur = cur?.sorted(by: { $0[0] > $1[0]})
            dic2.updateValue(cur!, forKey: genres[i])
        }
        
    }
    //print(dic)
    //print(dic2)
    let sortDic = dic.sorted(by: {$0.value > $1.value})
    for i in sortDic{
        //print(i)
        let update = dic2[i.key]
        if update!.count >= 2{
            for k in 0...1{
                ans.append(update![k][1])
            }
        }
        else{
            ans.append(update![0][1])
        }
        
    }
    
    
    return ans
}

print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
