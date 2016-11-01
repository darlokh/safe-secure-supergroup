with Ada.Containers.Vectors;

package body Graph is
   Graph : Vertex_Array (0);
   
   package Edge_Vector is new Ada.Containers.Vectors
     (Index_Type => Natural,
      Element_Type => Edge_Type);
   Edge_Vec   : Edge_Vector.Vector;
   
   -- Stores the Vertex in the Graph. Raises a 
   -- Vertex_Already_In_Graph_Exception if it is already in the graph.
   procedure Add_Vertex(Vertex: Vertex_Type) is
      Tmp_Graph : Vertex_Array(Graph'Length+1);
   begin
      Tmp_Graph(1..Graph'Length) := Graph(1..Graph'Length);
      Tmp_Graph'Last := Vertex;
   end Add_Vertex;
   
   -- Stores a new edge in the Graph from From to To that has the given
   -- Weight assigned to it. If an edge from From to To is already stored
   -- in the Graph, this function only re-assigns the given Weight to it
   -- and does nothing beyond.
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
      New_Edge : Edge_Type := (From, To, Weight);
   begin
      Edge_Vector.Vector.Append(New_Edge);
   end Add_Edge;
   
   -- Removes all vertices and edges from the graph.   
   procedure Clear is
      Empty_Graph : Vertex_Array(0);
   begin
      Edge_Vector.Vector.Clear;
      Graph := Vertex_Array;
   end Clear;

   -- Returns the weight of the edge, if it is stored in the graph.
   -- Raises an Edge_Not_Found_Exception otherwise.  
   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
   begin
   end Get_Edge_Weight;

   -- Returns True if an edge from From to To is stored in the graph.
   -- Returns False otherwise.   
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin
   end Has_Edge;

   -- Removes the edge in the Graph from From to To, if existing; 
   -- Raises an Edge_Not_Found_Exception otherwise.   
   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin 
   end Remove_Edge;

   -- Returns an array containing exactly all current vertices of the graph.   
   function To_Vertex_Array return Vertex_Array is
   begin
   end To_Vertex_Array;

end Graph;
