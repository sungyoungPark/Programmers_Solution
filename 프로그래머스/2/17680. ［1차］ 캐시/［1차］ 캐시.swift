import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache : [String] = []
    var time = 0
    for i in cities{
        if cache.firstIndex(of: i.capitalized) == nil { //캐쉬 미스일 때
            if cache.count >= cacheSize { // 캐쉬를 초과할때, 캐쉬 앞에꺼 지우고 추가
                cache.append(i.capitalized)
                cache.removeFirst()
               
            }
            else { //캐쉬를 초과하지 않았을때
                cache.append(i.capitalized)
            }
            time += 5
        }
        else{  //캐쉬 히트일 때
            cache.remove(at: cache.firstIndex(of: i.capitalized)!)
            cache.append(i.capitalized)
            time += 1
        }
    }
    
    //print(cache)
    return time
}