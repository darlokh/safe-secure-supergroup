context with Ada.Text_IO; use Ada.Text_IO;
  with Vectors; use Vectors;
  with Ada.Numerics.Elementary_Functions;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test basic math operations (1)
define First_Vector : constant Vector := (X => 1.0, Y => 2.0, Z => 3.0);
  Second_Vector : constant Vector := (X => 3.0, Y => 2.0, Z => 1.0);
  Some_Scalar : constant Float := 2.0;
test --
pass (First_Vector + Second_Vector) = (X => 4.0, Y => 4.0, Z => 4.0)
pass (First_Vector - Second_Vector) = (X => -2.0, Y => 0.0, Z => 2.0)
pass (First_Vector * Some_Scalar) = (X => 2.0, Y => 4.0, Z => 6.0)
pass (First_Vector * Second_Vector) = 10.0
pass not (First_Vector = Second_Vector)
pass (First_Vector = First_Vector)

***** Test orthogonality (2)
define First_Vector : constant Vector := (X => 1.0, Y => 0.0, Z => 0.0);
  Second_Vector : constant Vector := (X => 0.0, Y => 1.0, Z => 0.0);
test --
pass (Are_Orthogonal(First_Vector, Second_Vector))

***** Test cross product (3)
define First_Vector : constant Vector := (X => 1.0, Y => 2.0, Z => 3.0);
  Second_Vector : constant Vector := (X => 3.0, Y => 2.0, Z => 1.0);
test --
pass Cross_Product(First_Vector, Second_Vector) = (X => -4.0, Y => 8.0, Z => -4.0)

***** Test distance + distance to origin (4)
define First_Vector : constant Vector := (X => 1.0, Y => 2.0, Z => 2.0);
  Second_Vector : constant Vector := (X => 2.0, Y => 2.0, Z => 1.0);
  use Ada.Numerics.Elementary_Functions;
test --
pass Distance_To_Origin(First_Vector) = 3.0
pass Distance(First_Vector, Second_Vector) = Sqrt(2.0)

code Ada.Text_IO.Put_Line("done");
