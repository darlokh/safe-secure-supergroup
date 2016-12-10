with Ada.Text_IO;
with Thread;

procedure Main is
   use Thread;
begin
   Ada.Text_IO.Put("Test");
   Initialize;
   S := Sleeping;
   Do_Action(Resume);
   if S = Running then
      Ada.Text_IO.Put("True");
   end if;

end Main;
