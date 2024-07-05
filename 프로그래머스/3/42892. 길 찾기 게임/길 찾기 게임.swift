import Foundation

var result1 : [Int] = []
var result2 : [Int] = []

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var answer = [[Int]]()
    var graph = nodeinfo
    for i in 0...graph.count-1{
        graph[i].append(i+1)
        //print(graph[i])
    }
    VLR(graph)
    LRV(graph)
    answer.append(result2)
    answer.append(result1)
    return answer
}

func LRV(_ graph :[[Int]]){ //후위
    if graph.count <= 1 {
        if graph.count == 1{
            result1.append(graph[0][2])
        }
    }
    else{
        let sort = graph.sorted(by: { $0[1] > $1[1] })
        let rootNode = sort[0]
        var L_Node = [[Int]]()
        var R_Node = [[Int]]()
        
        for i in 1...graph.count-1{
            //print(sort[i][0])
            if sort[i][0] < rootNode[0]{
                L_Node.append(sort[i])
            }
            else{
                R_Node.append(sort[i])
            }
        }
        LRV(L_Node)
        LRV(R_Node)
        result1.append(rootNode[2])
    }
}

func VLR(_ graph :[[Int]]){  //전위
    if graph.count <= 1 {
        if graph.count == 1{
            result2.append(graph[0][2])
        }
    }
    else{
        let sort = graph.sorted(by: { $0[1] > $1[1] })
        let rootNode = sort[0]
        var L_Node = [[Int]]()
        var R_Node = [[Int]]()
        
        for i in 1...graph.count-1{
            //print(sort[i][0])
            if sort[i][0] < rootNode[0]{
                L_Node.append(sort[i])
            }
            else{
                R_Node.append(sort[i])
            }
        }
        result2.append(rootNode[2])
        VLR(L_Node)
        VLR(R_Node)
    }
}