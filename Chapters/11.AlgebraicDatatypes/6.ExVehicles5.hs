data Price = Price Integer
    deriving (Eq, Show)

data Size = Size Integer
    deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata
    deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited
    deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size
    deriving (Eq, Show)


myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir (Size 9001)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar (Plane _ _) = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane (Car _ _) = False

areCars :: [Vehicle] -> [Bool]
areCars list = fmap (isCar) list

getManu :: Vehicle -> Maybe Manufacturer
getManu (Car manufacturer _) = Just manufacturer
getManu (Plane _ _) = Nothing
