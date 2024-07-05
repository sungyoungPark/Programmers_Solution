import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var array = clothes
    var sort: [String] = []
    var result = [String : [String]]()
    var output = 1
    var n = 0
    while n != clothes.count{
        var update: [String] = []
        if sort.contains(clothes[n][1]) == true{
            update = result[clothes[n][1]] ?? update
            update.append(clothes[n][0])
            result.updateValue(update, forKey: clothes[n][1])
            n += 1
        }
        else{
            sort.append(clothes[n][1])
            update.append(clothes[n][0])
            result[clothes[n][1]] = update
            n += 1
        }
    }
    for (Keys,Values) in result{
        output = output * (Values.count+1)
    }
    return output-1
}