data Fiction = Fiction deriving Show
data Nonfiction = Nonfiction deriving Show
data BookType = FictionBook Fiction | NonfictionBook Nonfiction deriving Show

type AuthorName = [Char]
data Author = Author (AuthorName, BookType)
