package body Parallel_Algorithms is

   task body Adder is
      My_Array        : Array_Access_Type;
      Id_Low, Id_High : Natural;
      Sum             : Item_Type;
   begin
      accept Set_Slice(Array_Length : Natural; isFirst : Boolean; 
                       Item : in not null Array_Access_Type; Val : Item_Type) do
         if isFirst then
            Id_Low := 1;
            if Array_Length mod 2 = 0 then
              Id_High := Array_Length/2;
            else
              Id_High := (Array_Length-1)/2;
            end if;
         else
            Id_High := Array_Length;
            if Array_Length mod 2 = 0 then
              Id_Low := (Array_Length+2)/2;
            else
              Id_Low := (Array_Length+1)/2;
            end if;
         end if;
         My_Array := new Array_Type'(Item(Id_Low .. Id_High));
         Sum := Val;
      end Set_Slice;
      ResultWrapper.setRes(Sum);
      ResultWrapper.Parallel_Sum(My_Array, Sum);
   end Adder;

   protected body ResultWrapper is


      procedure Parallel_Sum (Input: Array_Access_Type; Result : out Item_Type)  is
      begin
        for I in Input'Range loop
           Result := Res + Input(I);
           setRes(Result);
        end loop;
      end Parallel_Sum;

      function getRes return Item_Type is
      begin
         return Res;
      end getRes;

      procedure setRes(Item : Item_Type) is
      begin
         Res := Item;
      end setRes;



   end ResultWrapper;

end Parallel_Algorithms;