-------------------------------------
-- Safe and Secure Systems WT 2016/17
-- Problem Session 1
-- Authors: Matti Wiegmann,    112174
--          Nathalie Dittrich, 123456
-------------------------------------
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Vowel_Count is
   Current_Letter : Character;
   Count_Total, Count_Vowel : Integer := 0;
   Count_A, Count_E, Count_I, Count_O, Count_U : Integer := 0;
begin
   Put_Line ("Count vowels, Terminate with ful stop "". """);
   Put ("~$: ");
   -- loop to count letters and vowels
   loop
      begin
         Get (Current_Letter);
         if Current_Letter in 'a' .. 'z' or
           Current_Letter in 'A' .. 'Z' then
            Count_Total := Count_Total + 1;
         end if;
         case Current_Letter is
            when 'a' | 'A' =>
               Count_A := Count_A + 1;
               Count_Vowel := Count_Vowel + 1;
            when 'e' | 'E' =>
               Count_E := Count_E + 1;
               Count_Vowel := Count_Vowel + 1;
            when 'i' | 'I' =>
               Count_I := Count_I + 1;
               Count_Vowel := Count_Vowel + 1;
            when 'O' | 'o' =>
               Count_O := Count_O + 1;
               Count_Vowel := Count_Vowel + 1;
            when 'u' | 'U' =>
               Count_U := Count_U + 1;
               Count_Vowel := Count_Vowel + 1;
            when '.' =>
               Put ("There are ");
               Put (Count_Vowel, Width => 1);
               Put (" vowels out of ");
               Put (Count_Total, Width => 1);
               Put (" total letters.");
               New_Line;
               Put ("Vowel-Count: a = ");
               Put (Count_A, Width => 1);
               Put (", e = ");
               Put (Count_E, Width => 1);
               Put (", i = ");
               Put (Count_I, Width => 1);
               Put (", o = ");
               Put (Count_O, Width => 1);
               Put (", u = ");
               Put (Count_U, Width => 1);
               exit;
            when others =>
               null;
         end case;
      exception
         when Data_Error =>
            Put ("Please only enter valid letters ""A-Z"" and ""a-z""");
      end;
   end loop;

end Vowel_Count;
