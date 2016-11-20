context with Ada.Text_IO;
	with Elections; use Elections;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test (1) Initialize
Define	Num_Voters : Natural := 1;
Test 	Initialize(Num_Voters);
Pass	Num_Voters > 0


code Ada.Text_IO.Put_Line("done");
