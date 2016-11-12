with Ada.Text_IO;

package body Thread is
   -- initialize variables

   -- methods
   procedure Initialize(S: out State) is
   -- Sets S to Ready.
   begin
      S := Ready;
      Ada.Text_IO.Put("Set state to Ready");
   end Initialize;

   procedure Do_Action(S: in out State; A: Action) is
   -- Updates the state S according to the given input state S, and the
   -- given action A. Sets S to None if the transition is not defined.
   begin
      if (S = Ready) and (A = Start) then
         S := Running;
         Ada.Text_IO.Put_Line("Set state to Running");

      elsif (S = Ready) and (A = Stop) then
         S := Stopped;
         Ada.Text_IO.Put_Line("Set state to Stopped");

      elsif (S = Waiting) and (A = Notify) then
         S := Running;
         Ada.Text_IO.Put_Line("Set state to Running");

      elsif (S = Running) and (A = Notify) then
         S := Waiting;
         Ada.Text_IO.Put_Line("Set state to Waiting");

      elsif (S = Running) and (A = Quit) then
         S := Stopped;
         Ada.Text_IO.Put_Line("Set state to Stopped");

      elsif (S = Running) and (A = Sleep) then
         S := Sleeping;
         Ada.Text_IO.Put_Line("Set state to Stopped");

      elsif (S = Sleeping) and (A = Resume) then
         S := Running;
         Ada.Text_IO.Put_Line("Set state to Stopped");

      elsif (S = Stopped) then
         S := None;
         Ada.Text_IO.Put_Line("State is stopped, default back to None.");

      else
         S := None;
         Ada.Text_IO.Put_Line("Not recognized state with action. Default state None.");
      end if;
   end Do_Action;

end Thread;
