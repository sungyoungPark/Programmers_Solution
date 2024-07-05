// 문제가 개편되었습니다. 이로 인해 함수 구성이나 테스트케이스가 변경되어, 과거의 코드는 동작하지 않을 수 있습니다.
// 새로운 함수 구성을 적용하려면 [코드 초기화] 버튼을 누르세요. 단, [코드 초기화] 버튼을 누르면 작성 중인 코드는 사라집니다.
import Foundation

func solution(_ brown:Int, _ red:Int) -> [Int] {
    var red_height = 0
    var red_width = 0
    
    for i in 1...red{
        var answer = 0
        red_height = i
        if red % red_height == 0
        {
            red_width = red / red_height
            answer = (red_width+2)*(red_height+2)-red
        }
        if answer == brown{
            if red_width >= red_height{
            return [red_width+2, red_height+2]
            }
            else{
                return [red_height+2,red_width+2]
            }       
        }
        }
    return []
}