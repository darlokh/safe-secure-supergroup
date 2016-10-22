package Deck is
	type Suit_Type is (Clubs, Diamonds, Spades, Hearts);
	subtype Card_Type is Positive range 1..13;
	type Card is 
		record
			Suit : Suit_Type;
			Card : Card_Type;
		end record;
	function Get_Card return Card;
	procedure Draw_New_Card;
	procedure Print_Latest_Card;
end Deck;