-- second class for a somewhat more sophisticated implementation

generic
   type Vertex_Type is private;
   with function "="(Left: Vertex_Type; Right: Vertex_Type) return Boolean;
   Zero : Vertex_Type;
   Max_Size : Natural := 100;
   
package Sms_Graph is
   Edge_Not_Found_Exception: exception;
   Vertex_Already_In_Graph_Exception: exception;
   Vertex_Is_Zero_Exception: exception;
   
   type Vertex_Array is array(Natural range <>) of Vertex_Type;

   -- add new edge from vertex to zero, weight 0
   -- raise exception if already somewhere in there
   procedure Add_Vertex(Vertex: Vertex_Type);
   
   -- add new edge from vertex to vertex, overwrite if (0, vertex,zero) exists
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer);
  
   -- clear
   procedure Clear;
   
   -- return weight if weight > 0, else edge_not_found_exc.
   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer;
   
   -- true if weight > 0
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
   
   -- remove edge if weight > 0, else exc.
   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean;
   
   -- generate vertex array
   function To_Vertex_Array return Vertex_Array;
   
private
   type Edge_Type is record
      Weight : Integer := 0;
      From_Vertex : Vertex_Type;
      To_Vertex : Vertex_Type;
   end record;
end Sms_Graph;
