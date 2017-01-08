package body Parallel_Algorithms is

   task body Adder is
      My_Array        : Array_Access_Type;
      Id_Low, Id_High : Natural;
   begin

      accept Set_Slice(Start_Index, End_Index : in Natural; Item : in not null Array_Access_Type; Sum : out Item_Type) do
         Id_Low := Start_Index;
         Id_High := End_Index;
         My_Array := Item;

         for I in Id_Low..Id_High loop
            Sum := Sum + My_Array(I);
         end loop;

         Result.Accumulate(Item_Type(Sum));

      end Set_Slice;
      
   end Adder;

   --helper
   protected body Result is

      procedure Accumulate (Item : in Item_Type) is
      begin
         Sum := Sum + Item;
      end Accumulate;

      function Report return Item_Type is
      begin
         return Item_Type(Sum);
      end Report;

   end Result;


   --Parallel_Sum
   procedure Parallel_Sum(Input: Array_Access_Type; Result : out Item_Type ) is
      Task_Left, Task_Right : Adder;
      temp : Natural := 0;
      --value : Natural := 0;
      Sum : Item_Type;
   begin
      if Input'Last mod 2 = 0 then
         temp := Input'Last / 2;
         Task_Left.Set_Slice(0, temp, Input, Sum);
         temp := (Input'Last / 2) + 1;
         Task_Right.Set_Slice(temp, Input'Last, Input, Sum);
      else
         temp := (Input'Last -1) / 2;
         Task_Left.Set_Slice(0, temp, Input, Sum);
         temp := (Input'Last +1) / 2;
         Task_Right.Set_Slice(temp, Input'Last, Input, Sum);
      end if;
   end Parallel_Sum;

   

end Parallel_Algorithms;