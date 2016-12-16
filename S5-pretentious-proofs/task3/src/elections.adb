with Ada.Text_IO;

package body Elections is
pragma SPARK_Mode(on);

    procedure Initialize(Num_Voters: Natural) is
    begin
    	Num_Votes_Made := 0;
    	Num_Total_Voters := Num_Voters;
    	Votes_Distribution := Zero_Votes_Distribution;
    end;

    procedure Vote_For(Vote:Party) is
    begin
    	Votes_Distribution(Vote) := Votes_Distribution(Vote) + 1;
    	Num_Votes_Made := Num_Votes_Made + 1;
    end;

    function All_Voters_Voted return Boolean is
    begin
    	return Num_Votes_Made = Num_Total_Voters;
    end;

    function Find_Winner return Party is
    	Max_Party : Party := None;
    	Max_Val : Natural := 0;
    	Unique_Counter : Natural := 0;
    begin
    	for I in Votes_Distribution'Range loop
        pragma Loop_Invariant
            (for all J in Votes_Distribution'Range =>
                Votes_Distribution(J) >= Max_Val);
    		if Votes_Distribution(I) > Max_Val then
    			Max_Party := I;
    			Max_Val := Votes_Distribution(I);
    		end if;
    	end loop;
    	for I in Votes_Distribution'Range loop
        pragma Loop_Invariant
            (Unique_Counter >= 0);
    		if Votes_Distribution(I) = Max_Val then
    			Unique_Counter := Unique_Counter + 1;
    		end if;
    	end loop;
    	if Unique_Counter > 1 then
    		return None;
    	else
    		return Max_Party;
    	end if;
    end Find_Winner;

end Elections;