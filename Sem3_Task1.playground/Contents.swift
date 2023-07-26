import UIKit
/*
 Есть словарь с видами чая и их стоимостью. Есть очередь людей, которые хотят заказать чай (можно представить её в виде массива видов чая, которые хотят заказать).
 Необходимо последовательно выводить в консоль сколько заплатит покупатель (необходимо вывести его номер по порядку, чай, который он заказал, и стоимость).
 */
 
var tea: [String: Int] = ["Chempion": 230, "Tess": 280, "Piala": 250, "Basilur": 300]
var persons: [String] = ["Chempion", "Tess", "Chempion", "Tess", "Chempion", "Piala", "Piala", "Basilur", "Basilur", "Basilur"]

for (index, element) in persons.enumerated(){
    print(index + 1, element, tea[element]!)
}
