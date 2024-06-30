//homework 1 by Tarasov Timofey

class Car {
    var brand: String
    var model: String
    var dateOfRelease: Int
    var avgSpeed: Int
    
    init(brand: String, model: String, dateOfRelease: Int, avgSpeed: Int) {
        self.brand = brand
        self.model = model
        self.dateOfRelease = dateOfRelease
        self.avgSpeed = avgSpeed
    }
    
    func printInfo() {
        print("Марка - \(brand), Модель - \(model), Год выпуска - \(dateOfRelease) ")
    }
}

class BMW: Car {
    var enginePower: Float
    var fuelCompution: Float
    
    init(model: String, dateOfRealese: Int ,avgSpeed: Int, enginePower: Float, fuelCompution: Float ) {
        self.enginePower = enginePower
        self.fuelCompution = fuelCompution
        super.init(brand: "BMW", model: model, dateOfRelease: dateOfRealese, avgSpeed: avgSpeed)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Мощность двигателя - \(enginePower), Расход топлива - \(fuelCompution)")
    }
}

class Mercedes: Car {
    var drivetrain: String
    var bodyType: String
    
    init(model: String, dateOfRelease: Int, avgSpeed: Int, drivetrain: String, bodyType: String) {
        self.drivetrain = drivetrain
        self.bodyType = bodyType
        super.init(brand: "Mercedes", model: model, dateOfRelease: dateOfRelease, avgSpeed: avgSpeed)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Привод - \(drivetrain), Тип кузова - \(bodyType)")
    }
}

class Lada: Car {
    var transmission: String
    var trunkVolume: Int
    
    init(model: String, dateOfRelease: Int, avgSpeed: Int, transmission: String, trunkVolume: Int) {
        self.transmission = transmission
        self.trunkVolume = trunkVolume
        super.init(brand: "Lada", model: model, dateOfRelease: dateOfRelease, avgSpeed: avgSpeed)
    }
        
    override func printInfo() {
        super.printInfo()
        print("Тип трансмиссии - \(transmission), Объем багажника - \(trunkVolume) л")
    }
}

class Volkswagen: Car {
    var fuelType: String
    var seatCount: Int
        
    init(model: String, dateOfRelease: Int, avgSpeed: Int, fuelType: String, seatCount: Int) {
        self.fuelType = fuelType
        self.seatCount = seatCount
    
        super.init(brand: "Volkswagen", model: model, dateOfRelease: dateOfRelease, avgSpeed: avgSpeed)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Тип топлива - \(fuelType), Количество мест - \(seatCount)")
    }
}


func createCar(type: String) -> Car? {
    switch type {
    case "Volkswagen":
        return Volkswagen( model: "Polo", dateOfRelease:2015, avgSpeed: 80, fuelType: "Benzin", seatCount: 5)
    case "BMW":
        return BMW(model: "X5", dateOfRealese: 2016, avgSpeed: 110, enginePower: 10.5, fuelCompution: 15.7)
    case "Lada":
        return Lada(model: "Vesta", dateOfRelease: 2014, avgSpeed: 70, transmission: "Automatic", trunkVolume: 540)
    case "Mercedes":
        return Mercedes(model: "E-class", dateOfRelease: 2020, avgSpeed: 120, drivetrain: "full", bodyType: "Sedan")
    default:
        return nil
    }
}

var newCar = Car(brand: "BMW", model: "M4", dateOfRelease:2021, avgSpeed: 100)
newCar.printInfo();

if let car = createCar(type: "BMW") {
    car.printInfo()
}

if let car = createCar(type: "Lada") {
    car.printInfo()
}

if let car = createCar(type: "Mercedes") {
    car.printInfo()
}
//Тойоты нет, поэтому ниче не создастся 
if let car = createCar(type: "Toyota") {
    car.printInfo()
}

func createRandomCars(count: Int) -> [Car] {
    let carTypes = ["BMW", "Lada", "Mercedes", "Volkswagen"]
    var cars = [Car]()
    for _ in 0..<count {
        if let car = createCar(type: carTypes.randomElement()!) {
            cars.append(car)
        }
    }
    return cars
}

func checkSpeed(car1: Car, car2: Car) -> Car {
    return car1.avgSpeed >= car2.avgSpeed ? car1 : car2
}

func race(cars: [Car]) {
    guard cars.count % 2 == 0 else {
        print("Количество автомобилей должно быть четным")
        return
    }
    
    var remainingCars = cars
    var raceNumber = 1
    
    while remainingCars.count > 1 {
        print("Раунд гонок \(raceNumber):")
        var winners = [Car]()
        
        for i in stride(from: 0, to: remainingCars.count, by: 2) {
            let car1 = remainingCars[i]
            let car2 = remainingCars[i + 1]
            
            print("Гонка между:")
            car1.printInfo()
            car2.printInfo()
            
            let winner = checkSpeed(car1: car1, car2: car2)
            print("Победитель гонки:")
            winner.printInfo()
            print("---")
            
            winners.append(winner)
        }
        
        remainingCars = winners
        raceNumber += 1
    }
    
    print("Итоговый победитель:")
    remainingCars.first?.printInfo()
}

let cars = createRandomCars(count: 8)

race(cars: cars)

