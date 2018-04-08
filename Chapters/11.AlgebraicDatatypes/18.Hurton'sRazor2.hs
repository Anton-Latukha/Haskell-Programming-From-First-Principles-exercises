data Expr
  = Lit Integer
  | Add Expr Expr

printExpr :: Expr -> String
printExpr (Lit x) = show x
printExpr (Add x y) = (printExpr x) ++ " + " ++ (printExpr y)
