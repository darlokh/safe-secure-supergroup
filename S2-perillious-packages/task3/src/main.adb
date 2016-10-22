with Deck;
with Ada.Text_IO;

procedure main is
	begin
	for Integer in 1..3 loop
		Deck.Draw_New_Card;
		Deck.Print_Latest_Card;
		Ada.Text_IO.Put_Line(" ");
	end loop;
end main;
