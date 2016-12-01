package Math is
      --swap X and Y (bitwise xor)
    Procedure S(X: in out Natural; Y: in out Natural) with
      -- since Natural'Size is 31 bit:
      Pre => (X <= Natural'Last) and (Y <= Natural'Last)
      -- implicit X, Y >= 0, X'Old = X, Y'Old = Y
      Post => (X'Old = Y) and (Y'Old = X);

    Procedure T(X: in out Natural; Y: in out Natural; Z: in out Natural) with
      Pre => (X <= Natural'Last)
        and (Y <= Natural'Last)
        and (Z <= Natural'Last);
      Post => (X <= Y and Y <= Z and X <= Z)
        -- out list has to be a permutation of in list
        and ((X = X'Old and Y = Y'Old and Z = Z'Old)
        or (X = X'Old and Z = Y'Old and Y = Z'Old)
        or (Y = X'Old and X = Y'Old and Z = Z'Old)
        or (Y = X'Old and Z = Y'Old and X = Z'Old)
        or (Z = X'Old and X = Y'Old and Y = Z'Old)
        or (Z = X'Old and Y = Y'Old and X = Z'Old));
end package;
