import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var round = 1
    var player = a
    var rival = b
    // [실행] 버튼을 누르면 출력 값을 볼 수 있습니다.
  
    while true{
        if abs((player+1)/2-(rival+1)/2) == 0 {
            return round
        }
        else {
            round += 1
            player = (player+1) / 2
            rival = (rival+1) / 2
        }
    }
}