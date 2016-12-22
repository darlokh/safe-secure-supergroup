package body Parallel_Merge_Sort is

   procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                 Result: Array_Access_Type) is
      left_in, left_out 
      : constant Array_Access_Type := new Array_Type(1..Input'Length/2);
      right_in, right_out 
      : constant Array_Access_Type := new Array_Type(1..Input'Length/2+(Input'Length mod 2));
   begin
      -- only 1 left
      if Input'Length = 1 then
         Result(1) := Input(1);
         return;
      end if;
      
      -- split list
      left_in.all := Input(Input'First..Input'Length/2);
      right_in.all := Input((Input'Length/2)+1..Input'Last);
      
      -- recursive call
      Parallel_Merge_Sort(left_in, left_out);
      Parallel_Merge_Sort(right_in, right_out);
      
      -- merge
      declare 
         left_attended : Natural := 1;
         right_attended : Natural := 1;
      begin
         for i in Result'First .. Result'Last loop
            if left_attended <= left_out'Length and 
              right_attended <= right_out'Length then
               if left_out(left_attended) < right_out(right_attended) or
                 left_out(left_attended) = right_out(right_attended) then
                  Result(i) := left_out(left_attended);
                  left_attended := left_attended + 1;
               else
                  Result(i) := right_out(right_attended);
                  right_attended := right_attended + 1;
               end if;
            elsif left_attended <= left_out'Length and 
              right_attended > right_out'Length then
               Result(i) := left_out(left_attended);
               left_attended := left_attended + 1;
            elsif left_attended > left_out'Length and 
              right_attended <= right_out'Length then
               Result(i) := right_out(right_attended);
               right_attended := right_attended + 1;
            else
               -- should throw "this_should_never_happen_exception"
               return;
            end if;
         end loop;
      end;
   end Parallel_Merge_Sort;

end Parallel_Merge_Sort;
