package Sorting is
   pragma Assertion_Policy(Pre => Check);
   pragma Assertion_Policy(Post => Check);
   pragma SPARK_Mode(on);

   type Natural_Array is array(Natural range <>) of Natural;

   -- sort array containing Natural elements with Selection Sort
   procedure Selection_Sort(A: in out Natural_Array) with
     Global => null,
     Pre  => A'Length > 1,
     Post => Is_Sorted(A) and A'Length = A'Old'Length;

   -- helper
   -- is sorted function
   function Is_Sorted(A: Natural_Array) return Boolean;
end Sorting;
