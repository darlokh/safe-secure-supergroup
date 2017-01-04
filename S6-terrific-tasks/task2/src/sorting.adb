package body Sorting is
   pragma SPARK_Mode(on);

   procedure Selection_Sort(A : in out Natural_Array) is
      Min  : Natural;
      Temp : Natural;
   begin
      -- loop whole array
      for I in A'First..A'Last - 1 loop
         pragma Loop_Invariant(A(I) <= A(I+1));
         -- assume current first index as min
         Min := I;
         -- loop all remaining elements
         for J in I + 1..A'Last loop
            pragma Loop_Invariant(Min <= A(J));
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
   function Is_Sorted(A: Natural_Array) return Boolean is
   begin
      for I in A'First..A'Last - 1 loop
         if A(I) > A(I+1) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Sorted;

end Sorting;
