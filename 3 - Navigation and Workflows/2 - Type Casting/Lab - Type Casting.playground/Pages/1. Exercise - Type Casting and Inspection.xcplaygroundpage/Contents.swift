/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var idk: [Any] = [1.2, 1.3, 1.4, 2, 5, 6, "hi", "idk", true, true, false]
print(idk)
//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for (x, y) in idk.enumerated() {
    if let item = y as? Int {
        print("The integer has a value of: \(item)")
    } else if let item = y as? Double {
        print("The Double has a value of: \(item)")
    } else if let item = y as? String {
        print("The String has a value of: \(item)")
    } else if let item = y as? Bool {
        print("The boolean is \(item)")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var whoKnows: [String: Any] = [
    "hi": 4, "idk": "no", "know": true, "never": 1.6, "Int": 5,
    "Why not": "123",
]
print(whoKnows)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for (x, y) in whoKnows {
    if let item = y as? Int {
        total += Double(item)
        print("Added \(item)")
    } else if let item = y as? Double {
        total += item
        print("Added \(item)")
    } else if let item = y as? String {
        total += 1
        print("Added 1")
    } else if let item = y as? Bool {
        if item == true {
            total += 2
            print("Added 2")
        } else {
            total += 3
            print("Added 3")
        }
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
var total2: Double = 0
for (x, y) in whoKnows {
    if let item = y as? Int {
        total2 += Double(item)
    } else if let item = y as? Double {
        total2 += item
    }

    if let item = y as? String {
        if let see = Double(item) {
            total2 += see
            print("It worked")
        }

    }
}
print(total2)

/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
