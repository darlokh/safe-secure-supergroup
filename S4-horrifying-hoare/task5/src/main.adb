with Ada.Text_IO;
with Put_Integer;
with Binary_Trees;

procedure Main is

   package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
   My_Tree_Pointer : IBT.Binary_Tree_Access := null;

begin
   Ada.Text_IO.Put_Line("Start program");

   Ada.Text_IO.Put_Line("Test 1");
   My_Tree_Pointer := IBT.Create(7);
   IBT.Add_Item(My_Tree_Pointer, 9);
   IBT.Add_Item(My_Tree_Pointer, 5);
   IBT.Add_Item(My_Tree_Pointer, 1);
   IBT.Add_Item(My_Tree_Pointer, 3);
   IBT.Put(My_Tree_Pointer);

   Ada.Text_IO.Put_Line("Test 2");
   IBT.Remove_Item(My_Tree_Pointer, 3);
   IBT.Remove_Item(My_Tree_Pointer, 9);
   IBT.Put(My_Tree_Pointer);

   Ada.Text_IO.Put_Line("Test 3");
   if(IBT.Has_Item(My_Tree_Pointer,5)) then
      Ada.Text_IO.Put_Line("Has 5");
   else
      Ada.Text_IO.Put_Line("Has not 5!?");
   end if;

   Ada.Text_IO.Put_Line("Test 4");
   if IBT.Get_Height(My_Tree_Pointer) = 2 then
      Ada.Text_IO.Put_Line("Tree has heigth 2!");
   else
      Ada.Text_IO.Put_Line("Tree has not heigth 2!?");
   end if;

   Ada.Text_IO.Put_Line("Test 5");
   IBT.Put(My_Tree_Pointer);
   Ada.Text_IO.Put_Line(IBT.Get_Num_Leaves(My_Tree_Pointer)'Image);
   if IBT.Get_Num_Leaves(My_Tree_Pointer) = 2 then
      Ada.Text_IO.Put_Line("Tree has 2 leaves!");
   else
      Ada.Text_IO.Put_Line("Tree has not 2 leaves!?");
   end if;

   Ada.Text_IO.Put_Line("End program");
end Main;
