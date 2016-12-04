--with Ada.Text_IO;

package body Binary_Trees is

   -- initialize variables
   Temp_Parent  : Binary_Tree_Access := null;

   -- methods
   procedure Add_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
   begin
      --case 1: current leaf is empty, set item here
      if T = null then
         T := Create(Item=>Item);
      --case 2: current leaf equals item, throw exception
      elsif Item = T.Item then
         raise Item_Already_In_Tree_Exception;
      --case 3: item is smaller than current tree item, then go into left leaf
      elsif Item < T.Item then
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
      return T.Item = Item;
   end Has_Item;

   function Get_Height(T: Binary_Tree_Access) return Natural is
      -- Returns the height of the tree T.
      Left_Leaf : Natural := 0;
      Right_Leaf : Natural := 0;
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

   function Get_Num_Leaves(T: Binary_Tree_Access) return Natural;
   -- Returns the number of leaves of the tree T.

   procedure Put(T: Binary_Tree_Access);
   -- Prints all items of the tree T in-order using Put_Item.

   procedure Remove_Item(T: in out Binary_Tree_Access; Item: Item_Type);
   -- Removes the node -- and only that node -- which contains the item
   -- from the tree T. Raises an Item_Not_Found_Exception if the item is not
   -- in the tree T. Frees the memory for the node.

   procedure Remove_All(T: in out Binary_Tree_Access) is
      -- Removes all nodes from the tree T and frees their memory.
   begin
      if T /= null then
         Remove_All(T.Left);   -- Delete all nodes in the left subtree
         Remove_All(T.Right);  -- Delete all nodes in the right subtree
         Free(T);         -- Delete this node
      end if;
   end Remove_All;

end Binary_Trees;
