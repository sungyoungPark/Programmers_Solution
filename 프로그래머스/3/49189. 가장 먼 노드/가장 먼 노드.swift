import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
   
    var graph = [[Int]](repeating: [], count: n+1)
    
    for ed in edge{
        graph[ed[0]] = graph[ed[0]] + [ed[1]]
        graph[ed[1]] = graph[ed[1]] + [ed[0]]
    }
    
    
    var check = [[1]]
    
    var join = [1]
    var visit = [Bool](repeating: false, count: n+1)
    visit[1] = true
    var count = 0
    
    while true {
        if join.count == n{
            break
        }
        var new = [Int]()
        for c in check[0]{
                for g in graph[c]{
                    if visit[g] == false{
                        visit[g] = true
                        join.append(g)
                        new.append(g)
                    }
                }
            
        }
        check[0] = new
        count+=1
    }

    return check[0].count
}