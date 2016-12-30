with Ada.Text_IO;
with Ada.Task_Identification;  use Ada.Task_Identification;

package body Parallel_Merge_Sort is
   
   Timeout : Duration := 10.0;
   Finished : Boolean := False;
   
   task body Sort_Task is
      Input : Array_Access_Type;
      Result : Array_Access_Type;
      left_in , left_out : Array_Access_Type;
      right_in, right_out : Array_Access_Type;
        
   begin
      Ada.Text_IO.Put_Line("Task Started");
         accept Set (Sort_Input, Sort_Result : in Array_Access_Type) do
            Input := Sort_Input;
            Result := Sort_Result;
            left_in := new Array_Type(1..Input'Length/2);
            left_out := new Array_Type(1..Input'Length/2);
            right_in := new Array_Type(1..Input'Length/2+(Input'Length mod 2));
            right_out := new Array_Type(1..Input'Length/2+(Input'Length mod 2));
      end Set;
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
            select
               Left_Sort_Task.Set (left_in, left_out);
               Right_Sort_Task.Set (right_in, right_out);
            or 
               delay Timeout;
               Abort_Task(Left_Sort_Task'Identity);
               Abort_Task(Right_Sort_Task'Identity);
            end select;
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
   end Sort_Task;
   
   procedure Parallel_Merge_Sort(Input, Result : Array_Access_Type) is
      
   begin
      declare
         test_task : Sort_Task;
      begin
         select
            test_task.Set (Input, Result);
         or delay Timeout;
            Ada.Text_IO.Put_Line("Abort Mission !!!");
            Abort_Task(test_task'Identity);
            Abort_Task(Current_Task);
         end select;
      end;
      Finished := true;
      
   end;
   
   procedure Set_Timeout(New_Timeout : Duration) is
   begin
      Timeout := New_Timeout;
   end Set_Timeout;
   
   function Is_Finished return Boolean is
   begin
      return Finished;
   end Is_Finished;
   
end Parallel_Merge_Sort;
