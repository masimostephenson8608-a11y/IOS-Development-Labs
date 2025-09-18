/*:
## Exercise - Computed Properties and Property Observers

 The `Rectangle` struct below has two properties, one for width and one for height. Add a computed property that computes the area of the rectangle (i.e. width * height). Create an instance of `Rectangle` and print the `area` property.
 */
struct Rectangle {
    var width: Int
    var height: Int
    var area: Int {
        return width * height
    }
}

/*:
 In the `Height` struct below, height is represented in both inches and centimeters. However, if `heightInInches` is changed, `heightInCentimeters` should also adjust to match it. Add a `didSet` to each property that will check if the other property is what it should be, and if not, sets the proper value. If you set the value of the other property even though it already has the right value, you will end up with an infinite loop of each property setting the other.

 Create an instance of `Height` and then change one of its properties. Print out the other property to ensure that it was adjusted accordingly.
 */
struct Height {
    var ogInches: Double = 0
    var ogCent: Double = 0
    private var inchesChange = false
    private var centimetersChange = false
    var heightInInches: Double {
        didSet {
            inchesChange = true
            ogInches = oldValue
            changing()
        }
    }
    var heightInCentimeters: Double {
        didSet {
            centimetersChange == true
            ogCent = oldValue
            changing()
        }
    }
    
    init(heightInches: Double) {
        self.heightInInches = heightInches
        self.heightInCentimeters = heightInches * 2.54
    }
    
    init(heightCentimeters: Double) {
        self.heightInCentimeters = heightCentimeters
        self.heightInInches = heightCentimeters / 2.54
    }
    
    func description() {
        print("Height in Inches: \(heightInInches)")
        print("Height in Centimeters: \(heightInCentimeters)")
    }
    
    private mutating func changing() {
        if heightInInches != ogInches && heightInInches * 2.54 == heightInCentimeters {
            return
        } else if inchesChange == true && ogInches != heightInInches {
            heightInCentimeters = heightInInches * 2.54
        } else if heightInCentimeters != ogCent && heightInCentimeters == heightInInches * 2.54 {
            return
        } else if centimetersChange == true && ogCent != heightInCentimeters {
            heightInInches = heightInCentimeters / 2.54
        }
        inchesChange = false
        centimetersChange = false
    }
}
        
    
var height = Height(heightInches: 1.0)
print(height.heightInInches == height.heightInCentimeters / 2.54)
print(height.heightInInches * 2.54 == height.heightInCentimeters)
height.description()
height.heightInInches = 3.0
height.description()


[Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Mile Times and Congratulations](@next)
 
