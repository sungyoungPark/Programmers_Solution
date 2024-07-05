func solution(_ a:Int, _ b:Int) -> Int64 {
  var array = [a,b]
    var result = 0
    array.sort(by: <)
    for i in array[0]...array[1]{
        result = result + i
    }
    return Int64(result)
}