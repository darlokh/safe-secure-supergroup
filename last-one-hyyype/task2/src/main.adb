with Ada.Text_IO;
with Graph;
with Graph_Algorithms;

procedure Main is
   package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
   package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                   "=" => "=",
                                                   Graph_Instance => Int_Graph);
   Test_Int : Integer := 5;
   Graph_1 : Int_Graph.Graph_Type;
   Graph_2 : Int_Graph.Graph_Type;
begin
   Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                     From => 0,
                                     To   => 1);

   Graph_2 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_2);
   Ada.Text_IO.Put_Line(Test_Int'Image);
end Main;
