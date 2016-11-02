with Deck;
with Ada.Text_IO;

procedure Main is
   Card1 : Deck.Card;
   Card2 : Deck.Card;
   Card3 : Deck.Card;

begin
   Deck.Fill_Deck;

   Card1 := Deck.Draw_Card;
   Deck.Print_Card(Card1);
   Ada.Text_IO.Put_Line(" ");

   Card2 := Deck.Draw_Card;
   Deck.Print_Card(Card2);
   Ada.Text_IO.Put_Line(" ");

   Card3 := Deck.Draw_Card;
   Deck.Print_Card(Card3);
   Ada.Text_IO.Put_Line(" ");

   if(not Deck.Compare_Cards(Card1, Card2)) and
     (not Deck.Compare_Cards(Card1, Card3)) and
     (not Deck.Compare_Cards(Card2, Card3)) then
      Ada.Text_IO.Put_Line("All Cards are different!");
   else
      Ada.Text_IO.Put_Line("Not all cards are different!");
   end if;
end Main;
