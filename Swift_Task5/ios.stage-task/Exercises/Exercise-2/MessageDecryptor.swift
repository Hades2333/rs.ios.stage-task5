import UIKit

class MessageDecryptor: NSObject {

    class Item {
        var count:Int = 0
        var str:String = ""
    }

    func decryptMessage(_ message: String) -> String {
        var stack:[Item] = []
        let head:Item = Item()
        var current = head
        let arrayOfCharacters = Array(message)
        for i in 0..<message.count{
            let c = arrayOfCharacters[i]
            if let digit = Int(String(c)) {
                if i > 0 && (Int(String(arrayOfCharacters[i-1])) != nil){
                    current.count = (current.count*10) + digit
                }else{
                    let nItem = Item()
                    nItem.count = digit
                    stack.append(current)
                    current = nItem
                }
            } else if c == "[" {
            } else if c == "]" {
                let last = stack.popLast() ?? current
                var str = ""
                for _ in 0..<current.count{
                    str += current.str
                }
                last.str += str
                current = last
            }else{
                current.str += String(c)
            }
        }
        return head.str
    }
}
