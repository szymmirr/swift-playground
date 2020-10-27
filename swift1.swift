import Foundation
import Glibc

class CheckListElement {
    var text: String
    var doneText = ["Do wykonania", "Gotowe"]
    var isDone: Bool
    
    init() {
        self.text = "Nie rob nic"
        self.isDone = true
    }
    
    init(text: String, isDone: Bool) {
        self.text = text
        self.isDone = isDone
    }
    
    func description() -> String {
        return text + " -> " + doneText[isDone ? 1 : 0]
    }
}

var elements = [CheckListElement]()

elements.append(CheckListElement(text: "Poniedzialek Zrobic pranie", isDone: false))
print(elements[0].description())

elements.append(CheckListElement())
print(elements[1].description())
