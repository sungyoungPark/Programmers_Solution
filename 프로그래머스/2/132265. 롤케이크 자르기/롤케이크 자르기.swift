func solution(_ topping:[Int]) -> Int {
    var result = 0
    
    var leftDict = [Int: Int]()   // 왼쪽 토핑 종류 세기
    var rightDict = [Int: Int]()  // 오른쪽 토핑 종류 세기
    
    // 먼저 전체 토핑을 오른쪽에 다 넣기
    for top in topping {
        rightDict[top, default: 0] += 1
    }

    for i in 0..<topping.count {
        let top = topping[i]

        // 오른쪽에서 현재 토핑 제거
        rightDict[top]! -= 1
        if rightDict[top]! == 0 {
            rightDict.removeValue(forKey: top)
        }

        // 왼쪽에 현재 토핑 추가
        leftDict[top, default: 0] += 1

        // 왼쪽과 오른쪽의 종류 수가 같으면 결과 증가
        if leftDict.count == rightDict.count {
            result += 1
        }
    }

    return result
}