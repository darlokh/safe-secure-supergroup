generic
   type Item_Type is private;
   with function "="(Left: Item_Type; Right: Item_Type) return Boolean;
   with function "<"(Left: Item_Type; Right: Item_Type) return Boolean is <>;
package Parallel_Merge_Sort is
    
   type Array_Type is array(Natural range <>) of Item_Type;
   type Array_Access_Type is access all Array_Type;
   
   task type Sort_Task is
      entry Set(Sort_Input, Sort_Result : Array_Access_Type);
   end Sort_Task;
   
   procedure Set_Timeout(New_Timeout : Duration);
   function Is_Finished return Boolean;
   
   procedure Parallel_Merge_Sort(Input, Result : Array_Access_Type);
   
private 
   subtype Private_Sort_Task_Type is Sort_Task;
   
   
end Parallel_Merge_Sort;
