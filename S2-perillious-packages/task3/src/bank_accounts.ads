package Bank_Accounts is
   -- raise Assertion_Error if Pre/Postcondition fails
   pragma Assertion_Policy (Check);
   subtype Cents_Type is Integer;
   type Account_Type is record
      Balance: Cents_Type := 0;
   end record;
    
   -- Returns the current Balance from Account.
   function Get_Balance(Account: Account_Type) return Cents_Type;
   
   -- Deposits Amount at the given Account.
   procedure Deposit(Account: in out Account_Type; Amount: Cents_Type) with
     Pre => (Amount >= 0),
     Post => (Account.Balance'Old <= Account.Balance);
   
   -- Withdraws Amount from the given Account.
   procedure Withdraw(Account: in out Account_Type; Amount: Cents_Type) with 
     Pre => ((Amount >= 0)) and
     ((Account.Balance - Amount) >= 0),
     Post => (Account.Balance'Old >= Account.Balance);

   -- Transfers Amount from Account From to Account To.
   procedure Transfer(From: in out Account_Type; 
                      To: in out Account_Type; 
                      Amount: in Cents_Type) with
     Pre => (Amount >= 0) and
     ((From.Balance - Amount) >= 0),
     Post => (From.Balance'Old >= From.Balance) and
     (To.Balance'Old <= To.Balance);

end Bank_Accounts;
