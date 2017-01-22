-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       c:\users\kev\documents\safe-secure-supergroup\last-one-hyyype\task1\src\test\test.adb
  -- Script:     c:\users\kev\documents\safe-secure-supergroup\last-one-hyyype\task1\src\test\test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Ada.Text_IO; use Ada.Text_IO;
with GF2n;

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

  -- Test Case (1)   Test 1: Addition
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Element2 : constant GF4 := 2#0011#; -- x + 1
    My_GF4_Result : GF4 := 0;
  begin  -- test case
    begin  -- test part
      -- (1010 xor 0011) mod 0011 = 0000
      My_GF4_Result := GF2n4."+"(My_Element1,My_Element2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result = 2#0000#
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test 1: Addition");
          Put_Line ("           Script name:'test.ts'; Line:5 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  Test 1: Addition");
        Put_Line ("           Script name:'test.ts'; Line:5 ");
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

  -- Test Case (2)   Test 2: Substraction
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Element2 : constant GF4 := 2#0011#; -- x + 1
    My_GF4_Result : GF4 := 0;
  begin  -- test case
    begin  -- test part
      -- (1010 xor 0011) mod 0011 = 0000
      My_GF4_Result := GF2n4."-"(My_Element1,My_Element2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result = 2#0000#
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  Test 2: Substraction");
          Put_Line ("           Script name:'test.ts'; Line:18 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  Test 2: Substraction");
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

  -- Test Case (3)   Test 3: Addition = Substraction
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Element2 : constant GF4 := 2#0011#; -- x + 1
    My_GF4_Result1 : GF4 := 0;
    My_GF4_Result2 : GF4 := 0;
  begin  -- test case
    begin  -- test part
      My_GF4_Result1 := GF2n4."+"(My_Element1,My_Element2);
      My_GF4_Result2 := GF2n4."-"(My_Element1,My_Element2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result1 = My_GF4_Result2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  Test 3: Addition = Substraction");
          Put_Line ("           Script name:'test.ts'; Line:31 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  Test 3: Addition = Substraction");
        Put_Line ("           Script name:'test.ts'; Line:31 ");
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

  -- Test Case (4)   Test 4: Multiplication
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Element2 : constant GF4 := 2#0011#; -- x + 1
    My_GF4_Result : GF4 := 0;
  begin  -- test case
    begin  -- test part
      -- (1010 and 0011) mod 0011 = 0010
      My_GF4_Result := GF2n4."*"(My_Element1,My_Element2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result = 2#0010#
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  Test 4: Multiplication");
          Put_Line ("           Script name:'test.ts'; Line:45 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  Test 4: Multiplication");
        Put_Line ("           Script name:'test.ts'; Line:45 ");
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

  -- Test Case (5)   Test 5: Division
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Element2 : constant GF4 := 2#0011#; -- x + 1
    My_GF4_Result : GF4 := 0;
  begin  -- test case
    begin  -- test part
      -- (1010 and inverse(0011)) mod 0011 = 0000
      --           (    0001   )
      My_GF4_Result := GF2n4."/"(My_Element1,My_Element2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result = 2#0000#
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(5)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(5)  Test 5: Division");
          Put_Line ("           Script name:'test.ts'; Line:58 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  Test 5: Division");
        Put_Line ("           Script name:'test.ts'; Line:58 ");
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

  -- Test Case (6)   Test 6: Find Inverse
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_GF4_Result : GF4 := 0;
  begin  -- test case
    begin  -- test part
      -- inverse(1010) mod 0011 = 1010
      -- (1010 * 1010 mod 0011 = 0001)
      My_GF4_Result := GF2n4.Find_Inverse(My_Element1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result = 2#1010#
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(6)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(6)  Test 6: Find Inverse");
          Put_Line ("           Script name:'test.ts'; Line:72 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(6)  Test 6: Find Inverse");
        Put_Line ("           Script name:'test.ts'; Line:72 ");
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

  -- Test Case (7)   Test 7: GCD
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Element2 : constant GF4 := 2#0011#; -- x + 1
    My_GF4_Result : GF4 := 0;
  begin  -- test case
    begin  -- test part
      -- GCD(1010,0011) = 0011
      My_GF4_Result := GF2n4.GCD(My_Element1,My_Element2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_GF4_Result = 2#0010#
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(7)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(7)  Test 7: GCD");
          Put_Line ("           Script name:'test.ts'; Line:85 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(7)  Test 7: GCD");
        Put_Line ("           Script name:'test.ts'; Line:85 ");
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

  -- Test Case (8)   Test 8: Is Primitive
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Boolean_Result : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Boolean_Result := GF2n4.Is_Primitive(1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_Boolean_Result = True
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(8)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(8)  Test 8: Is Primitive");
          Put_Line ("           Script name:'test.ts'; Line:98 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(8)  Test 8: Is Primitive");
        Put_Line ("           Script name:'test.ts'; Line:98 ");
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

  -- Test Case (9)   Test 9: Is Not Primitive
  declare
    type GF4 is mod 2**4;
    -- P = x^4+x+1 = 2#10011# (irreducible polynomial in n=4)
    package GF2n4 is new GF2n(Element_Type => GF4, P => 2#0011#);
    My_Element1 : constant GF4 := 2#1010#; -- x^3+x
    My_Boolean_Result : Boolean := False;
  begin  -- test case
    begin  -- test part
      My_Boolean_Result := GF2n4.Is_Primitive(My_Element1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if My_Boolean_Result = False
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(9)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(9)  Test 9: Is Not Primitive");
          Put_Line ("           Script name:'test.ts'; Line:108 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(9)  Test 9: Is Not Primitive");
        Put_Line ("           Script name:'test.ts'; Line:108 ");
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
