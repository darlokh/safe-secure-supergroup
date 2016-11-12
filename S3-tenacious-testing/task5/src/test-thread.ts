context with Ada.Text_IO;
with Thread;
use Thread;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test Initialize State: (1)
define 
		My_State : Thread.State;
		My_Action : Thread.Action;
test
	begin
		Initialize(My_State);
	end
pass   My_State = Ready

code Ada.Text_IO.Put_Line("done");
