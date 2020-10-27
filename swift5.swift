import Foundation
import Glibc

protocol CheckListElementProtocol {
    var isDone: Bool { get }
}

protocol CheckListProtocol: AnyObject {
    func printAllDescriptions(_ prot: CheckListElementProtocol)
}

class CheckListElement: CheckListElementProtocol {
    var weekDay = ["Poniedzialek", "Wtorek", "Sroda", "Czwartek", "Piatek", "Sobota", "Niedziela"]
    var weekDayNumber: Int
    var text: String
    var doneText = ["Do wykonania", "Gotowe"]
    var isDone: Bool
    weak var delegate: CheckListProtocol?
    
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
        delegate?.printAllDescriptions(self)
    }
}

class CheckList: CheckListProtocol {
    var checkListElements = [CheckListElement]()
    
    init(checkListElements: [CheckListElement]) {
        self.checkListElements = checkListElements
    }
    
    func printAllDescriptions(_ prot: CheckListElementProtocol) {
        checkListElements.forEach { element in
            print(element.description())
        }
    }
    
    func printEveryThirdElement() {
        for i in stride(from: 2, to: checkListElements.count, by: 3){
            print(checkListElements[i].description())
        }
    }
}

var elements = [CheckListElement]()

elements.append(CheckListElement(weekDayNumber: 5, text: "Wyjsc na spacer", isDone: false))
elements.append(CheckListElement())
elements.append(CheckListElement(weekDayNumber: 2, text: "Zrobic pranie", isDone: false))
elements.append(CheckListElement(weekDayNumber: 4, text: "Kupic bulki", isDone: true))
elements.append(CheckListElement(weekDayNumber: 3, text: "Zatankowac samochod", isDone: false))
elements.append(CheckListElement(weekDayNumber: 0, text: "Zjesc sniadanie", isDone: false))
elements.append(CheckListElement(weekDayNumber: 1, text: "Zjesc obiad", isDone: false))
elements.append(CheckListElement(weekDayNumber: 2, text: "Zjesc podwieczorek", isDone: false))
elements.append(CheckListElement(weekDayNumber: 3, text: "Zjesc sniadanie", isDone: false))

var checkListElements = [CheckListElement]()

elements.forEach {
    checkListElements.append($0)
}

var checkList = CheckList(checkListElements: checkListElements)

elements.forEach {
    $0.delegate = checkList
}

elements[7].isDoneSwitcher()

print()
checkList.printEveryThirdElement()
