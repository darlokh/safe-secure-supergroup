--with Ada.Containers.Vectors;

package body Graph is
   
   Graph : Vertex_Array(0..100) := (others => Zero);
   type Edge_Array is array(Natural range <>) of Edge_Type;
   Edges : Edge_Array(0..100) := (others => (0, Zero, Zero));
   
   -- Stores the Vertex in the Graph. Raises a 
   -- Vertex_Already_In_Graph_Exception if it is already in the graph.
   procedure Add_Vertex(Vertex: Vertex_Type) is
      Tmp_Graph : Vertex_Array(0..Graph'Length+1);
   begin
      Graph(Graph'Last) := Vertex;
      Tmp_Graph(Graph'First..Graph'Last) := Graph(Graph'First..Graph'Last);
      --Tmp_Graph(Tmp_Graph'Last) := Vertex;
      Graph := Tmp_Graph;
   end Add_Vertex;
   
   -- Stores a new edge in the Graph from From to To that has the given
   -- Weight assigned to it. If an edge from From to To is already stored
   -- in the Graph, this function only re-assigns the given Weight to it
   -- and does nothing beyond.
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
      --New_Edge : constant Edge_Type := (From_Vertex => From, To_Vertex => To, Weight => Weight);
      Tmp_Edges : Edge_Array(0..Edges'Length+1);
   begin
      Tmp_Edges(Edges'First..Edges'Last) := Edges(Edges'First..Edges'Last);
      Tmp_Edges(Tmp_Edges'Last) := (From_Vertex => From, To_Vertex => To, Weight => Weight);
      Edges := Tmp_Edges;
   end Add_Edge;
   
   -- Removes all vertices and edges from the graph.   
   procedure Clear is
      Empty_Graph : constant Vertex_Array(0..100) := (others => Zero);
      Empty_Edges : constant Edge_Array(0..100) := (others => (0, Zero, Zero));
   begin
      Edges := Empty_Edges;
      Graph := Empty_Graph;
   end Clear;

   -- Returns the weight of the edge, if it is stored in the graph.
   -- Raises an Edge_Not_Found_Exception otherwise.  
   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
   begin
      for i in Edges'Range loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            return Edges(i).Weight;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Get_Edge_Weight;

   -- Returns True if an edge from From to To is stored in the graph.
   -- Returns False otherwise.   
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin
      for i in Edges'Range loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            return true;
         end if;
      end loop;
      return false;
   end Has_Edge;

   -- Removes the edge in the Graph from From to To, if existing; 
   -- Raises an Edge_Not_Found_Exception otherwise.   
   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
      Tmp_Edges : Edge_Array(0..Edges'Length-1);
   begin 
      for i in Edges'Range loop
         if Edges(i).From_Vertex = From and Edges(i).To_Vertex = To then
            Tmp_Edges(Edges'First..i-1) := Edges(Edges'First..i-1);
            Tmp_Edges(i..Edges'Last) := Edges(i+1..Edges'Last);
            Edges := Tmp_Edges;
            return true;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Remove_Edge;

   -- Returns an array containing exactly all current vertices of the graph.   
   function To_Vertex_Array return Vertex_Array is
   begin
      return Graph;
   end To_Vertex_Array;

end Graph;
