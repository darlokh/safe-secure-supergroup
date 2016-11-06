-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       c:\users\leaves\documents\github\safe-secure-supergroup\s2-perillious-packages\task5\src\main.adb
  -- Script:     c:\users\leaves\documents\github\safe-secure-supergroup\s2-perillious-packages\task5\src\main.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Graph;
with Sms_Graph;
with Ada.Text_IO; use Ada.Text_IO;

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
    Ada.Text_IO.Put_Line("Starte Tests: ");
  end;  -- code block

  -- Test Case (1)   Test Add Vertex success: (1)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0, Max_Size => 100);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Vertex(1);
      	Integer_Graph.Add_Vertex(2);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      	when Integer_Graph.Vertex_Already_In_Graph_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test Add Vertex success: (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  Test Add Vertex success: (1)");
        Put_Line ("           Script name:'main.ts'; Line:7 ");
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

  -- Test Case (2)   Test Add Vertex_Already_In_Graph_Exception: (2)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Vertex(1);
      begin
      	Integer_Graph.Add_Vertex(1);
      exception
      	when Integer_Graph.Vertex_Already_In_Graph_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(2)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(2)  Test Add Vertex_Already_In_Graph_Exception: (2)");
          Put_Line ("           Script name:'main.ts'; Line:21 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  Test Add Vertex_Already_In_Graph_Exception: (2)");
        Put_Line ("           Script name:'main.ts'; Line:21 ");
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

  -- Test Case (3)   Test Add Vertex Zero exception: (3)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      Integer_Graph.Add_Vertex(0);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(3)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(3)  Test Add Vertex Zero exception: (3)");
          Put_Line ("           Script name:'main.ts'; Line:33 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  Test Add Vertex Zero exception: (3)");
        Put_Line ("           Script name:'main.ts'; Line:33 ");
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

  -- Test Case (4)   Test Add Edge From is Zero: (4)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 4.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 0, To => 2, Weight => 0);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  Test Add Edge From is Zero: (4)");
          Put_Line ("           Script name:'main.ts'; Line:44 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  Test Add Edge From is Zero: (4)");
        Put_Line ("           Script name:'main.ts'; Line:44 ");
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

  -- Test Case (5)   Test Add Edge To is Zero: (5)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 5.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 0, Weight => 0);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
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
          Put_Line ("(5)  Test Add Edge To is Zero: (5)");
          Put_Line ("           Script name:'main.ts'; Line:57 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  Test Add Edge To is Zero: (5)");
        Put_Line ("           Script name:'main.ts'; Line:57 ");
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

  -- Test Case (6)   Test Add Edge success: (6)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(6)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(6)  Test Add Edge success: (6)");
          Put_Line ("           Script name:'main.ts'; Line:70 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(6)  Test Add Edge success: (6)");
        Put_Line ("           Script name:'main.ts'; Line:70 ");
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

  -- Test Case (7)   Test Get_Edge_Weight success: (7)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Return_Weight : Integer := 0;
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 7.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Return_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Return_Weight = 32
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(7)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(7)  Test Get_Edge_Weight success: (7)");
          Put_Line ("           Script name:'main.ts'; Line:81 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(7)  Test Get_Edge_Weight success: (7)");
        Put_Line ("           Script name:'main.ts'; Line:81 ");
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

  -- Test Case (8)   Test Get_Edge_Weight not found: (8)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Return_Weight : Integer := 0;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      	Return_Weight := Integer_Graph.Get_Edge_Weight(From => 2, To => 3);
      exception
      	when Integer_Graph.Edge_Not_Found_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(8)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(8)  Test Get_Edge_Weight not found: (8)");
          Put_Line ("           Script name:'main.ts'; Line:90 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(8)  Test Get_Edge_Weight not found: (8)");
        Put_Line ("           Script name:'main.ts'; Line:90 ");
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

  -- Test Case (9)   Test Add Edge overwrite success: (9)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(9)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(9)  Test Add Edge overwrite success: (9)");
          Put_Line ("           Script name:'main.ts'; Line:103 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(9)  Test Add Edge overwrite success: (9)");
        Put_Line ("           Script name:'main.ts'; Line:103 ");
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

  -- Test Case (10)   Test Add Edge overwrite fail: (10)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not (Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 32)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(10)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(10)  Test Add Edge overwrite fail: (10)");
          Put_Line ("           Script name:'main.ts'; Line:109 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(10)  Test Add Edge overwrite fail: (10)");
        Put_Line ("           Script name:'main.ts'; Line:109 ");
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

  -- Test Case (11)   Test Has Edge success: (11)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer_Graph.Has_Edge(From => 1, To => 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(11)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(11)  Test Has Edge success: (11)");
          Put_Line ("           Script name:'main.ts'; Line:115 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(11)  Test Has Edge success: (11)");
        Put_Line ("           Script name:'main.ts'; Line:115 ");
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

  -- Test Case (12)   Test Has Edge fail: (12)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 12.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Integer_Graph.Has_Edge(From => 1, To => 3)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(12)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(12)  Test Has Edge fail: (12)");
          Put_Line ("           Script name:'main.ts'; Line:120 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(12)  Test Has Edge fail: (12)");
        Put_Line ("           Script name:'main.ts'; Line:120 ");
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

  -- Test Case (13)   Test remove Edge success: (13)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 13.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer_Graph.Remove_Edge(From => 1, To => 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(13)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(13)  Test remove Edge success: (13)");
          Put_Line ("           Script name:'main.ts'; Line:127 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if not Integer_Graph.Has_Edge(From => 1, To => 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(13)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(13)  Test remove Edge success: (13)");
          Put_Line ("           Script name:'main.ts'; Line:127 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(13)  Test remove Edge success: (13)");
        Put_Line ("           Script name:'main.ts'; Line:127 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>|=>' was expected" & ")");
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

  -- Test Case (14)   Test remove Edge not found: (14)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
    Tmp : Boolean := True;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      	Tmp := Integer_Graph.Remove_Edge(From => 1, To => 3);
      exception
      	when Integer_Graph.Edge_Not_Found_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(14)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(14)  Test remove Edge not found: (14)");
          Put_Line ("           Script name:'main.ts'; Line:135 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(14)  Test remove Edge not found: (14)");
        Put_Line ("           Script name:'main.ts'; Line:135 ");
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

  -- Test Case (15)   Test To_Vertex_Array success: (15)
  declare
    Max_Array_Size : Natural := 10;
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0, Max_Size => Max_Array_Size);
    use Integer_Graph;
    Test_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size);
    Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size) := (1,2,3,4,5,6,7,8,9,10);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
      Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
      Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
      Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
      Integer_Graph.Add_Edge(From => 9, To => 10, Weight => 89);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 15.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Test_Vertex_Array = Compare_To_Vertex_Array
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(15)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(15)  Test To_Vertex_Array success: (15)");
          Put_Line ("           Script name:'main.ts'; Line:148 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(15)  Test To_Vertex_Array success: (15)");
        Put_Line ("           Script name:'main.ts'; Line:148 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 15.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (16)   Test To_Vertex_Array fail: (16)
  declare
    Max_Array_Size : Natural := 100;
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0, Max_Size => Max_Array_Size);
    Test_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size);
    Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..Max_Array_Size) := (1,2,3,4,5,6,7,8,9,10, others => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
      Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
      Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
      Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
      Integer_Graph.Add_Edge(From => 9, To => 11, Weight => 89);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 16.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not (Integer_Graph."="(Test_Vertex_Array, Compare_To_Vertex_Array))
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(16)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(16)  Test To_Vertex_Array fail: (16)");
          Put_Line ("           Script name:'main.ts'; Line:163 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(16)  Test To_Vertex_Array fail: (16)");
        Put_Line ("           Script name:'main.ts'; Line:163 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 16.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Code section
  begin
    Ada.Text_IO.Put_Line("Sms_Graph tests: ");
  end;  -- code block

  -- Test Case (17)   Test Add Vertex success: (17)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Vertex(1);
      	Integer_Graph.Add_Vertex(2);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      	when Integer_Graph.Vertex_Already_In_Graph_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(17)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(17)  Test Add Vertex success: (17)");
          Put_Line ("           Script name:'main.ts'; Line:179 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(17)  Test Add Vertex success: (17)");
        Put_Line ("           Script name:'main.ts'; Line:179 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 17.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (18)   Test Add Vertex_Already_In_Graph_Exception: (18)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Vertex(1);
      begin
      	Integer_Graph.Add_Vertex(1);
      exception
      	when Integer_Graph.Vertex_Already_In_Graph_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(18)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(18)  Test Add Vertex_Already_In_Graph_Exception: (18)");
          Put_Line ("           Script name:'main.ts'; Line:193 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(18)  Test Add Vertex_Already_In_Graph_Exception: (18)");
        Put_Line ("           Script name:'main.ts'; Line:193 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 18.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (19)   Test Add Vertex Zero exception: (19)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      Integer_Graph.Add_Vertex(0);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(19)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(19)  Test Add Vertex Zero exception: (19)");
          Put_Line ("           Script name:'main.ts'; Line:205 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(19)  Test Add Vertex Zero exception: (19)");
        Put_Line ("           Script name:'main.ts'; Line:205 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 19.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (20)   Test Add Edge From is Zero: (20)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 20.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 0, To => 2, Weight => 0);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(20)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(20)  Test Add Edge From is Zero: (20)");
          Put_Line ("           Script name:'main.ts'; Line:216 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(20)  Test Add Edge From is Zero: (20)");
        Put_Line ("           Script name:'main.ts'; Line:216 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 20.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (21)   Test Add Edge To is Zero: (21)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 21.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 0, Weight => 0);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(21)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(21)  Test Add Edge To is Zero: (21)");
          Put_Line ("           Script name:'main.ts'; Line:229 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(21)  Test Add Edge To is Zero: (21)");
        Put_Line ("           Script name:'main.ts'; Line:229 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 21.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (22)   Test Add Edge success: (22)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      exception
      	when Integer_Graph.Vertex_Is_Zero_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(22)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(22)  Test Add Edge success: (22)");
          Put_Line ("           Script name:'main.ts'; Line:242 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(22)  Test Add Edge success: (22)");
        Put_Line ("           Script name:'main.ts'; Line:242 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 22.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (23)   Test Get_Edge_Weight success: (23)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Return_Weight : Integer := 0;
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 23.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Return_Weight := Integer_Graph.Get_Edge_Weight(From => 1, To => 2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Return_Weight = 32
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(23)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(23)  Test Get_Edge_Weight success: (23)");
          Put_Line ("           Script name:'main.ts'; Line:253 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(23)  Test Get_Edge_Weight success: (23)");
        Put_Line ("           Script name:'main.ts'; Line:253 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 23.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (24)   Test Get_Edge_Weight not found: (24)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Return_Weight : Integer := 0;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      	Return_Weight := Integer_Graph.Get_Edge_Weight(From => 2, To => 3);
      exception
      	when Integer_Graph.Edge_Not_Found_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(24)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(24)  Test Get_Edge_Weight not found: (24)");
          Put_Line ("           Script name:'main.ts'; Line:262 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(24)  Test Get_Edge_Weight not found: (24)");
        Put_Line ("           Script name:'main.ts'; Line:262 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 24.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (25)   Test Add Edge overwrite success: (25)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 2
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(25)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(25)  Test Add Edge overwrite success: (25)");
          Put_Line ("           Script name:'main.ts'; Line:275 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(25)  Test Add Edge overwrite success: (25)");
        Put_Line ("           Script name:'main.ts'; Line:275 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 25.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (26)   Test Add Edge overwrite fail: (26)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 2);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not (Integer_Graph.Get_Edge_Weight(From => 1, To => 2) = 32)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(26)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(26)  Test Add Edge overwrite fail: (26)");
          Put_Line ("           Script name:'main.ts'; Line:281 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(26)  Test Add Edge overwrite fail: (26)");
        Put_Line ("           Script name:'main.ts'; Line:281 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 26.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (27)   Test Has Edge success: (27)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer_Graph.Has_Edge(From => 1, To => 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(27)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(27)  Test Has Edge success: (27)");
          Put_Line ("           Script name:'main.ts'; Line:287 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(27)  Test Has Edge success: (27)");
        Put_Line ("           Script name:'main.ts'; Line:287 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 27.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (28)   Test Has Edge fail: (28)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 28.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not Integer_Graph.Has_Edge(From => 1, To => 3)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(28)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(28)  Test Has Edge fail: (28)");
          Put_Line ("           Script name:'main.ts'; Line:292 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(28)  Test Has Edge fail: (28)");
        Put_Line ("           Script name:'main.ts'; Line:292 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 28.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (29)   Test remove Edge success: (29)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 29.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Integer_Graph.Remove_Edge(From => 1, To => 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(29)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(29)  Test remove Edge success: (29)");
          Put_Line ("           Script name:'main.ts'; Line:299 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if not Integer_Graph.Has_Edge(From => 1, To => 2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(29)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(29)  Test remove Edge success: (29)");
          Put_Line ("           Script name:'main.ts'; Line:299 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(29)  Test remove Edge success: (29)");
        Put_Line ("           Script name:'main.ts'; Line:299 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>|=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 29.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (30)   Test remove Edge not found: (30)
  declare
    package Integer_Graph is new Sms_Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Is_Exception_Thrown : Boolean := False;
    Tmp : Boolean := True;
  begin  -- test case
    begin  -- test part
      begin
      	Integer_Graph.Add_Edge(From => 1, To => 2, Weight => 32);
      	Tmp := Integer_Graph.Remove_Edge(From => 1, To => 3);
      exception
      	when Integer_Graph.Edge_Not_Found_Exception =>
      		Is_Exception_Thrown := True;
      end;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Is_Exception_Thrown
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(30)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(30)  Test remove Edge not found: (30)");
          Put_Line ("           Script name:'main.ts'; Line:307 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(30)  Test remove Edge not found: (30)");
        Put_Line ("           Script name:'main.ts'; Line:307 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 30.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (31)   Test To_Vertex_Array success: (31)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    use Integer_Graph;
    Test_Vertex_Array : Integer_Graph.Vertex_Array(1..100);
    Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..100) := (1,2,3,4,5,6,7,8,9,10, others => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
      Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
      Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
      Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
      Integer_Graph.Add_Edge(From => 9, To => 10, Weight => 89);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 31.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Test_Vertex_Array = Compare_To_Vertex_Array
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(31)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(31)  Test To_Vertex_Array success: (31)");
          Put_Line ("           Script name:'main.ts'; Line:320 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(31)  Test To_Vertex_Array success: (31)");
        Put_Line ("           Script name:'main.ts'; Line:320 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 31.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

  -- Test Case (32)   Test To_Vertex_Array fail: (32)
  declare
    package Integer_Graph is new Graph(Vertex_Type => Integer, "=" => "=", Zero => 0);
    Test_Vertex_Array : Integer_Graph.Vertex_Array(1..100);
    Compare_To_Vertex_Array : Integer_Graph.Vertex_Array(1..100) := (1,2,3,4,5,6,7,8,9,10, others => 0);
  begin  -- test case
    begin  -- prepare part
      Integer_Graph.Add_Vertex(1);
      Integer_Graph.Add_Vertex(2);
      Integer_Graph.Add_Edge(From => 3, To => 4, Weight => 32);
      Integer_Graph.Add_Edge(From => 5, To => 6, Weight => 45);
      Integer_Graph.Add_Edge(From => 7, To => 8, Weight => 67);
      Integer_Graph.Add_Edge(From => 9, To => 11, Weight => 89);
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in prepare part of test case 32.");
        raise Driver_Internals.Program_Terminate;
    end;  -- prepare part

    begin  -- test part
      Test_Vertex_Array := Integer_Graph.To_Vertex_Array;
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if not (Integer_Graph."="(Test_Vertex_Array, Compare_To_Vertex_Array))
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(32)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(32)  Test To_Vertex_Array fail: (32)");
          Put_Line ("           Script name:'main.ts'; Line:334 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(32)  Test To_Vertex_Array fail: (32)");
        Put_Line ("           Script name:'main.ts'; Line:334 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>' was expected" & ")");
      end if;
    exception
      when Driver_Internals.Program_Terminate =>
        raise;
      when E: others =>
        Driver_Internals.Unexpected_Error := True;
        Put_Line ("ERROR: exception " & Ada.Exceptions.Exception_Name (E) & " raised in result part of test case 32.");
        raise Driver_Internals.Program_Terminate;
    end;  -- result part
  end;  -- test case

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
