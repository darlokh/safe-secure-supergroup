with Ada.Text_IO;
with Graph;
with Graph_Algorithms;

procedure Main is
   package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
   package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                   "=" => "=",
                                                   Graph_Instance => Int_Graph);
   -- function Int_St(L, R : Natural) return Boolean is (L < R);
   -- package Edge_Sort is new Int_Graph.Edge_Vectors.Generic_Sorting(Int_St);

   Test_Int : Integer := 5;
   Graph_1 : Int_Graph.Graph_Type;
   Graph_2 : Int_Graph.Graph_Type;
   Graph_3 : Int_Graph.Graph_Type;
begin
   Graph_1.Add_Vertex(1);
   Graph_1.Add_Vertex(2);
   Graph_1.Add_Vertex(3);
   Graph_1.Add_Edge(1, 2, 1);
   Graph_1.Add_Edge(2, 3, 1);
   Graph_1.Add_Edge(1, 3, 2);


   Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                  From => 0,
                                                  To   => 1);
   Ada.Text_IO.Put_Line(Test_Int'Image);

   Graph_2 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_1);
end Main;
