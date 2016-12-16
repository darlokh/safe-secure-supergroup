context
	with Ada.Text_IO; use Ada.Text_IO;
	with Elections; use Elections;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test (1) All_Voters_Voted: True
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

***** Test (2) All_Voters_Voted: False
Define 	Num_Voters : Natural := 5;
Test 	Initialize(Num_Voters);
Pass	All_Voters_Voted = False

***** Test (3) Find_Winner A
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

***** Test (4) Find_Winner B
Define	Num_Voters : Natural := 5;
		Vote_A : Party := A;
		Vote_B : Party := B;
Test 	Initialize(Num_Voters);
		Vote_For(Vote_A);
		Vote_For(Vote_A);
		Vote_For(Vote_B);
		Vote_For(Vote_B);
		Vote_For(Vote_B);
Pass	Find_Winner = B

***** Test (5) Find_Winner None
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
