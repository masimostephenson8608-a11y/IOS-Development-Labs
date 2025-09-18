/*:
## App Exercise - Fitness Tracker: Constant or Variable?
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 There are all sorts of things that a fitness tracking app needs to keep track of in order to display the right information to the user. Similar to the last exercise, declare either a constant or a variable for each of the following items, and assign each a sensible value. Be sure to use proper naming conventions.
 
- Name: The user's name
- Age: The user's age
- Number of steps taken today: The number of steps that a user has taken today
- Goal number of steps: The user's goal for number of steps to take each day
- Average heart rate: The user's average heart rate over the last 24 hours
 */
let name = "Brandon"
print("I made \"name\" a constant because the name of the person won't change.")
var age = 28
print("I made \"age\" a variable because the age of the person can change.")
var stepsToday = 100
print("I made the number of current steps a variable because it can change throughout the day.")
let goal = 10000
print("I made the goal for the number of steps a constant because thats the set goal of steps that the person wants to achieve.")
var avgHR = 70
print("I made the average heart rate a variable because its over the last 24 hours, which can change with each hour.")
/*:
 Now go back and add a line after each constant or variable declaration. On those lines, print a statement explaining why you chose to declare the piece of information as a constant or variable.
 
[Previous](@previous)  |  page 6 of 10  |  [Next: Exercise - Types and Type Safety](@next)
 */
