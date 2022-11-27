import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let caseArr = ["RT","CF","JM","AN"]
    var caseSheet = [ "RT" : ["R" : 0, "T" : 0], "CF" : ["C" : 0, "F" : 0],
                      "JM" : ["J" : 0, "M" : 0], "AN" : ["A" : 0, "N" : 0]]
    
    for i in 0...survey.count - 1  {
        let key = String(survey[i].sorted())

        
        let first = survey[i].first!.description
        let last = survey[i].last!.description
        
        let firstPoint = choices[i] < 4 ? abs(choices[i] - 4) : 0
        let lastPoint = choices[i] > 4 ? choices[i] - 4 : 0

        var caseDic = caseSheet[key]!
        
        caseDic.updateValue(caseDic[first]! + firstPoint, forKey: first)
        caseDic.updateValue(caseDic[last]! + lastPoint, forKey: last)
        
        caseSheet.updateValue(caseDic, forKey: key)
       
    }
    
    var result = ""
    for caseArranged in caseArr {
        
        let i = caseSheet[caseArranged]?.sorted { (first , second) in
            if first.value == second.value {
                return first.key < second.key
            }
            else{
                return first.value > second.value
            }
        }
        
        result.append((i?.first!.key)!)
        
    }
    
    return result
}
