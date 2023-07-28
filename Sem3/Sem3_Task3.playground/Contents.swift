import UIKit

/*
 Написать функцию, которая на вход принимает целое число,
 а возвращает массив, который сформирован по следующим правилам:
 количество элементов соответствует переданному числу,
 массив начинается с 1, каждый последующий элемент больше предыдущего в 2 раза.
 */

var num = 9

func create_array(number: Int) -> [Int]{
    var array: [Int] = []
    for num in 1...number{
        if num == 1{
            array.append(num)
        }
        else{
            array.append(array[num - 2] * 2)
        }
    }
    return array
}

print(create_array(number: num))
