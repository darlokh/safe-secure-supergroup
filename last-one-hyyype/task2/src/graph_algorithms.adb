with Ada.Containers.Vectors;

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

      function Graph_Equals(L, R : Graph_Type) return Boolean is
      begin
         for V of L.Vertices loop
            if not R.Vertices.Contains(V) then
               return False;
            end if;
         end loop;
         for V of R.Vertices loop
            if not L.Vertices.Contains(V) then
               return False;
            end if;
         end loop;


         for E of L.Edges loop
            if not R.Edges.Contains(E) then
               return False;
            end if;
         end loop;
         for E of R.Edges loop
            if not L.Edges.Contains(E) then
               return False;
            end if;
         end loop;

         return True;
      end;

      package Subset is new Ada.Containers.Vectors(Index_Type   => Natural,
                                                    Element_Type => Graph_Type,
                                                   "="          => Graph_Equals);
      use Subset;
      Subsets : Subset.Vector;
      -- find in which subset an element is in
      function Find_Graph(Vertex : Vertex_Type) return Graph_Type is
      begin
         for Gr of Subsets loop
            if Gr.Vertices.contains(Vertex) then
               return Gr;
            end if;
         end loop;
         raise Vertex_Not_Found_Exception;
      end Find_Graph;

      -- merge two subsets into one
      procedure Merge_Graph(L, R : in out Graph_Type) is
         S_Cursor : Cursor;
         New_Graph : Graph_Type;
      begin
         for V of R.Vertices loop
            New_Graph.Add_Vertex(V);
         end loop;
         for V of L.Vertices loop
            New_Graph.Add_Vertex(V);
         end loop;
         for E of R.Edges loop
            New_Graph.Add_Edge(E.From, E.To, E.Weight);
         end loop;
         for E of L.Edges loop
            New_Graph.Add_Edge(E.From, E.To, E.Weight);
         end loop;
         S_Cursor := Subsets.Find(R);
         Subsets.Delete(S_Cursor);
         S_Cursor := Subsets.Find(L);
         Subsets.Delete(S_Cursor);

         Subsets.Append(New_Graph);
      end Merge_Graph;

   begin
      -- Note: edge-vector schould be sorted asc. but thats to hard for me
      -- take first edge, add to span if vertices are not in connected

      -- sort vector
      -- TODO

      -- split nodes in one Graph each
      for I of G.Vertices loop
         declare
            Tmp_Graph : Graph_Type;
         begin
            Tmp_Graph.Add_Vertex(I);
            Subsets.Append(Tmp_Graph);
         end;
      end loop;

      for E of G.Edges loop
         declare
            From_Graph : Graph_Type;
            To_Graph : Graph_Type;
         begin
            From_Graph := Find_Graph(E.From);
            To_Graph := Find_Graph(E.To);
            if not Graph_Equals(From_Graph, To_Graph) then
               Merge_Graph(From_Graph, To_Graph);
            end if;
         end;
      end loop;

      if not Graph_Equals(Subsets.First_Element, Subsets.Last_Element) then
         -- If Graph is not connected
         raise Graph_Not_Connected_Exception;
      end if;

      return Subsets.First_Element;
   end Find_Min_Spanning_Tree;
end Graph_Algorithms;
