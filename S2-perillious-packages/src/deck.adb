with Random_Numbers;
with Ada.Text_IO;

package body Deck is
		Latest_Card : Card;
	function Get_Card return Card is
	begin
		return Latest_Card;
	end Get_Card;

	procedure Draw_New_Card is
		Variable : Integer; 
		package RNG renames Random_Numbers;
		New_Card : Card;
	begin
		Variable := RNG.Get_Random_Integer(4);
		New_Card.Suit := Suit_Type'Val(Variable);
		Variable := RNG.Get_Random_Integer(12)+1;
		New_Card.Card := Variable;
		Latest_Card := New_Card;
	end Draw_New_Card;

	procedure Print_Latest_Card is
		begin
			Ada.Text_IO.Put("Card-Value: " & Integer'Image(Latest_Card.Card));
			Ada.Text_IO.Put(",  Suit: " & Suit_Type'Image(Latest_Card.Suit));
		end Print_Latest_Card;
end Deck;