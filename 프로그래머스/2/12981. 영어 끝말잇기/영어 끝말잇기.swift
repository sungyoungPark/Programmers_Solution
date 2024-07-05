import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var person : [[String]] = Array(repeating: Array(repeating: "", count: 0), count: n)
    var check_word :[String] = []
    var check_last : Character = words[0][words[0].startIndex]
    var word_count = 0

    for i in words{
        if i.count <= 1{
            print("단어 한글자")
            return[word_count%n,word_count/n]
        }
        else if check_last != i[i.startIndex]{ //끝말이 다를때
            print(word_count)
            print("끝말 다름")
            return[(word_count)%n+1,(word_count+n)/n]
        }
        else{ //끝말잇기 성공
            //단어 중복확인
            if check_word.contains(i){
                print("중복")
                print(word_count)
               return[(word_count)%n+1,(word_count+n)/n]
            }
        }
        word_count += 1
        check_word.append(i)
        check_last = i[i.index(before: i.endIndex)]
    }
    return [0,0]
}