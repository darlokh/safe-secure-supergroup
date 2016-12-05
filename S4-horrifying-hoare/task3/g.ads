function G(N: Natural; K: Natural) return Natural is
    X: Natural; 
    Y: Natural; 
    Z: Natural; 
begin
    X := F(K);
    Y := F(N-K);
    Z := F(N);
    return Z / (X * Y);
end G;