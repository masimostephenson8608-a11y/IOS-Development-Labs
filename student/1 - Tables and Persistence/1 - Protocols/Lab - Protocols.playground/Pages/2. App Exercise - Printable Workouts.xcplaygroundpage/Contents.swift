/*:
## App Exercise - Printable Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 The `Workout` objects you have created so far in app exercises don't show a whole lot of useful information when printed to the console. They also aren't very easy to compare or sort. Throughout these exercises, you'll make the `Workout` class below adopt certain protocols that will solve these issues.
 */
import Foundation

final class Workout: CustomStringConvertible {
    var distance: Double
    var time: Double
    var identifier: Int
    var description: String {
        "\(identifier)"
    }
    
    init(distance: Double, time: Double, identifier: Int) {
        self.distance = distance
        self.time = time
        self.identifier = identifier
    }
    
     

}

//:  Make the `Workout` class above conform to the `CustomStringConvertible` protocol so that printing an instance of `Workout` will provide useful information in the console. Create an instance of `Workout`, give it an identifier of 1, and print it to the console.
var workoutTest = Workout(distance: 2.45, time: 4.5, identifier: 1)
print(workoutTest.description)

//:  Make the `Workout` class above conform to the `Equatable` protocol. Two `Workout` objects should be considered equal if they have the same identifier. Create another instance of `Workout`, giving it an identifier of 2, and print a boolean expression that evaluates to whether or not it is equal to the first `Workout` instance you created.
extension Workout: Equatable, Comparable {
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    static func < (lhs:Workout, rhs: Workout) -> Bool {
        return lhs.identifier < rhs.identifier
    }
    
    static func > (lhs:Workout, rhs: Workout) -> Bool {
        return lhs.identifier > rhs.identifier
    }
}
var workoutTest2 = Workout(distance: 2.75, time: 6.7, identifier: 2)
print(workoutTest == workoutTest2)
/*:
 Make the `Workout` class above conform to the `Comparable` protocol so that you can easily sort multiple instances of `Workout`. `Workout` objects should be sorted based on their identifier. 
 
 Create three more `Workout` objects, giving them identifiers of 3, 4, and 5, respectively. Then create an array called `workouts` of type `[Workout]` and assign it an array literal with all five `Workout` objects you have created. Place these objects in the array out of order. Then create another array called `sortedWorkouts` of type `[Workout]` that is the `workouts` array sorted by identifier. 
 */
var workoutTest3 = Workout(distance: 4.8, time: 2.4, identifier: 3)
var workoutTest4 = Workout(distance: 9.2, time: 2.6, identifier: 4)
var workoutTest5 = Workout(distance: 7.5, time: 2.65, identifier: 5)

var workouts = [
    workoutTest2,
    workoutTest,
    workoutTest4,
    workoutTest5,
    workoutTest3,
]
var sortedWorkouts: [Workout] = workouts.sorted(by: { $0 < $1 })
//:  Make `Workout` adopt the `Codable` protocol so you can easily encode `Workout` objects as data that can be stored between app launches. Use a `JSONEncoder` to encode one of your `Workout` instances. Then use the encoded data to initialize a `String`, and print it to the console.
extension Workout: Codable { }

let encoder = JSONEncoder()
do {
    let jsonData = try encoder.encode(workouts)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
} catch {
    print("Encoding Failed")
}

/*:
[Previous](@previous)  |  page 2 of 5  |  [Next: Exercise - Create a Protocol](@next)
 */
