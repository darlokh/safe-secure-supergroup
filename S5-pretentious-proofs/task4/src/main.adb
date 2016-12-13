with Ada.Text_IO;
with Murmur_Hash2;
use Murmur_Hash2;

procedure Main is
   bla : constant Uint8 := 1;
   My_Message : constant Byte_Array := (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
   My_Seed : constant Key_Type := (7,5,8,5,9,13,9,19);
   My_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
begin
   Ada.Text_IO.Put_Line("Start program");

   Ada.Text_IO.Put_Line(Uint64'Image(Shift_Left(Uint64(bla),8)));

   Hash(Message => My_Message, Seed => My_Seed, Result => My_Hash);
   Put_Hash_Type(My_Hash);


   Ada.Text_IO.Put_Line("End program");
end Main;
