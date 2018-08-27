data Price = Price Integer
    deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata | Unknown
    deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited
    deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline
    deriving (Eq, Show)


myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar (Plane _) = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane (Car _ _) = False

areCars :: [Vehicle] -> [Bool]
areCars list = fmap (isCar) list

getManu :: Vehicle -> Manufacturer
getManu (Car manufacturer _) = manufacturer
getManu (Plane _) = Unknown
