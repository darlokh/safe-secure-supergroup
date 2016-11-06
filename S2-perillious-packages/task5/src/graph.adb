with Ada.Text_IO;
  
package body Graph is
   Graph : Vertex_Array(1..Max_Size) := (others => Zero);
   Edges : Edge_Array(1..Max_Size) := (others => (0, Zero, Zero));
   Vertex_Count : Natural := 0;
   Edge_Count : Natural := 0;
   
   -- add new disconnected vertex
   procedure Add_Vertex(Vertex: Vertex_Type) is
   begin
      if Vertex = Zero then
         raise Vertex_Is_Zero_Exception;
         return;
      end if;
      for i in Graph'First .. Vertex_Count loop
         if Graph(i) = Vertex then
            raise Vertex_Already_In_Graph_Exception;
            return;
         end if;
      end loop;
      Graph(Vertex_Count+1) := Vertex;
      Vertex_Count := Vertex_Count + 1;
   end Add_Vertex;
   
-- add new edges 
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
      Is_Already_In_Edge_Array : Boolean := false;
   begin
      -- nodes can't be @Zero
      if From = Zero or To = Zero then
         raise Vertex_Is_Zero_Exception;
         return;
      end if;
      
      -- if edge exists, update @Weight
      Already_In_Edge_Array_Loop:
      for i in Edges'First .. Edge_Count loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            Edges(i).Weight := Weight;
            Is_Already_In_Edge_Array := true;
            exit Already_In_Edge_Array_Loop;
         end if;
      end loop Already_In_Edge_Array_Loop;
      
      -- if edge doesn't exists, add to @Edges and update @Graph
      if not Is_Already_In_Edge_Array then 
         Edges(Edge_Count+1) := (From_Vertex => From, To_Vertex => To, Weight => Weight);
         Edge_Count := Edge_Count + 1;
         
         -- catch expected exceptions from Add_Vertex
         begin
            Add_Vertex(From);
         exception
            when Vertex_Already_In_Graph_Exception =>
               Ada.Text_IO.Put(" ");
         end;
         begin
            Add_Vertex(To);
         exception
            when Vertex_Already_In_Graph_Exception =>
               Ada.Text_IO.Put(" ");
         end;
      end if;
   end Add_Edge;
   
  -- reset all indizes to zero/0
   procedure Clear is
   begin
      for i in Graph'First .. Vertex_Count loop
         Graph(i) := Zero;
      end loop;
      for i in Edges'First .. Edge_Count loop
         Edges(i) := (0, Zero, Zero);
      end loop;
      Edge_Count := 0;
      Vertex_Count := 0;
   end Clear;

   -- return @Weight of an Edge, throws Edge_Not_Found_Exception
   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
   begin
      for i in Edges'First .. Edge_Count loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            return Edges(i).Weight;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Get_Edge_Weight;

   -- retrun true if Edge From -> To exists, false otherwise
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin
      for i in Edges'First .. Edge_Count loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            return true;
         end if;
      end loop;
      return false;
   end Has_Edge;

   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin 
      for i in Edges'First .. Edge_Count loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            Edges(i .. Edge_Count-1) := Edges(i+1 .. Edge_Count);
            Edges(Edge_Count) := (0, Zero, Zero);
            Edge_Count := Edge_Count - 1;
            return true;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Remove_Edge;
   
   function To_Vertex_Array return Vertex_Array is
   begin
      return Graph;
   end To_Vertex_Array;
end Graph;
