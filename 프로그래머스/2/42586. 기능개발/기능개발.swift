// 문제가 개편되었습니다. 이로 인해 함수 구성이나 테스트케이스가 변경되어, 과거의 코드는 동작하지 않을 수 있습니다.
// 새로운 함수 구성을 적용하려면 [코드 초기화] 버튼을 누르세요. 단, [코드 초기화] 버튼을 누르면 작성 중인 코드는 사라집니다.
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var first_process = progresses.first
    var first_speed = speeds.first
    
    var day : [Int] = []
    var new = 0
    var result : [Int] = []
    var count = 1
    
    var min = 0
    if (100 - first_process!) % first_speed! == 0 {
        min = (100 - first_process!) / first_speed!
    }
    else{
        min = (100 - first_process!) / first_speed! + 1
    }
    
    for i in 1...progresses.count - 1 {
        if (100 - progresses[progresses.index(progresses.startIndex, offsetBy: i)]) % speeds[speeds.index(speeds.startIndex, offsetBy: i)] == 0{
            new = (100 - progresses[progresses.index(progresses.startIndex, offsetBy: i)]) / speeds[speeds.index(speeds.startIndex, offsetBy: i)]
        }
        else {
            new = (100 - progresses[progresses.index(progresses.startIndex, offsetBy: i)]) / speeds[speeds.index(speeds.startIndex, offsetBy: i)] + 1
        }
        day.append(new)
    }
    //print(day)
    
    while true{
        if day == [] {
            result.append(count)
            break
        }
        if day.first! <= min {
            count += 1
            day.removeFirst()
        }
        else if day.first! > min {
            result.append(count)
            min = day.first!
            count = 1
            day.removeFirst()
        }
    }
    
    
    
    return result
}