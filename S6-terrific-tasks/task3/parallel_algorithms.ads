generic
   type Item_Type is private;
   with  function "+" (Left: Item_Type ; Right : Item_Type ) return Item_Type ;
package Parallel_Algorithms is

   type Array_Type is array(Natural range <>) of Item_Type;
   type Array_Access_Type is access all Array_Type;

   task type Adder is
      Entry Set_Slice(Start_Index, End_Index : in Natural; Item : in not null Array_Access_Type; Sum : out Item_Type);
   end Adder;

   procedure Parallel_Sum(Input: Array_Access_Type; Result : out Item_Type );

   protected Result is
      procedure Accumulate(Item : in Item_Type);
   private
      Sum : Item_Type;
   end Result;

end Parallel_Algorithms;