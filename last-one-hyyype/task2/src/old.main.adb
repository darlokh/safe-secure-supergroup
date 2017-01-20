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
   Graph_1.Add_Vertex(0);
   Graph_1.Add_Vertex(1);
   Graph_1.Add_Vertex(2);
   Graph_1.Add_Vertex(3);
   Graph_1.Add_Vertex(4);
   Graph_1.Add_Vertex(5);
   Graph_1.Add_Vertex(6);
   Graph_1.Add_Vertex(7);
   Graph_1.Add_Vertex(8);
   Graph_1.Add_Edge(0, 1, 4);
   Graph_1.Add_Edge(0, 7, 8);
   Graph_1.Add_Edge(1, 2, 8);
   Graph_1.Add_Edge(1, 7, 11);
   Graph_1.Add_Edge(2, 3, 7);
   Graph_1.Add_Edge(2, 8, 2);
   Graph_1.Add_Edge(2, 5, 4);
   Graph_1.Add_Edge(3, 4, 9);
   Graph_1.Add_Edge(3, 5, 14);
   Graph_1.Add_Edge(4, 5, 10);
   Graph_1.Add_Edge(5, 6, 2);
   Graph_1.Add_Edge(6, 8, 6);
   Graph_1.Add_Edge(6, 7, 1);
   Graph_1.Add_Edge(7, 8, 7);


   Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                  From => 0,
                                                  To   => 8);

   Graph_2 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_1);
end Main;
