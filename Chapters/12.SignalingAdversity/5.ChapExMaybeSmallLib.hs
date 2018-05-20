
-- 1. Boolean checks
isJust :: Maybe a -> Bool
isJust (Just a) = True
isJust Nothing = False

isNothing :: Maybe a -> Bool
isNothing = not isJust

-- 2. Maybe catamorphism
mayybee :: b -> (a->b) -> Maybe a -> b
mayybee b _ Nothing = b
mayybee _ f (Just a) = f a
