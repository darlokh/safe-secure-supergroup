with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body Murmur_Hash2 is

   procedure Hash(Message: Byte_Array;
                  Seed: Key_Type;
                  Result: out Hash_Type) is

      -- c variables implementations
      M_Var   : constant Uint64 := Shift_Left(16#C6A4A793#,32) or 16#5BD1E995#;
      R_Var   : constant Integer := 24;
      K_Var   : Uint64 := 0;
      H_Var   : Uint64 := 0;
      Len_Var : Integer  := Message'Length;

      -- ada helper variables
      Index_Uint64 : Uint64 := 0;

   begin
      H_Var := Hash_Type_To_UInt64(Seed) xor Uint64(Len_Var);

      while Len_Var >= 8 loop
         K_Var := Byte_Array_To_UInt64(Message, Index_Uint64);

         K_Var := K_Var * M_Var;
         K_Var := K_Var xor Shift_Right(K_Var,R_Var);
         K_Var := K_Var * M_Var;

         H_Var := H_Var * M_Var;
         H_Var := H_Var xor K_Var;

         Index_Uint64 := Index_Uint64 + 8 ;
         Len_Var := Len_Var - 8;
      end loop;

      -- 1st Version) actually wrong
      case Len_Var is
         when 7 => H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 6)), 48);
         when 6 => H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 5)), 40);
         when 5 => H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 4)), 32);
         when 4 => H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 3)), 24);
         when 3 => H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 2)), 16);
         when 2 => H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 1)), 8);
         when 1 => H_Var := H_Var xor Uint64(Message(Index_Uint64));
         when others => null;
      end case;
      if(Len_Var /= 0) then
         H_Var := H_Var * M_Var;
      end if;

      -- 2nd Version) goto
--        case Len_Var is
--           when 7 => goto c_7;
--           when 6 => goto c_6;
--           when 5 => goto c_5;
--           when 4 => goto c_4;
--           when 3 => goto c_3;
--           when 2 => goto c_2;
--           when 1 => goto c_1;
--           when others => goto c_others;
--        end case;
--
--        <<c_7>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 6)), 48);
--        <<c_6>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 5)), 40);
--        <<c_5>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 4)), 32);
--        <<c_4>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 3)), 24);
--        <<c_3>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 2)), 16);
--        <<c_2>>      H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 1)), 8);
--        <<c_1>>      H_Var := H_Var xor Uint64(Message(Index_Uint64));
--                     H_Var := H_Var * M_Var;
--        <<c_others>>

      -- 3rd Version) ifs
--        if(Len_Var <= 7) then
--           H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 6)), 48);
--        end if;
--        if(Len_Var <= 6) then
--           H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 5)), 40);
--        end if;
--        if(Len_Var <= 5) then
--           H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 4)), 32);
--        end if;
--        if(Len_Var <= 4) then
--           H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 3)), 24);
--        end if;
--        if(Len_Var <= 3) then
--           H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 2)), 16);
--        end if;
--        if(Len_Var <= 2) then
--           H_Var := H_Var xor Shift_Left(Uint64(Message(Index_Uint64 + 1)), 8);
--        end if;
--        if(Len_Var <= 1) then
--           H_Var := H_Var xor Uint64(Message(Index_Uint64));
--        end if;
--        if(Len_Var > 0) then
--           H_Var := H_Var * M_Var;
--        end if;


      H_Var := H_Var xor Shift_Right(H_Var, 13);
      H_Var := H_Var * M_Var;
      H_Var := H_Var xor Shift_Right(H_Var, 15);

      Result := UInt64_To_Hash_Type(H_Var);
   end Hash;

   -- Helper Functions

   -- Big-Endian

   function Hash_Type_To_UInt64(A: Hash_Type) return Uint64 is
      Result : Uint64 := 0;
      Byte_Size : constant UInt64 := 8;
      Shift_Counter : Integer := 7;
   begin
      for I in 0..(Byte_Size-1) loop
         Result := Result or Shift_Left(Uint64(A(I)),Shift_Counter * 8);
         Shift_Counter := Shift_Counter - 1;
      end loop;
      return Result;
   end Hash_Type_To_UInt64;

   function Byte_Array_To_UInt64(A: Byte_Array; Start_Index: Uint64)
                                 return Uint64 is
      Result : Uint64 := 0;
      Shift_Counter : Integer := 7;
      End_Index : constant Uint64 := Start_Index + 8;
   begin
      for I in Start_Index..(End_Index-1) loop
         Result := Result or Shift_Left(Uint64(A(I)),Shift_Counter * 8);
         Shift_Counter := Shift_Counter - 1;
      end loop;
      return Result;
   end Byte_Array_To_UInt64;

   function UInt64_To_Hash_Type(A: UInt64) return Hash_Type is
      Result : Hash_Type := (0,0,0,0,0,0,0,0);
      Byte_Size : constant UInt64 := 8;
      Shift_Counter : Integer := 7;
   begin
      for I in 0..(Byte_Size-1) loop
         Result(I) :=
           Uint8(Shift_Right(A,Shift_Counter*8) mod 2**8);
         Shift_Counter := Shift_Counter - 1;
      end loop;
      return Result;
   end UInt64_To_Hash_Type;

   -- Little-Endian

