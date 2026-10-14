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
