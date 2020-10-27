import Foundation
import Glibc

protocol CheckListElementProtocol {
    var isDone: Bool { get }
}

class CheckListElement: CheckListElementProtocol {
    var weekDay = ["Poniedzialek", "Wtorek", "Sroda", "Czwartek", "Piatek", "Sobota", "Niedziela"]
    var weekDayNumber: Int
    var text: String
    var doneText = ["Do wykonania", "Gotowe"]
    var isDone: Bool
    
    init() {
        self.weekDayNumber = 0
        self.text = "Nie rob nic"
        self.isDone = true
    }
    
    init(weekDayNumber: Int, text: String, isDone: Bool) {
        self.weekDayNumber = weekDayNumber
        self.text = text
        self.isDone = isDone
    }
    
    func description() -> String {
        return weekDay[weekDayNumber] + " " + text + " -> " + doneText[isDone ? 1 : 0]
    }
    
    func isDoneSwitcher() {
        isDone = !isDone
    }
}

var elements = [CheckListElement]()

elements.append(CheckListElement(weekDayNumber: 5, text: "Wyjsc na spacer", isDone: false))
elements.append(CheckListElement())

elements[0].isDoneSwitcher()
print(elements[0].description())

elements[1].isDoneSwitcher()
print(elements[1].description())
