with Vectors_Test;

package body Vectors_Suite is
   Result : aliased Test_Suite;
   Vector_Test : aliased Vectors_Test.Vector_Test;

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Vector_Test'Access);
      return Result'Access;
   end Suite;
end Vectors_Suite;
