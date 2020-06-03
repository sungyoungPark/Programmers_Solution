import Foundation

var network = 0
var graph = [[Int]]()
var visitd = [Bool]()

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    graph = [[Int]](repeating: [], count: n)
    visitd = [Bool](repeating: false, count: n)
    
    for i in 0...n-1{
        for j in 0...n-1{
            if i != j {
                if computers[i][j] == 1{
                    graph[i] = graph[i] + [j+1]
                }
            }
        }
    }
    
    dfsAll(n)
   // print(graph)
    //print(visitd)
    return network
}

func dfs(_ point : Int){
     visitd[point] = true
    if graph[point] == [] {
        return
    }
 
    for i in graph[point]{
        if visitd[i-1] == false{
            dfs(i-1)
        }
    }
    
    
}

func dfsAll(_ n :Int){
    for i in 0...n-1{
        if visitd[i] == false{
            dfs(i)
            network+=1
        }
    }
}


//print(solution(    3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
print(solution(    3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
