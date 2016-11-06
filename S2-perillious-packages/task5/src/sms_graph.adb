with Ada.Containers.Vectors;
with Ada.Text_IO;

package body Sms_Graph is
   
   package Edge_Vector is new Ada.Containers.Vectors
     (Index_Type => Natural, 
      Element_Type => Edge_Type);
   Graph : Edge_Vector.Vector;
   
   
   procedure Add_Vertex(Vertex: Vertex_Type) is
   begin
      -- exc. if Vertex is Zero
      if Vertex = Zero then
         raise Vertex_Is_Zero_Exception;
      end if;
      
      for E of Graph loop
         if E.From_Vertex = Vertex or 
           E.To_Vertex = Vertex then
            raise Vertex_Already_In_Graph_Exception;
         end if;
      end loop;
      
      Graph.Append((0,Vertex, Zero));
   end Add_Vertex;
   
   
   procedure Add_Edge(From: Vertex_Type; To: Vertex_Type; Weight: Integer) is
      Is_Added : Boolean := False;
      Graph2 : Edge_Vector.Vector := Graph;
   begin
      if From = Zero or To = Zero then
         raise Vertex_Is_Zero_Exception;
      end if;
      
      for E of Graph2 loop
         -- is there a zero-entry for the From-Node?
         if E.From_Vertex = From and 
           E.To_Vertex = Zero then
            -- Already found Zero-entry for To-node, remove From-node
            if Is_Added then
               Graph.Delete(Graph.Find_Index(E));
               return;
            else -- replace
               Graph.Replace_Element(Graph.Find_Index(E), (Weight => Weight, 
                                                           From_Vertex => From,
                                                             To_Vertex => To));
               Is_Added := True;
            end if;
         -- Zero-entry for To-node 
         elsif E.From_Vertex = To and 
           E.To_Vertex = Zero then
            if Is_Added then
               Graph.Delete(Graph.Find_Index(E));
               return;
            else
               Graph.Replace_Element(Graph.Find_Index(E), (Weight => Weight, 
                                                           From_Vertex => From,
                                                             To_Vertex => To));
               Is_Added := True;
            end if;
         elsif E.From_Vertex = From and 
           E.To_Vertex = To then
            -- found the edge, update weight
            Graph.Replace_Element(Graph.Find_Index(E), (Weight => Weight, 
                                                        From_Vertex => From,
                                                          To_Vertex => To));
            Is_Added := True;
            return;
         end if;
      end loop;
      -- if true we already inserted the Edge
      if Is_Added then return; end if;
      
      -- insert edge here
      Graph.Append((From_Vertex => From, To_Vertex => To, Weight => Weight));
   end Add_Edge;
   
   
   procedure Clear is
   begin
      Graph.Clear;
   end Clear;


   function Get_Edge_Weight(From: Vertex_Type; To: Vertex_Type) return Integer is
   begin
      for E of Graph loop
         if E.From_Vertex = From and 
           E.To_Vertex = To then 
            return E.Weight;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Get_Edge_Weight;

  
   function Has_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
   begin
      for E of Graph loop
         if E.From_Vertex = From and 
           E.To_Vertex = To then
            return true;
         end if;
      end loop;
      return false;
   end Has_Edge;


   function Remove_Edge(From: Vertex_Type; To: Vertex_Type) return Boolean is
      Graph2 : Edge_Vector.Vector := Graph;
   begin 
      for E of Graph2 loop
         if E.From_Vertex = From and 
           E.To_Vertex = To then
            Graph.Delete(Graph.Find_Index(E));
            return True;
         end if;
      end loop;
      raise Edge_Not_Found_Exception;
   end Remove_Edge;

   -- Returns an array containing exactly all current vertices of the graph.   
   function To_Vertex_Array return Vertex_Array is
      Return_Array : Vertex_Array(1..Max_Size) := (others => Zero);
      Array_Index : Integer := 1;
   begin 
      -- for every edge in Graph do
      for E of Graph loop
         -- check if from-node is in Return_Array
         begin 
            for i in Return_Array'First .. Return_Array'Last loop
               -- if already in graph, skip this an go to next block
               if Return_Array(i) = E.From_Vertex then
                  raise Sms_Graph.Vertex_Already_In_Graph_Exception;
               end if;
            end loop;
            Return_Array(Array_Index) := E.From_Vertex;
            Array_Index := Array_Index + 1;
         exception
            when Sms_Graph.Vertex_Already_In_Graph_Exception => 
               Ada.Text_IO.Put(" ");
         end;
         -- check if to-node is in Return_Array
         begin 
            for i in Return_Array'First .. Return_Array'Last loop
               if Return_Array(i) = E.To_Vertex then
                  raise Sms_Graph.Vertex_Already_In_Graph_Exception;
               end if;
            end loop;
            Return_Array(Array_Index) := E.To_Vertex;
            Array_Index := Array_Index + 1;
         exception
            when Sms_Graph.Vertex_Already_In_Graph_Exception => 
               Ada.Text_IO.Put(" ");
         end;   
      end loop;
      return Return_Array;
   end To_Vertex_Array;

end Sms_Graph;
