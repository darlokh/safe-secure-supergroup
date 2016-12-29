with Ada.Text_IO;
with Parallel_Merge_Sort;
with GNAT.Strings; use GNAT.Strings;
with GNAT.Command_Line; use GNAT.Command_Line;

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

begin
   Define_Switch (Config, In_List_Path'Access, "-i:",
                  Help => "-i missing, need path to input file");
   Define_Switch (Config, Out_List_Path'Access, "-o:",
                  Help => "-o missing, need path to output file");
   Define_Switch (Config, Time_Parameter'Access, "-t:",
                  Help => "-t missing, set timeout as integer");

   Getopt(Config);

   Ada.Text_IO.Put_Line(Item => In_List_Path.all);
   Ada.Text_IO.Put_Line(Item => Out_List_Path.all);
   Ada.Text_IO.Put_Line(Item => Time_Parameter'Image);

   Test_In_Array.all := (8,1,6,6,4,3,2,7,9);
   declare
      test_task : Integer_Sort.Sort_Task;
   begin
      test_task.Set_Unsorted(Test_In_Array);
      test_task.Set_Sorted(Test_Out_Array);
   end;

   declare
      test_int : Integer := 0;
   begin
      for i in Test_Out_Array'First .. Test_Out_Array'Last loop
         test_int := Test_Out_Array.all(i);
         Ada.Text_IO.Put_Line(test_int'Image);
      end loop;
   end;
end Main;
