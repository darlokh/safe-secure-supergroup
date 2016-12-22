with Ada.Text_IO;
with Parallel_Merge_Sort;

procedure Main is
   package Integer_Sort is new Parallel_Merge_Sort(Item_Type => Integer,
                                                   "=" => "=",
                                                   "<" => "<");
   Test_In_Array : constant Integer_Sort.Array_Access_Type
     := new Integer_Sort.Array_Type(1..9);
   Test_Out_Array : constant Integer_Sort.Array_Access_Type
     := new Integer_Sort.Array_Type(1..9);
begin
   Test_In_Array.all := (8,1,6,6,4,3,2,7,9);

   Integer_Sort.Parallel_Merge_Sort(Test_In_Array, Test_Out_Array);

   declare
      test_int : Integer := 0;
   begin
      for i in Test_Out_Array'First .. Test_Out_Array'Last loop
         test_int := Test_Out_Array.all(i);
         Ada.Text_IO.Put_Line(test_int'Image);
      end loop;
   end;
end Main;
