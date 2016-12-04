with Ada.Text_IO;
with Put_Integer;
with Binary_Trees;

procedure Main is

   define package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
   My_Tree_Pointer : IBT.Binary_Tree_Access := null;

begin
   Ada.Text_IO.Put_Line("Start program");
   My_Tree_Pointer := IBT.Create(7);
   IBT.Add_Item(My_Tree_Pointer, 5);
   IBT.Put(My_Tree_Pointer);
   Ada.Text_IO.Put_Line("End program");
end Main;
