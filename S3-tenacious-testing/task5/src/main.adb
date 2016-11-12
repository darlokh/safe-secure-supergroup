with Ada.Text_IO;
with Thread;
use Thread;

procedure Main is
   My_State : Thread.State;
   My_Action : Thread.Action;
begin
   Ada.Text_IO.Put_Line("Start program");

   -- test Initialize
   Initialize(My_State);
   Ada.Text_IO.Put_Line("");

   -- test Do_Action
   My_Action := Start;
   Do_Action(My_State, My_Action);
end Main;
