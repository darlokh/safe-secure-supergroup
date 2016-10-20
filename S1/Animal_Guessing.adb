-------------------------------------
-- Safe and Secure Systems WT 2016/17
-- Problem Session 1
-- Authors: Matti Wiegmann,    112174
--          Nathalie Dittrich, 123456
-------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

procedure Animal_Guessing is
   Response_Household, Response_Purr, Response_Neck : Character;
begin
   -- Display task description
   Put_Line ("Choose an animal from the following List, then answer the Questions:");
   -- Display list of animals
   Put_Line ("Animals are: Cat, Dog, Elephant, Giraffe");
   New_Line;
   -- Ask Question "household"
   loop
      Put ("Is it a household animal? (y/n): ");
      Get (Response_Household);
      New_Line;
      if Response_Household = 'y' or Response_Household = 'Y' then
         -- Ask question "purr"
         Put ("Does the animal ""purr""? (y/n): ");
         Get (Response_Purr);
         if Response_Purr = 'y' or Response_Purr = 'Y' then
            Put_Line ("I guess it's a cat");
            exit;
         elsif Response_Purr = 'n' or Response_Purr = 'N' then
            Put_Line ("I guess it's a dog");
            exit;
         end if;
      elsif Response_Household = 'n' or Response_Household = 'N' then
         -- Ask question "neck"
         Put ("Has it a long neck? (y/n): ");
         Get (Response_Neck);
         if Response_Neck = 'y' or Response_Neck = 'Y' then
            Put_Line ("I guess it's a giraffe");
            exit;
         elsif Response_Neck = 'n' or Response_Neck = 'N' then
            Put_Line ("I guess it's an elephant");
            exit;
         end if;
      end if;

      Put ("Is it so hard to type y or n? Try again.");
      New_Line;
   end loop;
end Animal_Guessing;
