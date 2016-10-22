package body Bank_Accounts is
   
    -- Returns the current Balance from Account.
   function Get_Balance(Account: Account_Type) return Cents_Type is
   begin
      return Account.Balance;
   end Get_Balance;
   
    -- Deposits Amount at the given Account.   
   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance + Amount;
   end Deposit;
  
   -- Withdraws Amount from the given Account.
   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) is
   begin
      Account.Balance := Account.Balance - Amount;
   end Withdraw;
 
   -- Transfers Amount from Account From to Account To.
   procedure Transfer(From: in out Account_Type; 
                      To: in out Account_Type; 
                      Amount: in Cents_Type) is
   begin
      From.Balance := From.Balance - Amount;
      TO.Balance := To.Balance + Amount;
   end Transfer;
end Bank_Accounts;
