function G(N: Natural; K: Natural) return Natural is
    X: Natural; 
    Y: Natural; 
    Z: Natural; 
begin
    X := F(K);
-- [X = F(K)] Rule: Assignment
    Y := F(N-K);
-- [Y = F(N-K)] Rule: Assignment
    Z := F(N);
-- [Z = F(N)] Rule: Assignment
    return Z / (X * Y);
end G;

-- Pre => (N <= Natural'Last)
      and (K <= Natural'Last)
      and (X <= Natural'Last)
      and (Y <= Natural'Last)
      and (Z <= Natural'Last)
-- Post => (X = (K-1)!)
       and (Y = (N-K-1)!)
       and (Z = (N-1)!)
       and (Z/(X*Y)=(N-1)! / (K-1)! * (N-K-1)!)
