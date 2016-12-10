with Ada.Text_IO;
with Thread;

procedure Main is
   use Thread;
begin
   Thread.Initialize;
   S := Sleeping;
   Do_Action(Resume);
   if S = Running then
      S := Running;
   else
      raise Program_Error;
   end if;

end Main;
