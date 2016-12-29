generic
   type Item_Type is private;
   with function "="(Left: Item_Type; Right: Item_Type) return Boolean;
   with function "<"(Left: Item_Type; Right: Item_Type) return Boolean is <>;
package Parallel_Merge_Sort is
    
   type Array_Type is array(Natural range <>) of Item_Type;
   type Array_Access_Type is access all Array_Type;

   procedure Parallel_Merge_Sort(Input: Array_Access_Type;
                                 Result: Array_Access_Type);
   task type Sort_Task_Type is
      entry Set_Unsorted(Sort_Input : Array_Access_Type);
      entry Set_Sorted(Sort_Result : Array_Access_Type);
   end Sort_Task_Type;
   
private 
   subtype Private_Sort_Task_Type is Sort_Task_Type;
   
end Parallel_Merge_Sort;
