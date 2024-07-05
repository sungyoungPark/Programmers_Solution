import Foundation
var n = 0
var graph : [[Int]] = [[]]

func dijkstra(_ v : Int) -> [Int]{
    var dis = [Int](repeating: 0, count: n+1)
    var visit = [Bool](repeating: false, count: n+1)
    
    for i in 1...n{
        dis[i] = Int.max
    }
    dis[v] = 0
    visit[v] = true
    
    for i in 1...n{
        if(visit[i] == false && graph[v][i] != Int.max){
            dis[i] = graph[v][i]
        }
    }
 
    for _ in 1...n{
        var min = Int.max
        var index = 0
        
        for j in 1...n{
            if(visit[j] == false && dis[j] != Int.max){
                if(dis[j] < min){
                    min = dis[j];
                    index = j
                }
            }
        }
        
        visit[index] = true
        if(index == 0){
            break
        }
        
        for j in 1...n{
            if(visit[j]==false && graph[index][j] != Int.max){
                if(dis[j]>dis[index] + graph[index][j]){
                    dis[j] = dis[index] + graph[index][j]
                }
            }
        }
    }
    return dis
}

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    n = N
    graph = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)

    for i in 1...n{
        for j in 1...n{
            graph[i][j] = Int.max
        }
    }
    
    for r in road{
        let a = r[0]
        let b = r[1]
        let c = r[2]
        
        if(graph[a][b] > c){
            graph[a][b] = c
            graph[b][a] = c
        }
    }

    let dis = dijkstra(1)
    var count = 0
    
    for i in 1...n{
        if(dis[i]<=k){
            count += 1
        }
    }
    
    return count
}