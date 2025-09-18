/*:
## Exercise - Create Functions

 Write a function called `introduceMyself` that prints a brief introduction of yourself. Call the function and observe the printout.
 */
func introduceMyself(name: String, age: Int) {
    print("My name is \(name) and I am \(age) years old.")
}
introduceMyself(name: "Masimo", age: 17)
//:  Write a function called `magicEightBall` that generates a random number and then uses either a switch statement or if-else-if statements to print different responses based on the random number generated. `let randomNum = Int.random(in: 0...4)` will generate a random number from 0 to 4, after which you can print different phrases corresponding to the number generated. Call the function multiple times and observe the different printouts.
import Foundation
func magicEightBall() {
    let randomNum = Int.random(in: 0...4)
    switch randomNum {
    case 0:
        print("Tu Mama")
    case 1:
        print("Who even knows.")
    case 2:
        print("Number 2 fs")
    case 3:
        print("Number 3.")
    case 4:
        print("This is case 4 btw.")
    default:
        "unknown"
    }
}
magicEightBall()
/*:
page 1 of 6  |  [Next: App Exercise - A Functioning App](@next)
 */
