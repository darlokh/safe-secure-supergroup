with Ada.Unchecked_Deallocation;

generic 
    type Item_Type is private;
    with function "<"(Left, Right: Item_Type) return Boolean;
    with function "="(Left, Right: Item_Type) return Boolean;
    with procedure Put_Item(Item: Item_Type);
package Binary_Trees is
    Item_Already_In_Tree_Exception: exception;
    Item_Not_Found_Exception: exception;
    
    type Binary_Tree;
    type Binary_Tree_Access is access all Binary_Tree;
    type Binary_Tree is record
        Item  : Item_Type;
        Left  : Binary_Tree_Access := Null;
        Right : Binary_Tree_Access := Null;
        Parent: Binary_Tree_Access := Null;
    end record;
    
   -- Adds Item as a leaf node in the tree T at the correct location.
   -- Raises an Item_Already_In_Tree_Exception if Item already is
   -- in the tree T.
   procedure Add_Item(T: in out Binary_Tree_Access; Item: Item_Type);
   
   -- Creates a new tree with a single node that contains the given Item.
   function Create(Item: Item_Type) return Binary_Tree_Access;

   -- Returns True if the tree T possesses any children; False otherwise.
   function Has_Children(T: Binary_Tree_Access) return Boolean;
   
   -- Returns True if the tree T contains the Item; False otherwise.
   function Has_Item(T: Binary_Tree_Access; Item: Item_Type) return Boolean;
   
   -- Returns the height of the tree T.
   function Get_Height(T: Binary_Tree_Access) return Natural;
   
   -- Returns the number of leaves of the tree T.
   function Get_Num_Leaves(T: Binary_Tree_Access) return Natural; 
   
   -- Prints all items of the tree T in-order using Put_Item.
   procedure Put(T: Binary_Tree_Access);
   
   -- Removes the node -- and only that node -- which contains the item 
   -- from the tree T. Raises an Item_Not_Found_Exception if the item is not 
   -- in the tree T. Frees the memory for the node.
   procedure Remove_Item(T: in out Binary_Tree_Access; Item: Item_Type);
    
   -- Removes all nodes from the tree T and frees their memory.
   procedure Remove_All(T: in out Binary_Tree_Access);
   
   --helper
   -- because Get_Height can not return -1 which is essential for recursion
   function Get_Height_Helper(T: Binary_Tree_Access) return Integer;
   
private
    procedure Free is new Ada.Unchecked_Deallocation(
        Binary_Tree, 
        Binary_Tree_Access
    );
end Binary_Trees;
