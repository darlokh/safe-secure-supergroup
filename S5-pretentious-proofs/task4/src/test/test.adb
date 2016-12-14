-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       c:\users\kev\documents\safe-secure-supergroup\s5-pretentious-proofs\task4\src\test\test.adb
  -- Script:     c:\users\kev\documents\safe-secure-supergroup\s5-pretentious-proofs\task4\src\test\test.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Ada.Text_IO; use Ada.Text_IO;
with Murmur_Hash2;
use Murmur_Hash2;

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

  -- Test Case (1)   (0a) Test 0a: Compate True
  declare
    My0a_HT1 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
    My0a_HT2 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test 0a: Compare True");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My0a_HT1,My0a_HT2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  (0a) Test 0a: Compate True");
          Put_Line ("           Script name:'test.ts'; Line:6 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  (0a) Test 0a: Compate True");
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

  -- Test Case (2)   (0b) Test 0b: Compate False
  declare
    My0b_HT1 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
    My0b_HT2 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#78#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test 0b: Compare False");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Compare_Hashes(My0b_HT1,My0b_HT2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  (0b) Test 0b: Compate False");
          Put_Line ("           Script name:'test.ts'; Line:14 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  (0b) Test 0b: Compate False");
        Put_Line ("           Script name:'test.ts'; Line:14 ");
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

  -- Test Case (3)   (1) Test 1: Hash-Type to UInt64
  declare
    My1_HT : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test 1: Hash-Type to UInt64");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Hash_Type_To_UInt64(My1_HT) = 4822678189205111
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  (1) Test 1: Hash-Type to UInt64");
          Put_Line ("           Script name:'test.ts'; Line:22 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  (1) Test 1: Hash-Type to UInt64");
        Put_Line ("           Script name:'test.ts'; Line:22 ");
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

  -- Test Case (4)   (2) Byte-Array to UInt64
  declare
    My2_BA : constant Byte_Array := (16#99#,16#88#,16#77#,16#66#,16#55#,16#44#,16#33#,16#22#,16#11#,16#00#);
    My2_Index : constant Uint64 := 2;
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test 2: Byte_Array to UInt64");
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Byte_Array_To_UInt64(A => My2_BA, Start_Index => My2_Index) = 8603657889541918976
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  (2) Byte-Array to UInt64");
          Put_Line ("           Script name:'test.ts'; Line:30 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  (2) Byte-Array to UInt64");
        Put_Line ("           Script name:'test.ts'; Line:30 ");
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

  -- Test Case (5)   (3) UInt64 to Hash-Type
  declare
    My3_Uint64 : constant Uint64 := 16#7766554433221100#;
    My3_HT1 : Hash_Type := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
    My3_HT2 : constant Hash_Type := (119,102,85,68,51,34,17,0);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test 3: UInt64 to Hash-Type");
      My3_HT1 := UInt64_To_Hash_Type(My3_Uint64);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My3_HT1,My3_HT2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(5)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(5)  (3) UInt64 to Hash-Type");
          Put_Line ("           Script name:'test.ts'; Line:39 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  (3) UInt64 to Hash-Type");
        Put_Line ("           Script name:'test.ts'; Line:39 ");
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

  -- Test Case (6)   (4) e01
  declare
    My01_Message : constant Byte_Array (1 .. 0) := (others => 0);
    My01_Seed : constant Key_Type := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
    My01_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My01_Hash2 : constant Hash_Type := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e01");
      Hash(Message => My01_Message, Seed => My01_Seed, Result => My01_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My01_Hash,My01_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(6)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(6)  (4) e01");
          Put_Line ("           Script name:'test.ts'; Line:50 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(6)  (4) e01");
        Put_Line ("           Script name:'test.ts'; Line:50 ");
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

  -- Test Case (7)   (5) e02
  declare
    My02_Message : constant Byte_Array (1 .. 0) := (others => 0);
    My02_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
    My02_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My02_Hash2 : constant Hash_Type := (16#6e#,16#dd#,16#0e#,16#96#,16#27#,16#8b#,16#03#,16#a5#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e02");
      Hash(Message => My02_Message, Seed => My02_Seed, Result => My02_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My02_Hash,My02_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(7)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(7)  (5) e02");
          Put_Line ("           Script name:'test.ts'; Line:62 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(7)  (5) e02");
        Put_Line ("           Script name:'test.ts'; Line:62 ");
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

  -- Test Case (8)   (6) e03
  declare
    My03_Message : constant Byte_Array (1 .. 0) := (others => 0);
    My03_Seed : constant Key_Type := (16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#);
    My03_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My03_Hash2 : constant Hash_Type := (16#16#,16#75#,16#19#,16#e7#,16#96#,16#00#,16#5f#,16#3a#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e03");
      Hash(Message => My03_Message, Seed => My03_Seed, Result => My03_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My03_Hash,My03_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(8)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(8)  (6) e03");
          Put_Line ("           Script name:'test.ts'; Line:74 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(8)  (6) e03");
        Put_Line ("           Script name:'test.ts'; Line:74 ");
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

  -- Test Case (9)   (7) e08
  declare
    My08_Message : constant Byte_Array := (16#00#,16#00#);
    My08_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
    My08_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My08_Hash2 : constant Hash_Type := (16#c6#,16#c1#,16#90#,16#86#,16#05#,16#c0#,16#d1#,16#c0#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e08");
      Hash(Message => My08_Message, Seed => My08_Seed, Result => My08_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My08_Hash,My08_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(9)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(9)  (7) e08");
          Put_Line ("           Script name:'test.ts'; Line:86 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(9)  (7) e08");
        Put_Line ("           Script name:'test.ts'; Line:86 ");
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

  -- Test Case (10)   (8) e09
  declare
    My09_Message : constant Byte_Array := (16#00#,16#00#);
    My09_Seed : constant Key_Type := (16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#);
    My09_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My09_Hash2 : constant Hash_Type := (16#ed#,16#bc#,16#80#,16#3e#,16#9a#,16#6c#,16#0d#,16#4e#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e09");
      Hash(Message => My09_Message, Seed => My09_Seed, Result => My09_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My09_Hash,My09_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(10)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(10)  (8) e09");
          Put_Line ("           Script name:'test.ts'; Line:98 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(10)  (8) e09");
        Put_Line ("           Script name:'test.ts'; Line:98 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 10.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (11)   (9) e14
  declare
    My14_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#);
    My14_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
    My14_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My14_Hash2 : constant Hash_Type := (16#58#,16#e5#,16#75#,16#8e#,16#20#,16#e5#,16#d3#,16#57#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e14");
      Hash(Message => My14_Message, Seed => My14_Seed, Result => My14_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My14_Hash,My14_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(11)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(11)  (9) e14");
          Put_Line ("           Script name:'test.ts'; Line:110 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(11)  (9) e14");
        Put_Line ("           Script name:'test.ts'; Line:110 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 11.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (12)   (10) e27
  declare
    My27_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
    My27_Seed : constant Key_Type := (16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#);
    My27_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My27_Hash2 : constant Hash_Type := (16#6e#,16#5d#,16#fd#,16#3e#,16#58#,16#52#,16#8b#,16#c5#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e27");
      Hash(Message => My27_Message, Seed => My27_Seed, Result => My27_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My27_Hash,My27_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(12)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(12)  (10) e27");
          Put_Line ("           Script name:'test.ts'; Line:122 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(12)  (10) e27");
        Put_Line ("           Script name:'test.ts'; Line:122 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (13)   (11) e29
  declare
    My29_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
    My29_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
    My29_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My29_Hash2 : constant Hash_Type := (16#14#,16#3c#,16#5a#,16#ec#,16#0b#,16#30#,16#89#,16#b9#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e29");
      Hash(Message => My29_Message, Seed => My29_Seed, Result => My29_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My29_Hash,My29_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(13)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(13)  (11) e29");
          Put_Line ("           Script name:'test.ts'; Line:134 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(13)  (11) e29");
        Put_Line ("           Script name:'test.ts'; Line:134 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 13.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (14)   (12) e35
  declare
    My35_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
    My35_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
    My35_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
    My35_Hash2 : constant Hash_Type := (16#d1#,16#ac#,16#51#,16#08#,16#b3#,16#6d#,16#59#,16#26#);
  begin  -- test case
    begin  -- test part
      Ada.Text_IO.Put_Line("Test: e35");
      Hash(Message => My35_Message, Seed => My35_Seed, Result => My35_Hash);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Compare_Hashes(My35_Hash,My35_Hash2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(14)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(14)  (12) e35");
          Put_Line ("           Script name:'test.ts'; Line:146 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(14)  (12) e35");
        Put_Line ("           Script name:'test.ts'; Line:146 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 14.");
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
