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
      G_Out : Graph_Type;
   begin
      -- Note: edge-vector schould be sorted asc. but thats to hard for me
      -- take first edge, add to span if vertices are not in connected subgraph

      -- check if connected
      for E of G.Edges loop
         if(not (G_Out.Vertices.Contains(E.From)
                 and G_Out.Vertices.Contains(E.To))) then
            -- TODO check exceptions
            G_Out.Add_Vertex(E.From);
            G_Out.Add_Vertex(E.To);
            G_Out.Add_Edge(E.From, E.To, E.Weight);
         end if;
      end loop;

      return G_out;
   end Find_Min_Spanning_Tree;
end Graph_Algorithms;
