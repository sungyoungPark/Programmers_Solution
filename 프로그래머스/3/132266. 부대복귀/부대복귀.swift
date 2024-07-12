import Foundation

struct Edge {
    let destination: Int
    let weight: Int
}

class Graph {
    var nodes: [Int: [Edge]] = [:]
    
    func addEdge(from source: Int, to destination: Int, weight: Int) {
        if nodes[source] == nil {
            nodes[source] = []
        }
        nodes[source]?.append(Edge(destination: destination, weight: weight))
    }
}

struct PriorityQueue {
    private var heap: [(Int, Int)] = []
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    mutating func insert(_ element: (Int, Int)) {
        heap.append(element)
        heapifyUp(from: heap.count - 1)
    }
    
    mutating func extractMin() -> (Int, Int)? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeFirst()
        } else {
            let min = heap[0]
            heap[0] = heap.removeLast()
            heapifyDown(from: 0)
            return min
        }
    }
    
    private mutating func heapifyUp(from index: Int) {
        var index = index
        while index > 0 {
            let parentIndex = (index - 1) / 2
            if heap[index].0 < heap[parentIndex].0 {
                heap.swapAt(index, parentIndex)
                index = parentIndex
            } else {
                break
            }
        }
    }
    
    private mutating func heapifyDown(from index: Int) {
        var index = index
        while true {
            let leftChildIndex = 2 * index + 1
            let rightChildIndex = 2 * index + 2
            var smallest = index
            if leftChildIndex < heap.count && heap[leftChildIndex].0 < heap[smallest].0 {
                smallest = leftChildIndex
            }
            if rightChildIndex < heap.count && heap[rightChildIndex].0 < heap[smallest].0 {
                smallest = rightChildIndex
            }
            if smallest == index {
                break
            }
            heap.swapAt(index, smallest)
            index = smallest
        }
    }
}


func dijkstra(graph: Graph, source: Int) -> [Int: Int] {
    var distances: [Int: Int] = [:]
    var priorityQueue = PriorityQueue()
    
    for node in graph.nodes.keys {
        distances[node] = Int.max
    }
    
    distances[source] = 0
    priorityQueue.insert((0, source))
    
    while !priorityQueue.isEmpty {
        guard let (currentDistance, currentNode) = priorityQueue.extractMin() else { break }
        
        if currentDistance > distances[currentNode]! {
            continue
        }
        
        if let edges = graph.nodes[currentNode] {
            for edge in edges {
                let destinationInt = edge.destination
                
                let newDistance = currentDistance + edge.weight
        
                // 목적지 노드의 현재 저장된 거리와 비교
                if let currentDestinationDistance = distances[destinationInt], newDistance < currentDestinationDistance {
                    distances[destinationInt] = newDistance
                    priorityQueue.insert((newDistance, destinationInt))
                }
                
            }
        }
    }
    
    return distances
}

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var res : [Int] = []
    
    let graph = Graph()
    for road in roads {
       
        graph.addEdge(from: road[0], to: road[1], weight: 1)
        graph.addEdge(from: road[1], to: road[0], weight: 1)
    }
 
    let distance = dijkstra(graph: graph, source: destination)
   
    for source in sources {
        let dis = distance[source] ?? -1 == Int.max ? -1 :distance[source] ?? -1
        
        res.append(dis)
    }
   
    return res
}