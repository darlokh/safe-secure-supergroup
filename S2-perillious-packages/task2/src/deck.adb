with Random_Numbers;
with Ada.Text_IO;
with Ada.Containers.Vectors;

package body Deck is
   -- initialize variables
   package Card_Container is new Ada.Containers.Vectors
     (Index_Type => Natural,
      Element_Type => Card);
   Card_Vec   : Card_Container.Vector;

   -- methods
   procedure Fill_Deck is
      New_Card : Card;
   begin
      Card_Vec.Clear;
      for S in Suit_Type'Range loop
         for V in Card_Type'Range loop
            New_Card.Suit := S;
            New_Card.Value := V;
            Card_Vec.Append(New_Item => New_Card);
            --DEBUG: Print_Card(New_Card);
         end loop;
      end loop;
   end Fill_Deck;

   function Draw_Card return Card is
      package RNG renames Random_Numbers;
      Random_Num : Integer;
      Random_Card : Card;
   begin
      Random_Num := RNG.Get_Random_Integer(Integer(Card_Vec.Length));
      Random_Card := Card_Vec(Random_Num);
      Card_Vec.Delete(Random_Num);
      return Random_Card;
   end Draw_Card;

   procedure Print_Card(item : Card) is
   begin
      case item.Value is
         when 1 =>
            Ada.Text_IO.Put("Card-Value: Ace");
         when 11 =>
            Ada.Text_IO.Put("Card-Value: Jack");
         when 12 =>
            Ada.Text_IO.Put("Card-Value: Queen");
         when 13 =>
            Ada.Text_IO.Put("Card-Value: King");
         when others =>
            Ada.Text_IO.Put("Card-Value: " & Integer'Image(item.Value));
      end case;
      Ada.Text_IO.Put(",  Suit: " & Suit_Type'Image(item.Suit));
   end Print_Card;

   function Is_Empty return Boolean is
   begin
      if Integer(Card_Vec.Length) = 0 then
         return TRUE;
      else
         return False;
      end if;
   end Is_Empty;
end Deck;
