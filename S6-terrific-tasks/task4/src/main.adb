with Ada.Text_IO;
with Parallel_Merge_Sort;
with GNAT.Strings; use GNAT.Strings;
with GNAT.Command_Line; use GNAT.Command_Line;
with Ada.Task_Identification;  use Ada.Task_Identification;

procedure Main is
   -- Declare lists to sort and instanciate sort package.
   package Integer_Sort is new Parallel_Merge_Sort(Item_Type => Integer,
                                                   "=" => "=",
                                                   "<" => "<");
   Test_In_Array : constant Integer_Sort.Array_Access_Type
     := new Integer_Sort.Array_Type(1..9);
   Test_Out_Array : constant Integer_Sort.Array_Access_Type
     := new Integer_Sort.Array_Type(1..9);

   -- Declare command line switches and arguments
   Config : Command_Line_Configuration;
   In_List_Path : aliased String_Access;
   Out_List_Path : aliased String_Access;
   Time_Parameter : aliased Integer := 0;

   Answer : Character;



begin
   Define_Switch (Config, In_List_Path'Access, "-i:",
                  Help => "-i missing, need path to input file");
   Define_Switch (Config, Out_List_Path'Access, "-o:",
                  Help => "-o missing, need path to output file");
   Define_Switch (Config, Time_Parameter'Access, "-t:",
                  Help => "-t missing, set timeout as integer");

   Getopt(Config);

   Integer_Sort.Set_Timeout(Duration(Time_Parameter));

   Ada.Text_IO.Put_Line(Item => In_List_Path.all);
   Ada.Text_IO.Put_Line(Item => Out_List_Path.all);

   Test_In_Array.all := (8,1,6,6,4,3,2,7,9);

   Integer_Sort.Parallel_Merge_Sort (Test_In_Array, Test_Out_Array);

   while not Integer_Sort.Is_Finished loop
      Ada.Text_IO.Get_Immediate(Answer);
            if Answer = 'q' then
                Abort_Task(Current_Task);
                exit;
            end if;
   end loop;
end Main;
