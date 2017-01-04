package body Sorting is

   procedure Selection_Sort(A : in out Natural_Array) is
      Min  : Natural;
      Temp : Natural;
   begin
      -- loop whole array
      for I in A'First..A'Last - 1 loop
         -- assume current first index as min
         Min := I;
         -- loop all remaining elements
         for J in I + 1..A'Last loop
            -- search for lowest value
            if A(Min) > A(J) then
               Min := J;
            end if;
         end loop;
         -- if lowest value wasn't current first index
         -- exchange lowest value with current first index
         if Min /= I then
            Temp    := A(I);
            A(I)   := A(Min);
            A(Min) := Temp;
         end if;
      end loop;
   end Selection_Sort;

   -- Helper Functions

end Sorting;
