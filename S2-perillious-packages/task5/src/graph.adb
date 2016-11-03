--with Ada.Containers.Vectors;

package body Graph is
   
   Graph : Vertex_Array(1..100) := (others => Zero);
   Edges : Edge_Array(1..100) := (others => (0, Zero, Zero));
   Vertex_Count : Natural := 0;
   Edge_Count : Natural := 0;
   
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
   

   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
   begin
      if From = Zero or To = Zero then
         raise Vertex_Is_Zero_Exception;
         return;
      end if;
      for i in Edges'First .. Edge_Count loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            Edges(i).Weight := Weight;
            return;
         end if;
      end loop;
      Edges(Edge_Count+1) := (From_Vertex => From, To_Vertex => To, Weight => Weight);
      Edge_Count := Edge_Count + 1;
   end Add_Edge;
   
  
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


   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
   begin
      for i in Edges'First .. Edge_Count loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            return Edges(i).Weight;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Get_Edge_Weight;

  
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
