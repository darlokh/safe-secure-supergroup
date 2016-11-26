--with Ada.Text_IO;

package body Thread is
   -- initialize variables

   -- methods
   procedure Initialize(S: out State) is
   -- Sets S to Ready.
   begin
      S := Ready;
   end Initialize;

   procedure Do_Action(S: in out State; A: Action) is
   -- Updates the state S according to the given input state S, and the
   -- given action A. Sets S to None if the transition is not defined.
   begin
      if (S = Ready) and (A = Start) then
         S := Running;

      elsif (S = Ready) and (A = Stop) then
         S := Stopped;

      elsif (S = Waiting) and (A = Notify) then
         S := Running;

      elsif (S = Running) and (A = Notify) then
         S := Waiting;

      elsif (S = Running) and (A = Stop) then
         S := Stopped;

      elsif (S = Running) and (A = Sleep) then
         S := Sleeping;

      elsif (S = Sleeping) and (A = Resume) then
         S := Running;

      --not defined case, when state is already Stopped
      elsif (S = Stopped) then
         S := None;

      else
         S := None;
      end if;
   end Do_Action;

end Thread;
