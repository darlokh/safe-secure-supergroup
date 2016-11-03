with Graph;
--with Sms_Graph;
with Ada.Text_IO;

procedure main is

   package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
   Graph : Integer_Graph.Vertex_Array(1..100);
begin
   Integer_Graph.Add_Vertex(1);
   Integer_Graph.Add_Vertex(2);
   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);

   Graph := Integer_Graph.To_Vertex_Array;
   for i in Graph'Range loop
      Ada.Text_IO.Put(Integer'Image(Graph(i)) & ", ");
      if i mod 10 = 0 then
         Ada.Text_IO.Put_Line(" ");
      end if;
   end loop;

   begin
      Integer_Graph.Add_Vertex(2);
   exception
      when Integer_Graph.Vertex_Already_In_Graph_Exception =>
         Ada.Text_IO.Put_Line("Vertex already in graph");
   end;

   begin
      Integer_Graph.Add_Vertex(0);
   exception
      when Integer_Graph.Vertex_Is_Zero_Exception =>
         Ada.Text_IO.Put_Line("Vertex can't be zero");
   end;

   begin
      Integer_Graph.Add_Edge(From => 0, To => 2, Weight => 32);
   exception
      when Integer_Graph.Vertex_Is_Zero_Exception =>
         Ada.Text_IO.Put_Line("Vertex can't be zero");
   end;

   declare
      Some_Weight : Integer := 0;
   begin
      Some_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
      Ada.Text_IO.Put_Line(Integer'Image(Some_Weight));
      Some_Weight := Integer_Graph.Get_Edge_Weight(From => 2, To => 3);
   exception
      when Integer_Graph.Edge_Not_Found_Exception =>
         Ada.Text_IO.Put_Line("Edge not found!");
   end;

   Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 3);

   declare
      Some_Weight : Integer := 0;
   begin
      Some_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
      Ada.Text_IO.Put_Line(Integer'Image(Some_Weight));
   exception
      when Integer_Graph.Edge_Not_Found_Exception =>
         Ada.Text_IO.Put_Line("Edge not found!");
   end;

   Integer_Graph.Clear;

   declare
      Some_Weight : Integer := 0;
   begin
      Some_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
      Ada.Text_IO.Put_Line(Integer'Image(Some_Weight));
      Some_Weight := Integer_Graph.Get_Edge_Weight(From => 2, To => 3);
   exception
      when Integer_Graph.Edge_Not_Found_Exception =>
         Ada.Text_IO.Put_Line("Edge not found!");
   end;

   begin
      Integer_Graph.Add_Vertex(2);
   exception
      when Integer_Graph.Vertex_Already_In_Graph_Exception =>
         Ada.Text_IO.Put_Line("Vertex already in graph");
   end;

   Graph := Integer_Graph.To_Vertex_Array;
   for i in Graph'Range loop
      Ada.Text_IO.Put(Integer'Image(Graph(i)) & ", ");
      if i mod 10 = 0 then
         Ada.Text_IO.Put_Line(" ");
      end if;
   end loop;

   Ada.Text_IO.Put_Line("done.");
end main;
