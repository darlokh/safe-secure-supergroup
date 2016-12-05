-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       c:\users\kev\documents\safe-secure-supergroup\s4-horrifying-hoare\task5\src\test\test.adb
  -- Script:     c:\users\kev\documents\safe-secure-supergroup\s4-horrifying-hoare\task5\src\test\test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Ada.Text_IO; use Ada.Text_IO;
with Put_Integer;
with Binary_Trees;

procedure test is

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

  -- Test Case (1)   (1) Test Num Leaves
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Get_Num_Leaves(My_Tree_Pointer) = 4
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  (1) Test Num Leaves");
          Put_Line ("           Script name:'test.ts'; Line:6 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  (1) Test Num Leaves");
        Put_Line ("           Script name:'test.ts'; Line:6 ");
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

  -- Test Case (2)   (2) Test Heigth
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Get_Height(My_Tree_Pointer) = 3
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  (2) Test Heigth");
          Put_Line ("           Script name:'test.ts'; Line:18 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  (2) Test Heigth");
        Put_Line ("           Script name:'test.ts'; Line:18 ");
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

  -- Test Case (3)   (3) Test Has Not
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Has_Item(My_Tree_Pointer,8) = False
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  (3) Test Has Not");
          Put_Line ("           Script name:'test.ts'; Line:30 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  (3) Test Has Not");
        Put_Line ("           Script name:'test.ts'; Line:30 ");
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

  -- Test Case (4)   (4) Test Has
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Has_Item(My_Tree_Pointer,5) = True
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  (4) Test Has");
          Put_Line ("           Script name:'test.ts'; Line:42 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  (4) Test Has");
        Put_Line ("           Script name:'test.ts'; Line:42 ");
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

  -- Test Case (5)   (5) Test Exception 1
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      IBT.Add_Item(My_Tree_Pointer, 5);
      exception
      	when IBT.Item_Already_In_Tree_Exception =>
      		Is_Exception_Thrown := True;
      Driver_Internals.Set_Path ("=>");
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(5)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(5)  (5) Test Exception 1");
          Put_Line ("           Script name:'test.ts'; Line:54 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  (5) Test Exception 1");
        Put_Line ("           Script name:'test.ts'; Line:54 ");
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

  -- Test Case (6)   (6) Test Exception 2
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      IBT.Remove_Item(My_Tree_Pointer, 8);
      exception
      	when IBT.Item_Not_Found_Exception =>
      		Is_Exception_Thrown := True;
      Driver_Internals.Set_Path ("=>");
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(6)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(6)  (6) Test Exception 2");
          Put_Line ("           Script name:'test.ts'; Line:71 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(6)  (6) Test Exception 2");
        Put_Line ("           Script name:'test.ts'; Line:71 ");
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

  -- Test Case (7)   (7) Test Remove
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      IBT.Remove_Item(My_Tree_Pointer, 1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Has_Item(My_Tree_Pointer,1) = False
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(7)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(7)  (7) Test Remove");
          Put_Line ("           Script name:'test.ts'; Line:88 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(7)  (7) Test Remove");
        Put_Line ("           Script name:'test.ts'; Line:88 ");
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

  -- Test Case (8)   (8) Test Remove All
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      IBT.Add_Item(My_Tree_Pointer, 9);
      IBT.Add_Item(My_Tree_Pointer, 5);
      IBT.Add_Item(My_Tree_Pointer, 1);
      IBT.Add_Item(My_Tree_Pointer, 3);
      IBT.Remove_Item(My_Tree_Pointer, 1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Has_Item(My_Tree_Pointer,1) = False
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(8)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(8)  (8) Test Remove All");
          Put_Line ("           Script name:'test.ts'; Line:102 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(8)  (8) Test Remove All");
        Put_Line ("           Script name:'test.ts'; Line:102 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 8.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (9)   (9) Test Has Children
  declare
    package IBT is new Binary_Trees(Item_Type => Integer, "=" => "=", "<" => "<", Put_Item => Put_Integer.Put);
    My_Tree_Pointer : IBT.Binary_Tree_Access := null;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Tree_Pointer := IBT.Create(7);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if IBT.Has_Children(My_Tree_Pointer) = False
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(9)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(9)  (9) Test Has Children");
          Put_Line ("           Script name:'test.ts'; Line:116 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(9)  (9) Test Has Children");
        Put_Line ("           Script name:'test.ts'; Line:116 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 9.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  --  End of test cases
  New_Line;
  Put ("Script name 'test.ts'");
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

end test;
