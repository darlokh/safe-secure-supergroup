pragma SPARK_Mode(on);
package Elections is
    type Party is (None, A, B, C, D);
    type Votes_Array is array(Party) of Natural;

    Zero_Votes_Distribution: constant Votes_Array := (others => 0);
    Votes_Distribution: Votes_Array := Zero_Votes_Distribution;
    Num_Votes_Made: Natural := 0;
    Num_Total_Voters: Natural := 0;

    procedure Initialize(Num_Voters: Natural) with
        Global=>(Output =>
                    (Num_Total_Voters, Votes_Distribution)),
        Depends=>(Num_Total_Voters => Num_Voters),
    	Pre=>(Num_Voters>0),
    	Post=>((Num_Total_Voters = Num_Voters)
            and
               (Votes_Distribution = Zero_Votes_Distribution));

    -- Resets the number of made votes and votes for all parties to 0, and 
    -- sets the number of total Voters to the given.
    procedure Vote_For(Vote: Party) with
        Global=>(Output => Votes_Distribution),
        Pre=>(Vote /= None),
        Post=>(Votes_Distribution /= Zero_Votes_Distribution);

    function All_Voters_Voted return Boolean with
        Global=>(Input => Num_Total_Voters);

    function Find_Winner return Party with
    	Pre=>(All_Voters_Voted = TRUE);
    -- Returns Party with most votes assigned. 
    -- Returns None if multiple parties share the highest votes.

end Elections;