-- [(N <= Natural'Last)]
function F(N: Natural) return Natural is
    I: Natural := 0; --def(I)
    X: Natural := 1; --def(X)
begin
-- [I'Old = I, X'Old = X] Rule: Assignment
    while I < N loop --p-use(I,N)
        I := I + 1; --c-use(I) def(I)
-- [I = I'Old +1] Rule: Assignment, While
        X := X * I; --c-use(X) def(X)
-- [X = X'Old * I] Rule: Assignment
    end loop;

    return X; --c-use(X)
end F;
-- [X = (N-1) and X = (N-1)!]

-- Pre => (N<= Natural'Last)
-- Post => (I = (N-1))
--	   and (X = (N-1)!)
-- Loop Invariant => (I <= X)
--               and (I < N)
-- Loop Variant   => (I := I+1)
                 and (I < N)