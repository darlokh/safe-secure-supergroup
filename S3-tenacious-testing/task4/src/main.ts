context
	with Ada.Text_IO; use Ada.Text_IO;
	with Elections; use Elections;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test (1) All_Voters_Voted
Define	Num_Voters : Natural := 5;
		Vote_A : Party := A;
		Vote_B : Party := B;
Test 	Initialize(Num_Voters);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_B);
		Vote_For(Vote_B);
Pass	All_Voters_Voted = True

***** Test (2) Find_Winner A
Define	Num_Voters : Natural := 5;
		Vote_A : Party := A;
		Vote_B : Party := B;
Test 	Initialize(Num_Voters);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_B);
		Vote_For(Vote_B);
Pass	Find_Winner = A

***** Test (3) Find_Winner None
Define	Num_Voters : Natural := 6;
		Vote_A : Party := A;
		Vote_B : Party := B;
Test 	Initialize(Num_Voters);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_B);
		Vote_For(Vote_B);
		Vote_For(Vote_B);
Pass	Find_Winner = None

code Ada.Text_IO.Put_Line("done");
