import UIKit

func calc_money(deposit: Double, percent: Double, years: Double) -> Double{
    let res = deposit * percent * years / 100
    return res
}
print(calc_money(deposit: 1000, percent: 12, years: 5))



