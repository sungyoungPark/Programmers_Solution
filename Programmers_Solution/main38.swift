import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var visit = [Bool](repeating: false, count: n)

    for cost in costs{
        graph[cost[0]][cost[1]] = cost[2]
        graph[cost[1]][cost[0]] = cost[2]
    }
    
    visit[0] = true
    var list = [0]
    var sum = 0
    while true {
        if(list.count >= n){
            break
        }
        var min = Int.max
        var min_index = 0
        for point in list{
            for j in 0...n-1{
                if(visit[j] == false && graph[point][j] != 0){
                    if(min > graph[point][j]){
                        min = graph[point][j]
                        min_index = j
                    }
                }
            }
        }
        visit[min_index] = true
        list.append(min_index)
        sum += min
    }
    
    
    
    return sum
}


print(solution(4, [[0, 1, 1], [0, 2, 2], [1, 2, 5], [1, 3, 1], [2, 3, 8]]))
