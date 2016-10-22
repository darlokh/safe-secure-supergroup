with Ada.Text_IO;
with Bank_Accounts;

procedure main is
   Mattis_Account : Bank_Accounts.Account_Type;
   Balance : Bank_Accounts.Cents_Type := 0;
begin
   Bank_Accounts.Deposit(Account => Mattis_Account, Amount => 54);
   Balance := Bank_Accounts.Get_Balance(Mattis_Account);
   Ada.Text_IO.Put_Line(Integer'Image(Balance));
end main;
