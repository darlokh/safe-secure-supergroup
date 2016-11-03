package Deck is
   -- types
   type Suit_Type is (Clubs, Diamonds, Spades, Hearts);
   subtype Card_Type is Positive range 1..13;
   type Card is 
      record
         Suit : Suit_Type;
         Value : Card_Type;
      end record;
   
   -- methods
   procedure Fill_Deck;
   pragma Postcondition (Is_Empty = False);
   
   function Draw_Card return Card;
   pragma Precondition (Is_Empty = False);
   
   function Is_Empty return Boolean;
   
   function Compare_Cards(Card1, Card2 : Card) return Boolean;
   
   procedure Print_Card(item : Card);
end Deck;
