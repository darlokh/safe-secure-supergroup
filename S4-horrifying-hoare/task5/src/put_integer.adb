with Ada.Integer_Text_IO;

package body Put_Integer is

   procedure Put(Item: Integer) is
   begin
      Ada.Integer_Text_IO.Put(Item);
   end Put_Integer;

end Put_Integer;

