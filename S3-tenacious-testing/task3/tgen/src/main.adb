-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       c:\users\leaves\documents\github\safe-secure-supergroup\s3-tenacious-testing\task3\tgen\src\main.adb
  -- Script:     c:\users\leaves\documents\github\safe-secure-supergroup\s3-tenacious-testing\task3\tgen\src\main.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Ada.Text_IO; use Ada.Text_IO;
with Vectors; use Vectors;
with Ada.Numerics.Elementary_Functions;

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

  -- Test Case (1)   Test basic math operations (1)
  declare
    First_Vector : Vectors.Vector := (X => 1.0, Y => 2.0, Z => 3.0);
    Second_Vector : Vectors.Vector := (X => 3.0, Y => 2.0, Z => 1.0);
    Some_Scalar : Float := 2.0;
  begin  -- test case
    begin  -- test part
      --
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (First_Vector + Second_Vector) = (X => 4.0, Y => 4.0, Z => 4.0)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test basic math operations (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if (First_Vector - Second_Vector) = (X => -2.0, Y => 0.0, Z => 2.0)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test basic math operations (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if (First_Vector * Some_Scalar) = (X => 2.0, Y => 4.0, Z => 6.0)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test basic math operations (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if (First_Vector * Second_Vector) = 10.0
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test basic math operations (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if not (First_Vector = Second_Vector)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test basic math operations (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if (First_Vector = First_Vector)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test basic math operations (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  Test basic math operations (1)");
        Put_Line ("           Script name:'main.ts'; Line:7 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>|=>|=>|=>|=>|=>' was expected" & ")");
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

  -- Test Case (2)   Test orthogonality (2)
  declare
    First_Vector : Vectors.Vector := (X => 1.0, Y => 0.0, Z => 0.0);
    Second_Vector : Vectors.Vector := (X => 0.0, Y => 1.0, Z => 0.0);
  begin  -- test case
    begin  -- test part
      --
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if (Are_Orthogonal(First_Vector, Second_Vector))
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  Test orthogonality (2)");
          Put_Line ("           Script name:'main.ts'; Line:19 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  Test orthogonality (2)");
        Put_Line ("           Script name:'main.ts'; Line:19 ");
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

  -- Test Case (3)   Test cross product (3)
  declare
    First_Vector : Vectors.Vector := (X => 1.0, Y => 2.0, Z => 3.0);
    Second_Vector : Vectors.Vector := (X => 3.0, Y => 2.0, Z => 1.0);
  begin  -- test case
    begin  -- test part
      --
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Cross_Product(First_Vector, Second_Vector) = (X => -4.0, Y => 8.0, Z => -4.0)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  Test cross product (3)");
          Put_Line ("           Script name:'main.ts'; Line:25 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  Test cross product (3)");
        Put_Line ("           Script name:'main.ts'; Line:25 ");
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

  -- Test Case (4)   Test distance + distance to origin (4)
  declare
    First_Vector : Vectors.Vector := (X => 1.0, Y => 2.0, Z => 2.0);
    Second_Vector : Vectors.Vector := (X => 2.0, Y => 2.0, Z => 1.0);
    use Ada.Numerics.Elementary_Functions;
  begin  -- test case
    begin  -- test part
      --
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Distance_To_Origin(First_Vector) = 3.0
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  Test distance + distance to origin (4)");
          Put_Line ("           Script name:'main.ts'; Line:31 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if Distance(First_Vector, Second_Vector) = Sqrt(2.0)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  Test distance + distance to origin (4)");
          Put_Line ("           Script name:'main.ts'; Line:31 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  Test distance + distance to origin (4)");
        Put_Line ("           Script name:'main.ts'; Line:31 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>|=>' was expected" & ")");
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
