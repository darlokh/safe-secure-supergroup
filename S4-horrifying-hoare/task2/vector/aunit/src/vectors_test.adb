with Ada.Numerics.Elementary_Functions;
with AUnit.Assertions; use AUnit.Assertions;
with Vectors;

package body Vectors_Test is

   procedure Register_Tests (T : in out Vector_Test) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Operations'Access, "Test_Operations");
      Register_Routine (T, Test_Orthogonal'Access, "Test_Orthogonal");
      Register_Routine (T, Test_Cross_Product'Access, "Test_Cross_Product");
      Register_Routine (T, Test_Distances'Access, "Test_Distances");
   end Register_Tests;

   function Name (T : Vector_Test) return Test_String is
      pragma Unreferenced (T);
   begin
      return Format ("Vectors_Test");
   end Name;

   procedure Test_Operations (T : in out Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Vectors;
      First_Vector : constant Vector := (X => 1.0, Y => 2.0, Z => 3.0);
      Second_Vector : constant Vector :=
        (X => 3.0, Y => 2.0, Z => 1.0);
      Some_Scalar : constant Float := 2.0;
   begin
      Assert ((First_Vector + Second_Vector) = (X => 4.0, Y => 4.0, Z => 4.0),
              "Test_Addition failed");
      Assert ((First_Vector - Second_Vector) = (X => -2.0, Y => 0.0, Z => 2.0),
              "Test Substraction Failed");
      Assert ((First_Vector * Some_Scalar) = (X => 2.0, Y => 4.0, Z => 6.0),
              "Test Scalar Failed");
      Assert ((First_Vector * Second_Vector) = 10.0,
              "Test Dot Product Failed");
      Assert (not (First_Vector = Second_Vector), "Test Inequality Failed");
      Assert ((First_Vector = First_Vector), "Test Equality Failed");
   end Test_Operations;

   procedure Test_Orthogonal (T : in out Test_Case'Class) is
      pragma Unreferenced (T);
      use Vectors;
      First_Vector : constant Vector := (X => 1.0, Y => 0.0, Z => 0.0);
      Second_Vector : constant Vector := (X => 0.0, Y => 1.0, Z => 0.0);
   begin
      Assert (Are_Orthogonal (First_Vector, Second_Vector),
              "Test_Ortogonal failed");
   end Test_Orthogonal;

   procedure Test_Cross_Product (T : in out Test_Case'Class) is
      pragma Unreferenced (T);
      use Vectors;
      First_Vector : constant Vector := (X => 1.0, Y => 2.0, Z => 3.0);
      Second_Vector : constant Vector :=
        (X => 3.0, Y => 2.0, Z => 1.0);
   begin
      Assert (Cross_Product (First_Vector, Second_Vector) =
              (X => -4.0, Y => 8.0, Z => -4.0),
              "Test_Cross_Product failed");
   end Test_Cross_Product;

   procedure Test_Distances (T : in out Test_Case'Class) is
      pragma Unreferenced (T);
      use Vectors;
      use Ada.Numerics.Elementary_Functions;
      First_Vector : constant Vector := (X => 1.0, Y => 2.0, Z => 2.0);
      Second_Vector : constant Vector := (X => 2.0, Y => 2.0, Z => 1.0);
   begin
      Assert (Distance_To_Origin (First_Vector) = 3.0,
              "Test_Distance_To_Origin failed");
      Assert (Distance (First_Vector, Second_Vector) = Sqrt (2.0),
              "Test_Distance failed");
   end Test_Distances;

end Vectors_Test;
