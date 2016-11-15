with Ada.Text_IO;
with Thread;

procedure Main is
   My_State : Thread.State;
   My_Action : Thread.Action;
begin
   Ada.Text_IO.Put_Line("Start program");

   -- test Initialize
   Thread.Initialize(My_State);
   Ada.Text_IO.Put_Line("");

   -- test Do_Action
   My_Action := Thread.Start;
   Thread.Do_Action(My_State, My_Action);
end Main;
