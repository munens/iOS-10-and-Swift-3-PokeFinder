//: Playground - noun: a place where people can play

import UIKit

// creating a protocol for a vehicle:
protocol Vehicle: CustomStringConvertible { // we can also combine protocols: here we can use CustomStringConvertible . This means all types implementing this protocol also have to implement the functions and properties of that protocol as well. We can also add this Protocol to any structs or classes as well, instead of placing them here, but the point is is that protocols can be defined.
    
    // using a get, set allows us to define whether a propert is a read only property - or read-write:
    var isRunning: Bool { get set }
    
    var make: String { get set }
    var model: String { get set }
    
    // use 'mutating' if a property is likely to be mutates inside of the structure.
    mutating func start()
    mutating func stop()
}

// Make an extension implementing the Vehicle protocol: Can also use functions and properties from protocols that were combined with Vehicle above:
extension Vehicle {
    
    var makeModel: String {
        return "\(make) \(model)"
    }
    
    // remove duplicated code by placing functions in an extension i.e. We have implemented the start() and stop() functions in the SportsCar and SemiTruck methods below:
    mutating func start() {
        if isRunning {
            print("already started")
        } else {
            isRunning = true
            print("\(self.description) fired up!")
        }
    }
    
    mutating func stop() {
        if isRunning {
            isRunning = false
            print("\(self.description) shut down!")
        } else {
            print("Already turned off")
        }
    }
    
}


struct SportsCar: Vehicle {
    var isRunning: Bool = false
    
    var make: String
    var model: String
    
    var description: String {
        /*
        if isRunning {
            return "Sports car currently running"
        } else {
            return "Sports car is currently off"
        }*/
        return self.makeModel
    }
    
    
    /* the start() and stop() method are now implemented in the extension
    mutating func start() {
        if isRunning {
            print("already started")
        } else {
            print("Vrooom!")
        }
    }
    
    mutating func stop() {
        if isRunning {
            isRunning = false
            print("Crickets")
        } else {
            print("already turned off")
        }
    }
    */
}

// any type can conform to a protocol:
// - using a class:

class SemiTruck: Vehicle {
    var isRunning: Bool = false
    
    var make: String
    var model: String
    
    // use an initializer to initialize the make and model properties when this class is used:
    init(isRunning: Bool, make: String, model: String) {
        self.isRunning = isRunning
        self.make = make
        self.model = model
    }
    
    var description: String {
        /*
        if isRunning {
            return "Sports car currently running"
        } else {
            return "Sports car is currently off"
        }*/
        return self.makeModel
    }
    
    // mutating key word is not necessary because properties in a class are already mutable:
    /* the start() and stop() method are now implemented in the extension
    func start() {
        if isRunning {
            print("already started")
        } else {
            print("Rumble")
        }
    }
    
    func stop() {
        if isRunning {
            isRunning = false
            print("BA BA BA!!")
        } else {
            print("already turned off")
        }
    }
    */
    
    func blowAirHorn() {
        print("TOOOOOT :)")
    }
}


// make some instances:
var car1 = SportsCar(isRunning: false, make: "Porsche", model: "911")
var truck1 = SemiTruck(isRunning: false, make: "Chevorlet", model: "Eldorado")


car1.start()
truck1.start()
truck1.blowAirHorn()

car1.stop()
truck1.stop()

// make an array of vehicles:
var vehicleArray: Array<Vehicle> = [car1, truck1]

for vehicle in vehicleArray {
    // print("\(vehicle.blowAirHorn())") - unable to do this since the vehicle protool doesnt have this defined. It is ofcourse defined in the SemiTruck class. We can show how this can be done below:
    if let vehicle = vehicle as? SemiTruck {
        vehicle.blowAirHorn()
        
        // Use the protocol CustomStringConvertible that was combined with Vehicle here too:
        print(vehicle.description)
        
        print(vehicle.makeModel)
    }
    
}


// lets make a type extension - is an extension on a primitive type. THe below allows us to call the dollarString method on anything of type Double.
extension Double {
    var dollarString: String {
        return String(format: "$%.02f", self)
    }
}

var pct = 32.15 * 0.15
print(pct.dollarString)


