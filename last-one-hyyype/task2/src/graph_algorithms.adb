with Ada.Containers.Vectors;
with Ada.Text_IO;

package body Graph_Algorithms is

   -- Dijkstra
   function Find_Shortest_Path(G: Graph_Type;
                               From: Vertex_Type;
                               To: Vertex_Type) return Integer is
      Shortest_Path_Tree : Graph_Type;

   begin
      -- check precondition
      declare
         From_Found : Boolean := False;
         To_Found : Boolean := False;
      begin
         for V of G.Vertices loop
            if V = From then
               From_Found := True;
            elsif V = To then
               To_Found := True;
            end if;
         end loop;
         if not (To_Found and From_Found) then
            raise Vertex_Not_Found_Exception;
         end if;
      end;
      -- generate SPT
      Shortest_Path_Tree.Add_Vertex(From);

      -- loop until STP.vertex.length == G.Vertices.Length
      while not (Shortest_Path_Tree.Vertices.Last_Index = G.Vertices.Last_Index) loop
         -- get ajacent nodes from all leaves
         declare
            Tmp_Edge : Edge_Type;
            Tmp_Vertex : Vertex_Type;
            Tmp_Edge_Summed_Weight : Integer := Integer'Last;
         begin
            -- I hate my code. Honestly.
            for E of G.Edges loop
               for V of Shortest_Path_Tree.Vertices loop
                  -- Node is adjacent but not already in SPT
                  if E.From = V and (not Shortest_Path_Tree.Vertices.Contains(E.To)) then
                     if Shortest_Path_Tree.Edges.Is_Empty and E.Weight <= Tmp_Edge_Summed_Weight then
                        Tmp_Edge_Summed_Weight := E.Weight;
                        Tmp_Vertex := E.To;
                        Tmp_Edge := E;
                     else
                        for I of Shortest_Path_Tree.Edges loop
                           if (I.To = E.From or I.From = E.From) and I.Weight + E.Weight <= Tmp_Edge_Summed_Weight then
                              Tmp_Edge_Summed_Weight := I.Weight + E.Weight;
                              Tmp_Vertex := E.To;
                              Tmp_Edge := E;
                           end if;
                        end loop;
                     end if;
                  elsif E.To = V and (not Shortest_Path_Tree.Vertices.Contains(E.From)) then
                     if Shortest_Path_Tree.Edges.Is_Empty and E.Weight <= Tmp_Edge_Summed_Weight then
                        Tmp_Edge_Summed_Weight := E.Weight;
                        Tmp_Vertex := E.From;
                        Tmp_Edge := E;
                     else
                        for I of Shortest_Path_Tree.Edges loop
                           if (I.To = E.To or I.From = E.To) and I.Weight + E.Weight <= Tmp_Edge_Summed_Weight then
                              Tmp_Edge_Summed_Weight := I.Weight + E.Weight;
                              Tmp_Vertex := E.From;
                              Tmp_Edge := E;
                           end if;
                        end loop;
                     end if;
                  end if;
               end loop;
            end loop;
            begin
               Shortest_Path_Tree.Add_Vertex(Tmp_Vertex);
               Shortest_Path_Tree.Add_Edge(Tmp_Edge.From, Tmp_Edge.To, Tmp_Edge_Summed_Weight);
            exception
               when others =>
                  raise No_Valid_Path_Exception;
            end;
         end;
         -- add leaf with shortest path to root
      end loop;

      -- find Weight in STP
      for E of Shortest_Path_Tree.Edges loop
        if E.To = To or E.From = To then
            return E.Weight;
         end if;
      end loop;
      raise No_Valid_Path_Exception;
   end Find_Shortest_Path;

   -- Kruskal
   -- We suppose G is sorted. Otherwise we would have to change the
   -- specification to include "<" to implement Generic_Sort for the vectors.
   -- We never change the specification.
   function Find_Min_Spanning_Tree(G: Graph_Type) return Graph_Type is

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
         -- can't really happen
         raise Vertex_Not_Found_Exception;
      end Find_Graph;

      -- merge two subsets into one
      procedure Merge_Graph(L, R : in out Graph_Type; E : Edge_Type) is
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
         New_Graph.Add_Edge(E.From, E.To, E.Weight);
         Subsets.Append(New_Graph);
      end Merge_Graph;

   begin
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
               Merge_Graph(From_Graph, To_Graph, E);
            end if;
         end;
      end loop;

      if not Graph_Equals(Subsets.First_Element, Subsets.Last_Element) then
         raise Graph_Not_Connected_Exception;
      end if;

      return Subsets.First_Element;
   end Find_Min_Spanning_Tree;
end Graph_Algorithms;
