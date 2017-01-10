------------------------------------------------------------------
-- Parallel Addition of Array Elements --
------------------------------------------------------------------
generic
   type Item_Type is private;
   with  function "+" (Left: Item_Type ; Right : Item_Type ) return Item_Type ;
package Parallel_Algorithms is
   type Array_Type is array(Natural range <>) of Item_Type;
   type Array_Access_Type is access all Array_Type;

   task type Adder is
      Entry Set_Slice(Array_Length :  Natural; isFirst : Boolean; 
                      Item : in not null Array_Access_Type; Val : Item_Type);
   end Adder;

   protected ResultWrapper is
      procedure Parallel_Sum(Input: Array_Access_Type; Result : out Item_Type) ;
      function getRes return Item_Type;
      procedure setRes(Item : Item_Type);
   private
      Res : Item_Type;
   end ResultWrapper;

end Parallel_Algorithms;