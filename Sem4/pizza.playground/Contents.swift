import UIKit
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

class Pizzeria {
    
    private var pizza: [Pizza] = []
    
    init(pizza: [Pizza]) {
        self.pizza = pizza
    }
    
    convenience init() {
        let margarita_ = Pizza(name: .margarita, cost: 125, dough: "Толстое", ingr: .cheese)
        let bonanza_ = Pizza(name: .bonanza, cost: 115, dough: "Толстое", ingr: .nothing)
        self.init(pizza: [margarita_, bonanza_])
    }
    
    
    func addPizza(pizza:Pizza){
        self.pizza.append(pizza)
    }
    
    func getPizzas() -> [Pizza]{
        return self.pizza
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

