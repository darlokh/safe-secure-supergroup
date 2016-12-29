with Ada.Text_IO;

package body Parallel_Merge_Sort is
   
   task body Sort_Task_Type is
      Input : Array_Access_Type;
      Result : Array_Access_Type;
      left_in , left_out : Array_Access_Type;
      right_in, right_out : Array_Access_Type;
        
   begin
      Ada.Text_IO.Put_Line("Task Started");
      select
         accept Set_Unsorted (Sort_Input : in Array_Access_Type) do
            Input := Sort_Input;
            left_in := new Array_Type(1..Input'Length/2);
            left_out := new Array_Type(1..Input'Length/2);
            right_in := new Array_Type(1..Input'Length/2+(Input'Length mod 2));
            right_out := new Array_Type(1..Input'Length/2+(Input'Length mod 2));
         end Set_Unsorted;
         accept Set_Sorted (Sort_Result : in Array_Access_Type) do
            Ada.Text_IO.Put_Line("Task Started");
            Result := Sort_Result;
         end Set_Sorted;
      or
         delay 10.0;
         Ada.Text_IO.Put_Line("Task Failed");
      end select;
      
      -- only 1 left
      if Input'Length = 1 then
         Result(1) := Input(1);
      else
         -- split list
         left_in.all := Input(Input'First..Input'Length/2);
         right_in.all := Input((Input'Length/2)+1..Input'Last);
      
         -- recursive call
         declare 
            Left_Sort_Task, Right_Sort_Task : Private_Sort_Task_Type;  
         begin
            Left_Sort_Task.Set_Unsorted(left_in);
            Left_Sort_Task.Set_Sorted(left_out);
         
            Right_Sort_Task.Set_Unsorted(right_in);
            Right_Sort_Task.Set_Sorted(right_out);
         end;
      
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
                  Ada.Text_IO.Put_Line("Imaginary Exception");
               end if;
            end loop;
         end;
      end if;
      
   end Sort_Task_Type;

   procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                 Result: Array_Access_Type) is
   begin
      declare 
         test_task : Sort_Task_Type;  
      begin
         test_task.Set_Unsorted(Input);
         test_task.Set_Sorted(Result);
      end;
      
   end Parallel_Merge_Sort;

end Parallel_Merge_Sort;
