Context
	with Ada.Text_IO; use Ada.Text_IO;
	with Put_Integer;
	with Binary_Trees;

***** (1) Test Num Leaves
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
Pass IBT.Get_Num_Leaves(My_Tree_Pointer) = 4

***** (2) Test Heigth
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
Pass IBT.Get_Height(My_Tree_Pointer) = 3

***** (3) Test Has Not
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
Pass IBT.Has_Item(My_Tree_Pointer,8) = False

***** (4) Test Has
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
Pass IBT.Has_Item(My_Tree_Pointer,5) = True

***** (5) Test Exception 1
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
	Is_Exception_Thrown : Boolean := False;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
	IBT.Add_Item(My_Tree_Pointer, 5);
	exception
		when IBT.Item_Already_In_Tree_Exception =>
			Is_Exception_Thrown := True;
Pass Is_Exception_Thrown

***** (6) Test Exception 2
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
	Is_Exception_Thrown : Boolean := False;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
	IBT.Remove_Item(My_Tree_Pointer, 8);
	exception
		when IBT.Item_Not_Found_Exception =>
			Is_Exception_Thrown := True;
Pass Is_Exception_Thrown

***** (7) Test Remove
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
	Is_Exception_Thrown : Boolean := False;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
	IBT.Remove_Item(My_Tree_Pointer, 1);
Pass IBT.Has_Item(My_Tree_Pointer,1) = False

***** (8) Test Remove All
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
	Is_Exception_Thrown : Boolean := False;
Test
	My_Tree_Pointer := IBT.Create(7);
	IBT.Add_Item(My_Tree_Pointer, 9);
	IBT.Add_Item(My_Tree_Pointer, 5);
	IBT.Add_Item(My_Tree_Pointer, 1);
	IBT.Add_Item(My_Tree_Pointer, 3);
	IBT.Remove_Item(My_Tree_Pointer, 1);
Pass IBT.Has_Item(My_Tree_Pointer,1) = False

***** (9) Test Has Children
Define
	package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
	My_Tree_Pointer : IBT.Binary_Tree_Access := null;
	Is_Exception_Thrown : Boolean := False;
Test
	My_Tree_Pointer := IBT.Create(7);
Pass IBT.Has_Children(My_Tree_Pointer) = False



