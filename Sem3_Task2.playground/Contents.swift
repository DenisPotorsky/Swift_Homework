import UIKit

/*
 Есть массив [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil].
 Необходимо создать новый массив, который будет состоять из элементов старого,
 но не должно быть nil, не должно быть 0 и 4,
 а также массив должен быть отсортирован по возрастанию.
 */

var array: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

func create_new_array(array_:[Int?]) -> [Int]{
    var new_array: [Int] = []
    for value in array{
        if let b = value{
            if b != 4 && b != 0{
                new_array.append(b)
            }
        }
        new_array.sort()
    }
    return new_array
}

print(create_new_array(array_: array))
