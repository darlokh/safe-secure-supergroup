package body Math is
    type Unsigned is mod 2**(Integer'Size);

    -- [(X <= Natural'Last) and (Y <= Natural'Last)]
    Procedure S(X: in out Natural; Y: in out Natural) is
    begin --def(X, Y)
        -- [X'Old = X, Y'Old = Y] Rule: Assignment
        X := Natural(Unsigned(X) xor Unsigned(Y)); --def(X), c-use(X, Y)
        -- [X = X'Old xor Y'Old and Y = Y'Old] Rule: Assignment and Composition
        Y := Natural(Unsigned(X) xor Unsigned(Y)); --def(Y), c-use(X, Y)
        -- [Y = X'Old and X = X'Old xor Y'Old] Rule: Assignment and Composition
        X := Natural(Unsigned(X) xor Unsigned(Y)); --def(X), c-use(X, Y)
        -- [X = Y'Old and Y = X'Old]
    end S;
    -- [(X'Old = Y) and (Y'Old = X)]

    -- [(X <= Natural'Last) and (Y <= Natural'Last) and (Z <= Natural'Last);]
    Procedure T(X: in out Natural; Y: in out Natural; Z: in out Natural) is
    begin --def(X, Y, Z)
        -- [X'Old = X and Y'Old = Y, X > Y]
        -- Rule: Assignment, If-Then-Else,  Empty Statement
        if X > Y then --p-use(X, Y)
            S(X, Y); --c-use(X, Y)
        end if;
        -- [X <= Y and ((X = X'Old and Y = Y'Old) or (Y = X'Old and X = Y'Old))]
        -- Rule: Assignment, If-Then-Else, Composition, Empty Statement
        if Y > Z then --p-use(Y, Z)
            S(Y, Z); --c-use(Y, Z)
        end if;
        -- [X <= Z and Y <= Z
        -- and ((X = X'Old and Y = Y'Old and Z = Z'Old)
        -- or (X = X'Old and Z = Y'Old and Y = Z'Old)
        -- or (Y = X'Old and X = Y'Old and Z = Z'Old)
        -- or (Z = X'Old and X = Y'Old and Y = Z'Old))]
        -- note: above is every permutation where not X=Z'Old
        -- Rule: Assignment, If-Then-Else, Composition, Empty Statement
        if X > Y then --p-use(X, Y)
            S(X, Y); --c-use(X, Y)
        end if;
        -- [X <= Y and Y <= Z and X <= Z
        -- and ((X = X'Old and Y = Y'Old and Z = Y'Old)
        -- or (X = X'Old and Z = Y'Old and Y = Y'Old)
        -- or (Y = X'Old and X = Y'Old and Z = Y'Old)
        -- or (Y = X'Old and Z = Y'Old and X = Y'Old)
        -- or (Z = X'Old and X = Y'Old and Y = Y'Old)
        -- or (Z = X'Old and Y = Y'Old and X = Y'Old))]
    end T;
end package;
