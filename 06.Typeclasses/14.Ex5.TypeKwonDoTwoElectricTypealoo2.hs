arith :: Num b
      => (a -> b)
      -> Integer
      -> a
      -> b
arith f i a = f a + fromIntegral i
