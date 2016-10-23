with Deck;
with Ada.Text_IO;

procedure main is
   New_Card : Deck.Card;
begin
   Deck.Fill_Deck;
   for Integer in 1..3 loop
      if not Deck.Is_Empty then
         New_Card := Deck.Draw_Card;
         Deck.Print_Card(New_Card);
         Ada.Text_IO.Put_Line(" ");
      else
         Ada.Text_IO.Put_Line("Deck is already empty!");
         exit;
      end if;
   end loop;
end main;
