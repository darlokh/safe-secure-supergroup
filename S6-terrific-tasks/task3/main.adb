-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       /home/nana/dev/safe-secure-systems/safe-secure-supergroup/S6-terrific-tasks/task3/main.adb
  -- Script:     /home/nana/dev/safe-secure-systems/safe-secure-supergroup/S6-terrific-tasks/task3/main.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Ada.Text_IO; use Ada.Text_IO;
with Parallel_Algorithms;

procedure main is

  package Driver_Internals is
    -- Global Data
    Program_Terminate     : exception;
    Fail_Result           : Boolean := False;
    Unexpected_Error      : Boolean := False;
    Status                : Ada.Command_Line.Exit_Status := 0;
    -- Data of last Test Case
    Test_Case_Passed      : Boolean := False;
    -- Access Routines
    procedure Set_Path (Path : in String);
    function Path_Was (Path : in String) return Boolean;
    function Taken_Path return String;
    function Passed return Boolean;
    function Failed return Boolean;
  end Driver_Internals;

  package body Driver_Internals is
    -- Data of last Test Case
    Test_Case_Path        : String (1.. 256);
    Test_Case_Path_Length : Natural := 0;
    -- Access Routines
    procedure Set_Path (Path : in String) is
      begin
        Test_Case_Path (Test_Case_Path'First..Path'Length) := Path;
        Test_Case_Path_Length := Path'Length;
      end Set_Path;
    function Path_Was (Path : in String) return Boolean is
      begin
        return Test_Case_Path_Length = Path'Length
            and then Test_Case_Path (1..Path'Length) = Path;
      end Path_Was;
    function Taken_Path return String is
      begin return Test_Case_Path (1..Test_Case_Path_Length); end Taken_Path;
    function Passed return Boolean is
      begin return Test_Case_Passed; end Passed;
    function Failed return Boolean is
      begin return not Test_Case_Passed; end Failed;
  end Driver_Internals;

begin  -- unit main block

  -- Code section
  begin
    Ada.Text_IO.Put_Line("Begin Testing: ");
  end;  -- code block

  -- Test Case (1)   Test (1) Even Array_Length (6)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 6);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      for I in Data'Range loop
      		Data(I) := I;
      	end loop;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 21
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test (1) Even Array_Length (6)");
          Put_Line ("           Script name:'main.ts'; Line:6 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  Test (1) Even Array_Length (6)");
        Put_Line ("           Script name:'main.ts'; Line:6 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 1.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (2)   Test (2) Odd Array_Length (5)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 5);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      for I in Data'Range loop
      		Data(I) := I;
      	end loop;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 15
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  Test (2) Odd Array_Length (5)");
          Put_Line ("           Script name:'main.ts'; Line:25 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  Test (2) Odd Array_Length (5)");
        Put_Line ("           Script name:'main.ts'; Line:25 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 2.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (3)   Test (3) one Element (1)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 1);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      for I in Data'Range loop
      		Data(I) := I;
      	end loop;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 1
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  Test (3) one Element (1)");
          Put_Line ("           Script name:'main.ts'; Line:44 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  Test (3) one Element (1)");
        Put_Line ("           Script name:'main.ts'; Line:44 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 3.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (4)   Test (4) array with independent values (odd)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 5);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      Data(1) := 40;
      	Data(2) := 2;
      	Data(3) := 18;
      	Data(4) := 5;
      	Data(5) := 10;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 75
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  Test (4) array with independent values (odd)");
          Put_Line ("           Script name:'main.ts'; Line:63 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  Test (4) array with independent values (odd)");
        Put_Line ("           Script name:'main.ts'; Line:63 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 4.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (5)   Test (5) array with independent values (even)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 6);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      Data(1) := 40;
      	Data(2) := 2;
      	Data(3) := 18;
      	Data(4) := 5;
      	Data(5) := 2;
      	Data(6) := 3;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 70
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(5)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(5)  Test (5) array with independent values (even)");
          Put_Line ("           Script name:'main.ts'; Line:84 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  Test (5) array with independent values (even)");
        Put_Line ("           Script name:'main.ts'; Line:84 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 5.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (6)   Test (6) Item_Type = Natural (even)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Natural, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 6);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      for I in Data'Range loop
      		Data(I) := I;
      	end loop;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 21
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(6)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(6)  Test (6) Item_Type = Natural (even)");
          Put_Line ("           Script name:'main.ts'; Line:106 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(6)  Test (6) Item_Type = Natural (even)");
        Put_Line ("           Script name:'main.ts'; Line:106 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 6.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (7)   Test (7) Item_Type = Natural (odd)
  declare
    package adders is new Parallel_Algorithms(Item_Type => Natural, "+" => "+");
    	use adders;
    	Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 5);
    	T1, T2 : Adder;
  begin  -- test case
    begin  -- test part
      for I in Data'Range loop
      		Data(I) := I;
      	end loop;
      	T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
      	T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);
      	loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
      	end loop;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if ResultWrapper.getRes = 15
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(7)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(7)  Test (7) Item_Type = Natural (odd)");
          Put_Line ("           Script name:'main.ts'; Line:125 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(7)  Test (7) Item_Type = Natural (odd)");
        Put_Line ("           Script name:'main.ts'; Line:125 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Ada.Text_IO.Put_Line("done");
  end;  -- code block

  --  End of test cases
  New_Line;
  Put ("Script name 'main.ts'");
  Put ("; total test result: ");
  if Driver_Internals.Fail_Result then
    Put ("FAIL");
    Driver_Internals.Status := 1;
  else
    Put ("pass");
    Driver_Internals.Status := 0;
  end if;
  Put_Line (".");
  New_Line;
  Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);

exception
  when Driver_Internals.Program_Terminate =>
    New_Line;
    Put ("Total test result: ");
    if Driver_Internals.Fail_Result then
      Put ("FAIL");
      Driver_Internals.Status := 1;
    else
      Put ("UNDEFINED");
      Driver_Internals.Status := -1;
    end if;
    if Driver_Internals.Unexpected_Error then
      Put_Line (",");
      Put_Line ("        there were one or more errors outside of test cases.");
      Driver_Internals.Status := -1;
    else
      Put_Line (".");
    end if;
    New_Line;
    Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);
  when E: others =>
    New_Line;
    Put_Line ("Unexpected exception " & Ada.Exceptions.Exception_Name (E) & " propagating out of driver.");
    Put_Line ("Results are undefined.");
    Driver_Internals.Status := -1;
    Ada.Command_Line.Set_Exit_Status (Driver_Internals.Status);

end main;
