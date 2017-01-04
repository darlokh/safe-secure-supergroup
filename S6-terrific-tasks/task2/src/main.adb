with Ada.Text_IO;
with Sorting;

procedure Main is
   My_Array : Sorting.Natural_Array :=
     (1,3,5,7,9,2,4,6,8);
begin
   Ada.Text_IO.Put_Line("Unsorted:");
   Ada.Text_IO.Put_Line("[" & My_Array(0)'Image & "," &
                          My_Array(1)'Image & "," &
                          My_Array(2)'Image & "," &
                          My_Array(3)'Image & "," &
                          My_Array(4)'Image & "," &
                          My_Array(5)'Image & "," &
                          My_Array(6)'Image & "," &
                          My_Array(7)'Image & "," &
                          My_Array(8)'Image & "]"
                       );

   Sorting.Selection_Sort(My_Array);
   Ada.Text_IO.Put_Line("Sorted:");
   Ada.Text_IO.Put_Line("[" & My_Array(0)'Image & "," &
                          My_Array(1)'Image & "," &
                          My_Array(2)'Image & "," &
                          My_Array(3)'Image & "," &
                          My_Array(4)'Image & "," &
                          My_Array(5)'Image & "," &
                          My_Array(6)'Image & "," &
                          My_Array(7)'Image & "," &
                          My_Array(8)'Image & "]"
                       );
end Main;
