import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var value = 1
    var count = 0

    for i in stations{
        if  i-w > 1 && value <= i-w{
        if  (i-w-value ) % (2*w+1) != 0  {
            count = count + (i-w-value) / (2*w+1) + 1
//            print(value)
//            print("1")
        }
       else if (i-w-value ) % (2*w+1) == 0{
            count = count + (i-w-value) / (2*w+1)
//            print(value)
//               print("2")
            }
        }
       value = i + w + 1
//        print(count)
    }
//    print(value)
//    print(count)
    if value <= n {
        if (n - value + 1) % (2*w+1) == 0 {
            count = count + (n - value + 1) / (2*w+1)
        }
        else{
            count = count + (n - value + 1) / (2*w+1) + 1
        }
    }
    //print(value)
        //}
//    print("count는")
//    print(count)
    return count
}