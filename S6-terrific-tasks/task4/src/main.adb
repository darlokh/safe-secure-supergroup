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
   Test_In_Array : Integer_Sort.Array_Access_Type;
   Test_Out_Array : Integer_Sort.Array_Access_Type;

   -- Declare command line switches and arguments
   Config : Command_Line_Configuration;
   In_List_Path : aliased String_Access;
   Out_List_Path : aliased String_Access;
   Time_Parameter : aliased Integer := 10;

   Answer : Character;

   procedure Parse_In_File(In_File_Path : String) is
      use Ada.Text_IO;
      Input_File : File_Type;
      Line_Count : Integer := 0;
   begin
      Open(File => Input_File, Mode => In_File, Name => In_File_Path);
      while not End_Of_File (Input_File) loop
         Line_Count := Line_Count + 1;
         Put_Line(Get_Line(Input_File));
      end loop;
      Reset(File => Input_File, Mode => In_File);
      Test_In_Array := new Integer_Sort.Array_Type(1..Line_Count);
      Test_Out_Array := new Integer_Sort.Array_Type(1..Line_Count);
      Line_Count := 1;
      while not End_Of_File (Input_File) loop
         Test_In_Array(Line_Count) := Integer'Value(Get_Line(Input_File));
         Line_Count := Line_Count + 1;
      end loop;
      Close(Input_File);
   end;

   procedure Print_List_To_File is
      use Ada.Text_IO;
      Output : File_Type;
      Printable_Integer : Integer;
   begin
      Create (File => Output, Mode => Out_File, Name => Out_List_Path.all);
      for i in Test_Out_Array'First .. Test_Out_Array'Last loop
         Printable_Integer := Test_Out_Array(i);
         Put_Line(Output, Printable_Integer'Image);
      end loop;
      Close (Output);
   exception
      when others =>
         Put_Line ("Failed to write to file, check permissions and if file already exists");
   end;

begin
   Define_Switch (Config, In_List_Path'Access, "-i:",
                  Help => "set path to input file");
   Define_Switch (Config, Out_List_Path'Access, "-o:",
                  Help => "set path to output file");
   Define_Switch (Config, Time_Parameter'Access, "-t:",
                  Help => "set timeout as integer");

   Getopt(Config);

   Integer_Sort.Set_Timeout(Duration(Time_Parameter));

   Ada.Text_IO.Put_Line(Item => In_List_Path.all);
   Ada.Text_IO.Put_Line(Item => Out_List_Path.all);

   if In_List_Path.all = "" then
      Test_In_Array := new Integer_Sort.Array_Type(1..9);
      Test_Out_Array := new Integer_Sort.Array_Type(1..9);
      Test_In_Array.all := (8,1,6,5,4,3,2,7,9);
   else
      -- read list from file
      Parse_In_File(In_List_Path.all);
   end if;


   Integer_Sort.Parallel_Merge_Sort (Test_In_Array, Test_Out_Array);

   while not Integer_Sort.Is_Finished loop
      Ada.Text_IO.Get_Immediate(Answer);
      if Answer = 'q' then
         Abort_Task(Current_Task);
         exit;
      end if;
   end loop;

   -- sort finished and not aborted -> write output
   if Out_List_Path.all = "" then
      declare
         Printable_Integer : Integer;
      begin
         Ada.Text_IO.Put_Line("Sorted List: ");
         for i in Test_Out_Array'First .. Test_Out_Array'Last loop
            Printable_Integer := Test_Out_Array(i);
            Ada.Text_IO.Put(Printable_Integer'Image);
            Ada.Text_IO.Put(" ");
         end loop;
      end;
   else
      Print_List_To_File;
   end if;
end Main;
