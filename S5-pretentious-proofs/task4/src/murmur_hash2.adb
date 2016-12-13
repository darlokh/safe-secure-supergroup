with Ada.Text_IO;
use  Ada.Text_IO;

package body Murmur_Hash2 is

   procedure Hash(Message: Byte_Array;
                  Seed: Key_Type;
                  Result: out Hash_Type) is

      -- c variables implementations
      M_Var   : constant Uint64 := Shift_Left(16#C6A4A793#,32) or 16#5BD1E995#;
      R_Var   : constant Integer := 24;
      K_Var   : Uint64 := 0;
      H_Var   : Uint64 := 0;
      Len_Int : Integer  := Message'Length;

      -- ada helper variables
      Index_Uint64 : Uint64 := 0;
      Len_Uint64   : constant Uint64 := Message'Length;

   begin
      Put_Line("Start Hash Function");
      H_Var := Hash_Type_To_UInt64(Seed) xor Len_Uint64;

      while Len_Int >= 8 loop
         K_Var := Get_UInt64_from_Byte_Array(Message, Index_Uint64);

         K_Var := K_Var * M_Var;
         K_Var := K_Var xor Shift_Right(K_Var,R_Var);
         K_Var := K_Var * M_Var;

         H_Var := H_Var * M_Var;
         H_Var := H_Var xor K_Var;

         Index_Uint64 := + 8 ;
         Len_Int := - 8;
      end loop;

      case Len_Int is
         when 7 => goto c_7;
         when 6 => goto c_6;
         when 5 => goto c_5;
         when 4 => goto c_4;
         when 3 => goto c_3;
         when 2 => goto c_2;
         when 1 => goto c_1;
         when others => goto c_others;
      end case;

      <<c_7>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 6)), 48);
      <<c_6>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 5)), 40);
      <<c_5>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 4)), 32);
      <<c_4>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 3)), 24);
      <<c_3>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 2)), 16);
      <<c_2>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 1)), 8);
      <<c_1>>      H_Var := H_Var xor Uint64(Message(Index_Uint64 + 7));
      <<c_others>> H_Var := H_Var * M_Var;

      H_Var := H_Var xor Shift_Right(H_Var, 13);
      H_Var := H_Var * M_Var;
      H_Var := H_Var xor Shift_Right(H_Var, 15);

      Result := UInt64_To_Hash_Type(H_Var);
   end Hash;

   -- Helper Functions
   function Hash_Type_To_UInt64(A: Key_Type) return Uint64 is
      Result : Uint64 := 0;
      Byte_Size : constant UInt64 := 8;
      Shift_Counter : Integer := 0;
   begin
      for I in 0..(Byte_Size-1) loop
         Result := Result xor Uint64(Shift_Left(A(I),Shift_Counter * 8));
         Shift_Counter := + 1;
      end loop;
      return Result;
   end Hash_Type_To_UInt64;

   function UInt64_To_Hash_Type(A: UInt64) return Hash_Type is
      Result : Hash_Type := (0,0,0,0,0,0,0,0);
      Byte_Size : constant UInt64 := 8;
      Shift_Counter : Integer := 0;
   begin
      for I in 0..(Byte_Size-1) loop
         Result(I) := Uint8(Shift_Right(A,Shift_Counter*8) mod 2 ** 8);
         Shift_Counter := + 1;
      end loop;
      return Result;
   end UInt64_To_Hash_Type;

   function Get_UInt64_from_Byte_Array(A: Byte_Array; Start_Index: Uint64) return Uint64 is
      Result : Uint64 := 0;
      Shift_Counter : Integer := 0;
      End_Index : constant Uint64 := Start_Index + 8;
   begin
      for I in Start_Index..(End_Index) loop
         Result := Result xor Uint64(Shift_Left(A(I),Shift_Counter * 8));
         Shift_Counter := + 1;
      end loop;
      return Result;
   end Get_UInt64_from_Byte_Array;

   procedure Put_Hash_Type (A: Hash_Type) is
   begin
      Ada.Text_IO.Put("[");
      for I in 0..Uint64(A'Length-2) loop
         Ada.Text_IO.Put(Uint8'Image(A(I)));
         Ada.Text_IO.Put(",");
      end loop;
      Ada.Text_IO.Put(Uint8'Image(A(A'Length-1)));
      Ada.Text_IO.Put_Line("]");
   end Put_Hash_Type;

end Murmur_Hash2;
