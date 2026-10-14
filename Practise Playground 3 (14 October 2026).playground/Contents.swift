import Cocoa

var greeting = "Hello, playground"

protocol Vehicle { // Code contracts that have to be implemented by conformed to these protocol
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// Travel using Vehicle
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("LOW")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimate(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name)\(estimate) hours to travel \(distance)km")
    }
}

struct Car: Vehicle {
    let name: String = "Car"
    var currentPassengers: Int = 5
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("I am drinking \(distance)km")
    }
    
    func openSunroof() {
        print("Nice day")
    }
}

struct Bicycle: Vehicle {
    let name: String = "Honda"
    var currentPassengers: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    
    func travel(distance: Int) {
        print("I am cycling \(distance)km")
    }
}


let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimate(using: [car, bike], distance: 150)


// Protocols let us define how structs, classes, and enums ought to work: what methods they should have, and what properties they should have. Swift will enforce these rules for us, so that when we say a type conforms to a protocol Swift will make sure it has all the methods and properties required by that protocol
// Helps writing general code
// Protocols allow us to do is treat our data in more general terms. So, rather than saying “this buy() method must accept a Book object,” we can say “this method can accept anything that conforms to the Purchaseable protocol

protocol Purchaseable {
    var name: String { get set }
}

struct Book: Purchaseable {
    var name: String
    var author: String
}

struct Movie: Purchaseable {
    var name: String
    var actors: [String]
}

struct MotorCar: Purchaseable {
    var name: String
    var manufacturer: String
}

struct Coffee: Purchaseable {
    var name: String
    var strength: Int
}

func buy(_ item: Purchaseable) {
    print("I'm buying \(item.name)")
}


// Examples of Protocols
protocol Swimmable {
    var depth: Int { get }
}


protocol Climbable {
    var height: Double { get }
    var gradient: Int { get }
}



protocol Mailable {
    var width: Double { get set }
    var height: Double { get set }
}


protocol Strokeable {
    var fluffiness: Int { get }
}

protocol Learnable {
    var difficulty: Int { get }
}

protocol Washable {
    var dirtinessLevel: Int { get set }
}


protocol Singable {
    var lyrics: [String] { get set }
    var notes: [String] { get set }
}


protocol Plantable {
    var requirements: [String] { get set }
}


protocol Buildable {
    var numberOfBricks: Int { get set }
    var materials: [String] { get set }
}


protocol Liftable {
    var weight: Double { get set }
}


// Opaque return type
func getRandomNumber() -> some Equatable { // some Equatable is opaque return type // Compiler will determine what it will return durin compilation time // In case of very complex return type // we dont need to anything swift itself will figure it out
    return Double.random(in: 1...100)
}

// Used  heavily in swiftui because return type of body computed property is very complex so swift compiler does the job for us

print(getRandomNumber())


// Extensions //  used for extending capabilites of apple standard library and your own code
var quote = "    The truth is pure and never simple           "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines) // Bit lenghty

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

let customTrimmed = quote.trim() // Simplified
print(customTrimmed)

let lyrics = """
But I keep cruising
Cant stop, wont stop moving
Its like i got this music in my mind
Saying its gonna be alright
"""

print(lyrics.lines.count)

struct Hardcopy {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Hardcopy {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// To have both initialiser - memberwise initialiser and custom initialiser use extensions

let lotr = Hardcopy(title: "1", pageCount: 4, readingHours: 1)


// Extension Examples
extension Double {
    var isNegative: Bool {
        return self < 0
    }
}

extension Int {
    var isEven: Bool {
        return self.isMultiple(of: 2)
    }
}

extension String {
    mutating func append(_ other: String) {
        self += other
    }
}

extension Int {
    func times(_ action: () -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}

extension Array {
    func summarize() {
        print("The array has \(count) items. They are:")
        for item in self {
            print(item)
        }
    }
}


extension Int {
    var isAnswerToLifeUniverseAndEverything: Bool {
        let target = 42
        return self == target
    }
}

extension Bool {
    func toggled() -> Bool {
        if self == true {
            return false
        } else {
            return true
        }
    }
}


extension Int {
    func cubed() -> Int {
        return self * self * self
    }
}


extension Int {
    func clamped(min: Int, max: Int) -> Int {
        if (self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}

extension String {
    var isLong: Bool {
        return self.count > 25
    }
}


extension String {
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}


extension String {
    func isUppercased() -> Bool {
        return self == self.uppercased()
    }
}



// Protocol Extension
