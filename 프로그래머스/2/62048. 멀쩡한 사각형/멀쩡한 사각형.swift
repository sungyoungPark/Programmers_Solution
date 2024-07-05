import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    if w > 1 {
    for i in 1...w-1 {
        answer = answer + Int64((i * h / w))
    }
    }
    return answer * 2
}