

def P = Choose {
    c1 = Match "a";
    c2 = Match "b"
}

def Main = { p   = P
           ; tag = case p is {
                     c1 _, c2 _ -> ^ "either";
                   }
           }