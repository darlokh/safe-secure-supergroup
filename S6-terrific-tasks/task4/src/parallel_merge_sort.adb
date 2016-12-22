with Ada.Text_IO;

package body Parallel_Merge_Sort is

   procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                 Result: Array_Access_Type) is
   begin
      declare 
         test_int : Integer := 0;
      begin
         for i in Input'First .. Input'Last loop
            Result(i) := Input(i);
         end loop;
      end;
   end Parallel_Merge_Sort;

end Parallel_Merge_Sort;
