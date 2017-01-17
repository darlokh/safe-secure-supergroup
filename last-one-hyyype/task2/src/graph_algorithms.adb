package body Graph_Algorithms is

   -- Dijkstra
   function Find_Shortest_Path(G: Graph_Type;
                               From: Vertex_Type;
                               To: Vertex_Type) return Integer is
   begin
      return 0;
   end Find_Shortest_Path;

   -- Kruskal
   function Find_Min_Spanning_Tree(G: Graph_Type) return Graph_Type is

      G_In : Graph_Type;
   begin
      -- Note: edge-vector schould be sorted asc.
      -- take first edge, add to span if vertices are not in connected subgraph

      G_In := G;
      return G;
   end Find_Min_Spanning_Tree;
end Graph_Algorithms;
