package Sorting is
   type Natural_Array is array(Natural range <>) of Natural;

   -- sort array containing Natural elements with Selection Sort
   procedure Selection_Sort(A: in out Natural_Array);

end Sorting;
