import Foundation

func solution(_ x: Int, _ y: Int, _ n: Int) -> Int {
    if x == y { return 0 }

    var queue: [(Int, Int)] = [(x, 0)] // (현재 값, 연산 횟수)
    var visited = [Int: Bool]() // 방문한 숫자를 기록할 Dictionary
    visited[x] = true // 초기 값 x는 방문 처리
    
    var index = 0  // 큐에서 꺼내는 인덱스를 추적
    
    while index < queue.count {
        let (current, steps) = queue[index]
        index += 1
        
        // 연산을 통해 새로운 값 계산
        let nextValues = [current + n, current * 2, current * 3]
        
        for next in nextValues {
            // 목표 값에 도달했다면
            if next == y {
                return steps + 1
            }

            // next 값이 목표를 넘지 않고, 아직 방문하지 않은 값이면
            if next <= y && visited[next] == nil {
                visited[next] = true // 방문 처리
                queue.append((next, steps + 1)) // 큐에 추가
            }
        }
    }
    
    // 도달할 수 없으면 -1 반환
    return -1
}