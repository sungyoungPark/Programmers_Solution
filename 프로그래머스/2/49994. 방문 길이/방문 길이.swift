import Foundation

func solution(_ dirs:String) -> Int {
    var cmd = dirs
    var beforeX = 0
    var beforeY = 0
    var afterX = 0
    var afterY = 0
    var saveLoad = [String]()
    var count = 0
    for cmd in dirs{
    var load = ""
    var reverseLoad = ""
    switch cmd {
    case "U":
        if beforeY < 5 {
            afterY = beforeY + 1
           // beforeY = afterY
        }
    case "D":
        if beforeY > -5 {
            afterY = beforeY - 1
          //  beforeY = afterY
        }
    case "L":
        if beforeX > -5{
            afterX = beforeX - 1
           // beforeX = afterX
        }
    case "R":
        if beforeX < 5{
            afterX = beforeX + 1
          //  beforeX = afterX
        }
    default:
        return 0
        }
        load = String(String(beforeX)+String(beforeY)+String(afterX)+String(afterY))
        reverseLoad = String(String(afterX)+String(afterY)+String(beforeX)+String(beforeY))
        if saveLoad.index(of: load) == nil && saveLoad.index(of: reverseLoad) == nil{
            saveLoad.append(load)
            if beforeX != afterX || beforeY != afterY{
                count = count + 1
            }
        }
        beforeY = afterY
        beforeX = afterX
    }
    return count
}