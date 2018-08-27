
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr f b = go (f b)
  where
    go (Just tuple) = (fst tuple):(myUnfoldr f (snd tuple))
    go otherwise = []
