import Foundation
var n = 0
var graph : [[Int]] = [[]]
var min = Int.max

func bfs(_ x : Int, _ y : Int){
    var quee : [[Int]] = []
    var dis = graph
    var dx = [1,-1,0,0]
    var dy = [0,0,1,-1]
    var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    check[x][y] = true
    quee = [[x,y,0,3]]  //x,y,cost,방향 <-2 우 -1 좌 0 위 1 아래> 0은 처음
    
    while (!quee.isEmpty) {
        var now  = quee.first!
        quee.remove(at: 0)
        
        let x = now[0]
        let y = now[1]
        let cost = now[2]
        let dir = now[3]
        
        if(x == n-1 && y == n-1){
            if(cost < min){
                min = cost
            }
        }
        else{
            for i in -2...1{
                let nextX = x + dx[i+2] //다음 x값 생성
                let nextY = y + dy[i+2] //다음 y값 생성
                if(nextX >= 0 && nextX < n && nextY >= 0 && nextY < n && dis[nextX][nextY] != 1){
                    var newCost = 0
                    
                    if(dir == 3 ){
                        newCost = cost + 100
                    }
                    else if( i < 0  && dir < 0 ){ //가로로 올때
                        newCost = cost + 100
                    }
                    else if(i>=0 && dir >= 0){
                        newCost = cost + 100
                    }
                    else{
                        newCost = cost + 600
                    }
                    
                    if(check[nextX][nextY] == false ){  //처음 방문하면 cost로 갱싱
                        check[nextX][nextY] = true
                        dis[nextX][nextY] = newCost
                        quee.append([nextX,nextY,newCost,i])
                    }
                        
                    else if(check[nextX][nextY] == true ){ //방문했을떄 기존 dis와 cost 비교해서 작은거 추가
                        if(dis[nextX][nextY] >= newCost){
                            dis[nextX][nextY] = newCost
                            quee.append([nextX,nextY,newCost,i])
                        }
                    }
                    
                }
            }
        }
    }
    
}

func solution(_ board:[[Int]]) -> Int {
    n = board.count
    graph = board
    //check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    // go(0,0," ",0)
    // print(graph)
    bfs(0, 0)
    return min
}

//print(solution([[0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 1], [0, 0, 1, 0, 0, 0, 1, 0], [0, 1, 0, 0, 0, 1, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0]]))
print(solution([[0, 0, 1, 0], [0, 0, 0, 0], [0, 1, 0, 1], [1, 0, 0, 0]]))
