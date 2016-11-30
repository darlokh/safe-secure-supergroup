--with Ada.Text_IO;

package body Binary_Trees is
   -- initialize variables

   -- methods
   procedure Add_Item(T: in out Binary_Tree_Access; Item: Item_Type) is
   -- Adds Item as a leaf node in the tree T at the correct location.
   -- Raises an Item_Already_In_Tree_Exception if Item already is
   -- in the tree T.
   begin
      if T = null then
         T := new Binary_Tree'(Item=>Item, Left=>null, Right=>null, Parent=>T'Access);
      elsif Item = T.Item then
         raise Item_Already_In_Tree_Exception;
      elsif Item < T.Item then
         Add_Item(T=>T.Left,Item =>Item);
      else
         Add_Item(T=>T.Right,Item =>Item);
      end if;
   end Add_Item;

   function Create(Item: Item_Type) return Binary_Tree_Access is
      -- Creates a new tree with a single node that contains the given Item.
   begin
      return new Binary_Tree'(Item=>Item, Left=>null, Right=>null, Parent=>null);
   end Create;

   function Has_Children(T: Binary_Tree_Access) return Boolean is
   -- Returns True if the tree T possesses any children; False otherwise.
   begin
      return T.Left /= null or T.Right /= null;
   end Has_Children;

   function Has_Item(T: Binary_Tree_Access; Item: Item_Type) return Boolean;
   -- Returns True if the tree T contains the Item; False otherwise.

   function Get_Height(T: Binary_Tree_Access) return Natural;
   -- Returns the height of the tree T.

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