--     function Hash_Type_To_UInt64(A: Hash_Type) return Uint64 is
--        Result : Uint64 := 0;
--        Byte_Size : constant UInt64 := 8;
--        Shift_Counter : Integer := 0;
--     begin
--        for I in 0..(Byte_Size-1) loop
--           Result := Result or Shift_Left(Uint64(A(I)),Shift_Counter * 8);
--           Shift_Counter := Shift_Counter + 1;
--        end loop;
--        return Result;
--     end Hash_Type_To_UInt64;
--
--     function Byte_Array_To_UInt64(A: Byte_Array; Start_Index: Uint64) return Uint64 is
--        Result : Uint64 := 0;
--        Shift_Counter : Integer := 0;
--        End_Index : constant Uint64 := Start_Index + 8;
--     begin
--        for I in Start_Index..(End_Index-1) loop
--           Result := Result or Shift_Left(Uint64(A(I)),Shift_Counter * 8);
--           Shift_Counter := Shift_Counter + 1;
--        end loop;
--        return Result;
--     end Byte_Array_To_UInt64;
--
--     function UInt64_To_Hash_Type(A: UInt64) return Hash_Type is
--        Result : Hash_Type := (0,0,0,0,0,0,0,0);
--        Byte_Size : constant UInt64 := 8;
--        Shift_Counter : Integer := 0;
--     begin
--        for I in 0..(Byte_Size-1) loop
--           Result(I) :=
--             Uint8(Shift_Right(A,Shift_Counter*8) mod 2**8);
--           Shift_Counter := Shift_Counter + 1;
--        end loop;
--        return Result;
--     end UInt64_To_Hash_Type;

   procedure Put_Hash_Type(A: Hash_Type) is
   begin
      Ada.Text_IO.Put("[");
      Put(Item => Integer(A(0)), Base => 16, Width => 6);
      for I in 1..Uint64(A'Length-2) loop
         Put(Item => Integer(A(I)), Base => 16, Width => 7);
      end loop;
      Put(Item => Integer(A(A'Length-1)), Base => 16, Width => 7);
      Ada.Text_IO.Put_Line("]");
   end Put_Hash_Type;

   function Compare_Hashes(A: Hash_Type; B: Hash_Type) return Boolean is
   begin
      if A(0) = B(0) and
        A(1) = B(1) and
        A(2) = B(2) and
        A(3) = B(3) and
        A(4) = B(4) and
        A(5) = B(5) and
        A(6) = B(6) and
        A(7) = B(7) then
      return true;
   else
      return false;
   end if;
   end Compare_Hashes;

end Murmur_Hash2;
