context with Ada.Text_IO;
  with Thread;

code Ada.Text_IO.Put_Line("Start Tests: ");

***** Test (1)
define use Thread
test Thread.Initialize;
  Initialize;

pass S = Ready

code Ada.Text_IO.Put_Line("done");
