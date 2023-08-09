/*
 Создать перечисление с видами пиццы (хотя бы 4-5 кейсов).
 
 Создать структуру пиццы, она должна содержать стоимость,
 вид пиццы, толстое или тонкое тесто и добавки (например, дополнительно добавить пепперони, помидоры, сыр).
 Вид пиццы должен быть вложенным типом для структуры пиццы. Подсказка: добавки лучше также сделать перечислением.
 
 Создать класс пиццерии, добавить массив с возможными пиццами.
 Переменная с массивом должна быть приватной. Массив задается в инициализаторе.
 
 Написать в классе пиццерии функции для добавления новой пиццы и для получения всех доступных пицц.
 
 Создать экземпляр класса пиццерии и добавить в него несколько пицц.
 */


/*
 Создать структуру работника пиццерии. В ней должны быть такие свойства, как имя, зарплата и должность.
 Должностей пока может быть две: или кассир, или повар. Добавить в класс пиццерии массив с работниками.
 
 Создать класс столика, в нем должны быть свойство, в котором содержится количество мест и функция,
 которая на вход принимает количество гостей, которое хотят посадить, и возвращает true если места хватает и false
 если места не хватает. Изначальное количество мест задается в инициализаторе.
 
 Добавить в класс пиццерии свойство, в котором хранится массив столиков.
 У класса столика добавить свойство, в котором хранится пиццерия, в которой стоит столик.
 Столики создаются сразу в инициализаторе, не передаются туда в качестве параметра.
 */

enum PizzaNames: String{
    case margarita = "Маргарита"
    case pepperoni = "Хот Пепперони"
    case cheese = "Сырная пицца"
    case bonanza = "Большая бонанза"
    case oriental = "Восточная"
    case meat = "Мясная"
}

struct Pizza {
    var name: PizzaNames
    var cost: Int
    var dough: String
    var ingr: Ingredient
    enum Ingredient{
        case cheese
        case tomato
        case pepperoni
        case mushrooms
        case nothing
        
        init(ingr: String) {
            switch ingr {
            case "Сыр": self = .cheese
            case "Помидор": self = .tomato
            case "Пепперони": self = .pepperoni
            case "Грибы": self = .mushrooms
            case "Без добавок": self = .nothing
            default: self = .nothing
            }
        }
    }
}

struct Workers {
    var name: String
    var salary: Int
    var position: Position
    enum Position{
        case teller
        case chef
        case nothing
        
        init(position: String) {
            switch position  {
            case "Кассир": self = .teller
            case "Повар": self = .chef
            default: self = .nothing
            }
        }
    }
}

class Pizzeria {
    
    private var pizza: [Pizza] = []
    var tables: [Tables] = []
    private var workers: [Workers] = []

    init(pizza: [Pizza], tables: [Tables]) {
        self.pizza = pizza
        self.tables = tables
    }
    
    convenience init() {
        let margarita_ = Pizza(name: .margarita, cost: 125, dough: "Толстое", ingr: .cheese)
        let bonanza_ = Pizza(name: .bonanza, cost: 115, dough: "Толстое", ingr: .nothing)
        let table1 = Tables()
        let table2 = Tables()
        self.init(pizza: [margarita_, bonanza_], tables: [table1, table2])
    }
    
    
    func addPizza(pizza:Pizza){
        self.pizza.append(pizza)
    }
    
    func getPizzas() -> [Pizza]{
        return self.pizza
    }
}

class Tables {
    private var seatingCapacity: Int
    private var pizzeria: Pizzeria = Pizzeria()
    
    init(seatingCapacity: Int) {
        self.seatingCapacity = seatingCapacity
    }
    
    convenience init() {
        self.init(seatingCapacity: 10)
    }
    
    func seatСheck(guestCount: Int) -> Bool {
        if self.seatingCapacity > guestCount {
            print("Есть свободные места")
            return true
        }
            else {
                print("Нет свободных мест")
            }
        return false
        }
    }

let firstPizza = Pizza(name: .oriental, cost: 120, dough: "Тонкое", ingr: .mushrooms)
let secondPizza = Pizza(name: .cheese, cost: 110, dough: "Тонкое", ingr: .nothing)
let thirdPizza = Pizza(name: .meat, cost: 125, dough: "Толстое", ingr: .tomato)
var myPizzeria = Pizzeria()
myPizzeria.addPizza(pizza: firstPizza)
myPizzeria.addPizza(pizza: secondPizza)
myPizzeria.addPizza(pizza: thirdPizza)
dump(myPizzeria.getPizzas())
print(myPizzeria.getPizzas())
print(myPizzeria.tables[0].seatСheck(guestCount: 50))


