with AUnit; use AUnit;
with AUnit.Test_Cases; use AUnit.Test_Cases;
--  with Vectors;

package Vectors_Test is
   type Vector_Test is new Test_Case with null record;

   procedure Register_Tests (T : in out Vector_Test);
   function Name (T : Vector_Test) return Test_String;

   procedure Test_Operations (T : in out Test_Case'Class);
   procedure Test_Orthogonal (T : in out Test_Case'Class);
   procedure Test_Cross_Product (T : in out Test_Case'Class);
   procedure Test_Distances (T : in out Test_Case'Class);
end Vectors_Test;
