import UIKit

/*
Создать протокол для меню. Протокол должен содержать стоимость и наименование.
Стоимость и название должны быть get-only.
Создайте класс кафе, в нём должен быть массив с наименованиями меню и инициализатор.
Подпишите структуру чая с прошлого занятия на протокол из первого пункта.
В качестве name должен быть вид чая и “tea”.
Например, для чёрного чая должно быть black tea, а для зелёного green tea.
Создайте ещё 3 кафе, для которых класс Cafe будет родительским.
Добавить в родительский класс функцию (add) по добавлению новой позиции в меню.
Саму переменную меню сделать приватной, если она ещё таковой не является.
Сделать так, чтобы в первом из трёх классов наследников (например, FirstCafe) функция
add помимо того, что выполняла всё тоже самое, что и в родительском классе,
печатала в консоль стоимость добавляемой позиции.
Создать класс автомата с едой, не реализовывать в нём ни методов, ни свойств,
однако, этот класс должен уметь делать всё тоже самое, что и FirstCafe.
Сделать так, чтобы от класса автомата с напитками нельзя было наследоваться.
*/

protocol Menu {
    var cost: Double {get}
    var name: String {get}
}

class Cafe {
    private var menu: [Menu]

    init(menu: [Menu]){
        self.menu = menu
    }
    
    func add(_ newPosition: Menu){
        menu.append(newPosition)
    }
}

struct Tea : Menu{
    enum TeaType : String{
        case green
        case black
        case fruit
        case herbal
    }
    var type: TeaType
    var name: String {type.rawValue + "tea"}
    var cost: Double
   init(type: TeaType, cost: Double) {
    self.type = type
    self.cost = cost
   }
}

class FirstCafe : Cafe {
    override func add(_ newPosition:Menu){
        super.add(newPosition)
        print(newPosition.cost)
    }
}

class SecondCafe:Cafe{

}

class ThirdCafe: Cafe {

}

final class Vending : FirstCafe{}
