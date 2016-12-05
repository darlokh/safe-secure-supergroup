with Ada.Text_IO;

package body Binary_Trees is

   -- initialize variables
   Temp_Parent  : Binary_Tree_Access := null;

   -- methods
   procedure Add_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
   begin
      --case 1: current leaf is empty, set item here
      if(T = null) then
         T := Create(Item=>Item);
      --case 2: current leaf equals item, throw exception
      elsif(Item = T.Item) then
         raise Item_Already_In_Tree_Exception;
      --case 3: item is smaller than current tree item, then go into left leaf
      elsif(Item < T.Item) then
         Temp_Parent := T;
         Add_Item(T=>T.Left,Item =>Item);
      --case 4: item is greater than current tree item, then go into left leaf
      else
         Temp_Parent := T;
         Add_Item(T=>T.Right,Item =>Item);
      end if;
   end Add_Item;

   function Create(Item: Item_Type) return Binary_Tree_Access is
   begin
      return new Binary_Tree'(Item=>Item, Left=>null, Right=>null, Parent=>Temp_Parent);
   end Create;

   function Has_Children(T: Binary_Tree_Access) return Boolean is
   begin
      return T.Left /= null or T.Right /= null;
   end Has_Children;

   function Has_Item(T: Binary_Tree_Access; Item: Item_Type) return Boolean is
   begin
      --case 1: current leaf is empty, set item here
      if(T = null) then
         return False;
      --case 2: current leaf equals item, throw exception
      elsif(Item = T.Item) then
         return True;
      --case 3: item is smaller than current tree item, then go into left leaf
      elsif(Item < T.Item) then
         return Has_Item(T=>T.Left,Item =>Item);
      --case 4: item is greater than current tree item, then go into left leaf
      else
         return Has_Item(T=>T.Right,Item =>Item);
      end if;
   end Has_Item;

   function Get_Height(T: Binary_Tree_Access) return Natural is
      -- Returns the height of the tree T.
      Left_Leaf : Integer := 0;
      Right_Leaf : Integer := 0;
   begin
      if(T = null) then
         return 0;
      end if;

      Left_Leaf := Get_Height_Helper(T.Left);
      Right_Leaf := Get_Height_Helper(T.Right);

      if(Left_Leaf > Right_Leaf) then
         return Left_Leaf + 1;
      else
         return Right_Leaf + 1;
      end if;
   end Get_Height;

   function Get_Height_Helper(T: Binary_Tree_Access) return Integer is
      -- Returns the height of the tree T.
      Left_Leaf : Integer := 0;
      Right_Leaf : Integer := 0;
   begin
      if(T = null) then
         return -1;
      end if;

      Left_Leaf := Get_Height_Helper(T.Left);
      Right_Leaf := Get_Height_Helper(T.Right);

      if(Left_Leaf > Right_Leaf) then
         return Left_Leaf + 1;
      else
         return Right_Leaf + 1;
      end if;
   end Get_Height_Helper;

   function Get_Num_Leaves(T: Binary_Tree_Access) return Natural is
      count : Natural := 0;
   begin
      if(T.Left /= null) then
         count := count + 1 + Get_Num_Leaves(T.Left);
      end if;

      if(T.Right /= null) then
         count := count + 1 + Get_Num_Leaves(T.Right);
      end if;

      return count;
   end Get_Num_Leaves;

   procedure Put(T: Binary_Tree_Access) is
   begin
      if(T = null) then
         Ada.Text_IO.Put("");
      else
         Put(T.Left);
         Put_Item(T.Item);
         Ada.Text_IO.Put(" ");
         Put(T.Right);
      end if;
   end Put;

   procedure Remove_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
   begin
      --case 1: last leaf is empty, so item not found
      if T = null then
         raise Item_Not_Found_Exception;
      --case 2: current leaf equals item, delete leaf
      elsif Item = T.Item then
         if(T.Left = null and T.Right = null) then
            Free(T);
         elsif(T.Left = null) then
            T.Right.Parent := T.Parent;
            Free(T);
         elsif(T.Right = null) then
            T.Left.Parent := T.Parent;
            Free(T);
         else
            Remove_All(T.Left);
            Remove_All(T.Right);
            Free(T);
         end if;
      --case 3: item is smaller than current tree item, then go into left leaf
      elsif Item < T.Item then
         Temp_Parent := T;
         Remove_Item(T=>T.Left, Item =>Item);
      --case 4: item is greater than current tree item, then go into left leaf
      else
         Temp_Parent := T;
         Remove_Item(T=>T.Right, Item =>Item);
      end if;
   end Remove_Item;

   procedure Remove_All(T: in out Binary_Tree_Access) is
   begin
      if T /= null then
         Remove_All(T.Left);
         Remove_All(T.Right);
         Free(T);
      end if;
   end Remove_All;

end Binary_Trees;
