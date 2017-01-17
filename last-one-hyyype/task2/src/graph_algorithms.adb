package body Graph_Algorithms is

   function Find_Shortest_Path(G: Graph_Type;
                               From: Vertex_Type;
                               To: Vertex_Type) return Integer is
   begin
      return 0;
   end Find_Shortest_Path;

   function Find_Min_Spanning_Tree(G: Graph_Type) return Graph_Type is
   begin
      return G;
   end Find_Min_Spanning_Tree;
end Graph_Algorithms;
