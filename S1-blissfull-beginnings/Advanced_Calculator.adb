with Ada.Text_IO, Ada.Float_Text_IO;
use Ada.Text_IO, Ada.Float_Text_IO;

procedure Advanced_Calculator is
   Result : Float;
   Operator, Repeat_Check : Character;
   Operand : Float;
   Is_Another_Expresion_Requested : Boolean := true;
begin
   loop
      Put ("Enter an expression: ");
      Get (Result);
      loop
         loop
            Get (Operator);
            exit when Operator /= ' ';
         end loop;
         if Operator = '.' then
            Put (Result, exp => 0, aft=>3);
            exit;
         else
            Get (Operand);
            case Operator is
            when '+' =>
               Result := Result + Operand;
            when '-' =>
               Result := Result - Operand;
            when '*' =>
               Result := Result * Operand;
            when '/' =>
               Result := Result / Operand;
            when others =>
               Put ("Invalid operator '");
               Put (Operator);
               Put ("'");
               exit;
            end case;
         end if;
      end loop;
      loop
         New_Line;
         -- New Code starts here
         Put ("Do you want to enter a new expression? (y/n)");
         Get (Repeat_Check);
         -- could also be switch/case, i just dislike this structure
         if Repeat_Check = 'y' or Repeat_Check = 'Y' then
            Is_Another_Expresion_Requested := true;
            exit;
         elsif Repeat_Check = 'n' or Repeat_Check = 'N' then
            Is_Another_Expresion_Requested := false;
            exit;
         else
            Put ("Please type y or n");
         end if;
      end loop;
      exit when not Is_Another_Expresion_Requested;
   end loop;
end Advanced_Calculator;
