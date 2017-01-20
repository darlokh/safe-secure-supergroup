context with Ada.Text_IO; use Ada.Text_IO;
  with Graph;
  with Graph_Algorithms;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test SPT Success (1)
define package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
  package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                "=" => "=",
                                                Graph_Instance => Int_Graph);
  Graph_1 : Int_Graph.Graph_Type;
test Graph_1.Add_Vertex(0);
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
pass Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                               From => 0,
                                               To   => 8) = 14
pass Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                              From => 0,
                                              To   => 3) = 19
pass Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                              From => 2,
                                              To   => 4) = 14


***** Test SPT no path not connected (2)
define package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
  package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                "=" => "=",
                                                Graph_Instance => Int_Graph);
  Graph_1 : Int_Graph.Graph_Type;
  Test_Int : Integer;
  Is_Exception_Thrown : Boolean := False;
test Graph_1.Add_Vertex(0);
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
  begin
    Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                   From => 0,
                                                   To   => 4);
	exception
		when Int_Graph_Algos.No_Valid_Path_Exception =>
			Is_Exception_Thrown := True;
	end;
pass Is_Exception_Thrown

***** Test SPT Vertex not Found (3)
define package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
  package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                "=" => "=",
                                                Graph_Instance => Int_Graph);
  Graph_1 : Int_Graph.Graph_Type;
  Test_Int : Integer;
  Is_Exception_Thrown : Boolean := False;
test Graph_1.Add_Vertex(0);
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
  begin
    Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                   From => 0,
                                                   To   => 10);
	exception
		when Int_Graph_Algos.Vertex_Not_Found_Exception =>
			Is_Exception_Thrown := True;
	end;
pass Is_Exception_Thrown

***** Test MSP Success (4)
define package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
  package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                "=" => "=",
                                                Graph_Instance => Int_Graph);
  Graph_1 : Int_Graph.Graph_Type;
  Graph_2 : Int_Graph.Graph_Type;
  Graph_3 : Int_Graph.Graph_Type;
test Graph_1.Add_Vertex(0);
  Graph_1.Add_Vertex(1);
  Graph_1.Add_Vertex(2);
  Graph_1.Add_Vertex(3);
  Graph_1.Add_Vertex(4);
  Graph_1.Add_Vertex(5);
  Graph_1.Add_Vertex(6);
  Graph_1.Add_Vertex(7);
  Graph_1.Add_Vertex(8);
  Graph_1.Add_Edge(6, 7, 1);
  Graph_1.Add_Edge(2, 8, 2);
  Graph_1.Add_Edge(5, 6, 2);
  Graph_1.Add_Edge(0, 1, 4);
  Graph_1.Add_Edge(2, 5, 4);
  Graph_1.Add_Edge(6, 8, 6);
  Graph_1.Add_Edge(2, 3, 7);
  Graph_1.Add_Edge(7, 8, 7);
  Graph_1.Add_Edge(0, 7, 8);
  Graph_1.Add_Edge(1, 2, 8);
  Graph_1.Add_Edge(3, 4, 9);
  Graph_1.Add_Edge(4, 5, 10);
  Graph_1.Add_Edge(1, 7, 11);
  Graph_1.Add_Edge(3, 5, 14);
  Graph_2.Add_Vertex(0);
  Graph_2.Add_Vertex(1);
  Graph_2.Add_Vertex(2);
  Graph_2.Add_Vertex(3);
  Graph_2.Add_Vertex(4);
  Graph_2.Add_Vertex(5);
  Graph_2.Add_Vertex(6);
  Graph_2.Add_Vertex(7);
  Graph_2.Add_Vertex(8);
  Graph_2.Add_Edge(6, 7, 1);
  Graph_2.Add_Edge(2, 8, 2);
  Graph_2.Add_Edge(5, 6, 2);
  Graph_2.Add_Edge(0, 1, 4);
  Graph_2.Add_Edge(2, 5, 4);
  Graph_2.Add_Edge(2, 3, 7);
  Graph_2.Add_Edge(0, 7, 8);
  Graph_2.Add_Edge(3, 4, 9);

  Graph_3 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_1);

pass Int_Graph.Graph_Equals(Graph_3, Graph_2)

***** Test MSP Graph_Not_Connected_Exception (5)
define package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
  package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                                "=" => "=",
                                                Graph_Instance => Int_Graph);
  Graph_1 : Int_Graph.Graph_Type;
  Graph_2 : Int_Graph.Graph_Type;
  Graph_3 : Int_Graph.Graph_Type;
  Is_Exception_Thrown : Boolean := False;
test Graph_1.Add_Vertex(0);
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
  Graph_1.Add_Edge(3, 5, 14);
  Graph_1.Add_Edge(5, 6, 2);
  Graph_1.Add_Edge(6, 8, 6);
  Graph_1.Add_Edge(6, 7, 1);
  Graph_1.Add_Edge(7, 8, 7);
  Graph_2.Add_Vertex(0);
  Graph_2.Add_Vertex(1);
  Graph_2.Add_Vertex(2);
  Graph_2.Add_Vertex(3);
  Graph_2.Add_Vertex(4);
  Graph_2.Add_Vertex(5);
  Graph_2.Add_Vertex(6);
  Graph_2.Add_Vertex(7);
  Graph_2.Add_Vertex(8);
  Graph_2.Add_Edge(6, 7, 1);
  Graph_2.Add_Edge(2, 8, 2);
  Graph_2.Add_Edge(5, 6, 2);
  Graph_2.Add_Edge(0, 1, 4);
  Graph_2.Add_Edge(2, 5, 4);
  Graph_2.Add_Edge(2, 3, 7);
  Graph_2.Add_Edge(0, 7, 8);
  Graph_2.Add_Edge(3, 4, 9);

  begin
    Graph_3 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_1);
	exception
		when Int_Graph_Algos.Graph_Not_Connected_Exception =>
			Is_Exception_Thrown := True;
	end;
pass Is_Exception_Thrown

code Ada.Text_IO.Put_Line("done");
