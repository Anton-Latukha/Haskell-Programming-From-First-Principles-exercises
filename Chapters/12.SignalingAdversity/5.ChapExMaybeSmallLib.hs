
-- 1. Boolean checks
isJust :: Maybe a -> Bool
isJust (Just a) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing = not.isJust

-- 2. Maybe catamorphism
mayybee :: b -> (a->b) -> Maybe a -> b
mayybee b _ Nothing = b
mayybee _ f (Just a) = f a

-- 3. Fallback value
fromMaybe :: a -> Maybe a -> a
fromMaybe fallback maybe = mayybee fallback (id) maybe

-- 4. Converting List <-> Maybe
listToMaybe :: [a] -> Maybe a
listToMaybe (x:_) = Just x
listToMaybe [] = Nothing

maybeToList :: Maybe a -> [a]
maybeToList (Just val) = [val]
maybeToList Nothing = []
