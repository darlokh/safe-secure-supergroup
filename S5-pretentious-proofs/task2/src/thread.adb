package body Thread is
   procedure Initialize is
   begin
      S := Ready;
   end Initialize;

   procedure Do_Action(A: in Action) is
   begin
      if S = Ready and A = Start then
         S := Running;
      elsif S = Running and A = Wait then
         S := Waiting;
      elsif S = Waiting and A = Notify then
         S := Running;
      elsif S = Running and A = Sleep then
         S := Sleeping;
      elsif S = Sleeping and A = Resume then
         S := Running;
      elsif S = Running and A = Stop then
         S := Stopped;
      elsif S = Ready and A = Stop then
         S := Stopped;
      else
        S := None;
      end if;
   end Do_Action;
end Thread;
