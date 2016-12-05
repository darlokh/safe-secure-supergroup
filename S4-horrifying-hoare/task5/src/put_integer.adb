with Ada.Integer_Text_IO;

package body Put_Integer is

   procedure Put(Item: Integer) is
   begin
      Ada.Integer_Text_IO.Put(Item);
   end Put;

end Put_Integer;

