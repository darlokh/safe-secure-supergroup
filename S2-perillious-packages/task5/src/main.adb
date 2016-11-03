with Graph;
with Ada.Text_IO;

procedure main is

   package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
begin
   Integer_Graph.Add_Vertex(1);
   Ada.Text_IO.Put_Line(" ");
end main;
