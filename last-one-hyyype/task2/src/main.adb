-- * This file has been automatically generated using `testgen'.
-- * Modifications should be made in the corresponding script file.

  -- Test Driver Source

  -- File:       c:\users\leaves\documents\github\safe-secure-supergroup\last-one-hyyype\task2\src\main.adb
  -- Script:     c:\users\leaves\documents\github\safe-secure-supergroup\last-one-hyyype\task2\src\main.ts


with Ada.Command_Line, Ada.Exceptions;
use type Ada.Command_Line.Exit_Status;

with Ada.Text_IO; use Ada.Text_IO;
with Graph;
with Graph_Algorithms;

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

  -- Test Case (1)   Test SPT Success (1)
  declare
    package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
    package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                             "=" => "=",
                                             Graph_Instance => Int_Graph);
    Graph_1 : Int_Graph.Graph_Type;
  begin  -- test case
    begin  -- test part
      Graph_1.Add_Vertex(0);
      Graph_1.Add_Vertex(1);
      Graph_1.Add_Vertex(2);
      Graph_1.Add_Vertex(3);
      Graph_1.Add_Vertex(4);
      Graph_1.Add_Vertex(5);
      Graph_1.Add_Vertex(6);
      Graph_1.Add_Vertex(7);
      Graph_1.Add_Vertex(8);
      Graph_1.Add_Edge(0, 1, 4);
      Graph_1.Add_Edge(0, 7, 8);
      Graph_1.Add_Edge(1, 2, 8);
      Graph_1.Add_Edge(1, 7, 11);
      Graph_1.Add_Edge(2, 3, 7);
      Graph_1.Add_Edge(2, 8, 2);
      Graph_1.Add_Edge(2, 5, 4);
      Graph_1.Add_Edge(3, 4, 9);
      Graph_1.Add_Edge(3, 5, 14);
      Graph_1.Add_Edge(4, 5, 10);
      Graph_1.Add_Edge(5, 6, 2);
      Graph_1.Add_Edge(6, 8, 6);
      Graph_1.Add_Edge(6, 7, 1);
      Graph_1.Add_Edge(7, 8, 7);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                     From => 0,
                                                     To   => 8) = 14
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test SPT Success (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                    From => 0,
                                                    To   => 3) = 19
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test SPT Success (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      elsif Driver_Internals.Path_Was ("=>") then
        if Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                    From => 2,
                                                    To   => 4) = 14
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(1)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(1)  Test SPT Success (1)");
          Put_Line ("           Script name:'main.ts'; Line:7 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(1)  Test SPT Success (1)");
        Put_Line ("           Script name:'main.ts'; Line:7 ");
        Put_Line ("      ...FAIL.");
        Put_Line ("         (" & "path `" & Driver_Internals.Taken_Path & "' when `=>|=>|=>' was expected" & ")");
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

  -- Test Case (2)   Test SPT no path not connected (2)
  declare
    package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
    package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                             "=" => "=",
                                             Graph_Instance => Int_Graph);
    Graph_1 : Int_Graph.Graph_Type;
    Test_Int : Integer;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      Graph_1.Add_Vertex(0);
      Graph_1.Add_Vertex(1);
      Graph_1.Add_Vertex(2);
      Graph_1.Add_Vertex(3);
      Graph_1.Add_Vertex(4);
      Graph_1.Add_Vertex(5);
      Graph_1.Add_Vertex(6);
      Graph_1.Add_Vertex(7);
      Graph_1.Add_Vertex(8);
      Graph_1.Add_Edge(0, 1, 4);
      Graph_1.Add_Edge(0, 7, 8);
      begin
      Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                    From => 0,
                                                    To   => 4);
      exception
      	when Int_Graph_Algos.No_Valid_Path_Exception =>
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
          Put_Line ("(2)  Test SPT no path not connected (2)");
          Put_Line ("           Script name:'main.ts'; Line:47 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(2)  Test SPT no path not connected (2)");
        Put_Line ("           Script name:'main.ts'; Line:47 ");
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

  -- Test Case (3)   Test SPT Vertex not Found (3)
  declare
    package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
    package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                             "=" => "=",
                                             Graph_Instance => Int_Graph);
    Graph_1 : Int_Graph.Graph_Type;
    Test_Int : Integer;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      Graph_1.Add_Vertex(0);
      Graph_1.Add_Vertex(1);
      Graph_1.Add_Vertex(2);
      Graph_1.Add_Vertex(3);
      Graph_1.Add_Vertex(4);
      Graph_1.Add_Vertex(5);
      Graph_1.Add_Vertex(6);
      Graph_1.Add_Vertex(7);
      Graph_1.Add_Vertex(8);
      Graph_1.Add_Edge(0, 1, 4);
      Graph_1.Add_Edge(0, 7, 8);
      Graph_1.Add_Edge(1, 2, 8);
      Graph_1.Add_Edge(1, 7, 11);
      Graph_1.Add_Edge(2, 3, 7);
      Graph_1.Add_Edge(2, 8, 2);
      Graph_1.Add_Edge(2, 5, 4);
      Graph_1.Add_Edge(3, 4, 9);
      Graph_1.Add_Edge(3, 5, 14);
      Graph_1.Add_Edge(4, 5, 10);
      Graph_1.Add_Edge(5, 6, 2);
      Graph_1.Add_Edge(6, 8, 6);
      Graph_1.Add_Edge(6, 7, 1);
      Graph_1.Add_Edge(7, 8, 7);
      begin
      Test_Int := Int_Graph_Algos.Find_Shortest_Path(G    => Graph_1,
                                                    From => 0,
                                                    To   => 10);
      exception
      	when Int_Graph_Algos.Vertex_Not_Found_Exception =>
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
          Put_Line ("(3)  Test SPT Vertex not Found (3)");
          Put_Line ("           Script name:'main.ts'; Line:76 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(3)  Test SPT Vertex not Found (3)");
        Put_Line ("           Script name:'main.ts'; Line:76 ");
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

  -- Test Case (4)   Test MSP Success (4)
  declare
    package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
    package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                             "=" => "=",
                                             Graph_Instance => Int_Graph);
    Graph_1 : Int_Graph.Graph_Type;
    Graph_2 : Int_Graph.Graph_Type;
    Graph_3 : Int_Graph.Graph_Type;
  begin  -- test case
    begin  -- test part
      Graph_1.Add_Vertex(0);
      Graph_1.Add_Vertex(1);
      Graph_1.Add_Vertex(2);
      Graph_1.Add_Vertex(3);
      Graph_1.Add_Vertex(4);
      Graph_1.Add_Vertex(5);
      Graph_1.Add_Vertex(6);
      Graph_1.Add_Vertex(7);
      Graph_1.Add_Vertex(8);
      Graph_1.Add_Edge(6, 7, 1);
      Graph_1.Add_Edge(2, 8, 2);
      Graph_1.Add_Edge(5, 6, 2);
      Graph_1.Add_Edge(0, 1, 4);
      Graph_1.Add_Edge(2, 5, 4);
      Graph_1.Add_Edge(6, 8, 6);
      Graph_1.Add_Edge(2, 3, 7);
      Graph_1.Add_Edge(7, 8, 7);
      Graph_1.Add_Edge(0, 7, 8);
      Graph_1.Add_Edge(1, 2, 8);
      Graph_1.Add_Edge(3, 4, 9);
      Graph_1.Add_Edge(4, 5, 10);
      Graph_1.Add_Edge(1, 7, 11);
      Graph_1.Add_Edge(3, 5, 14);
      Graph_2.Add_Vertex(0);
      Graph_2.Add_Vertex(1);
      Graph_2.Add_Vertex(2);
      Graph_2.Add_Vertex(3);
      Graph_2.Add_Vertex(4);
      Graph_2.Add_Vertex(5);
      Graph_2.Add_Vertex(6);
      Graph_2.Add_Vertex(7);
      Graph_2.Add_Vertex(8);
      Graph_2.Add_Edge(6, 7, 1);
      Graph_2.Add_Edge(2, 8, 2);
      Graph_2.Add_Edge(5, 6, 2);
      Graph_2.Add_Edge(0, 1, 4);
      Graph_2.Add_Edge(2, 5, 4);
      Graph_2.Add_Edge(2, 3, 7);
      Graph_2.Add_Edge(0, 7, 8);
      Graph_2.Add_Edge(3, 4, 9);
      Graph_3 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_1);
      Driver_Internals.Set_Path ("=>");
    exception
      when E: others =>
        Driver_Internals.Set_Path (Ada.Exceptions.Exception_Name (E));
    end;  -- test part
    begin  -- result part
      if Driver_Internals.Path_Was ("=>") then
        if Int_Graph.Graph_Equals(Graph_3, Graph_2)
        then
          Driver_Internals.Test_Case_Passed := True;
          Put_Line ("(4)  pass.");
        else
          Driver_Internals.Test_Case_Passed := False;
          Driver_Internals.Fail_Result := True;
          Put_Line ("(4)  Test MSP Success (4)");
          Put_Line ("           Script name:'main.ts'; Line:117 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(4)  Test MSP Success (4)");
        Put_Line ("           Script name:'main.ts'; Line:117 ");
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

  -- Test Case (5)   Test MSP Graph_Not_Connected_Exception (5)
  declare
    package Int_Graph is new Graph(Vertex_Type => Integer, "=" => "=");
    package Int_Graph_Algos is new Graph_Algorithms(Vertex_Type =>  Integer,
                                             "=" => "=",
                                             Graph_Instance => Int_Graph);
    Graph_1 : Int_Graph.Graph_Type;
    Graph_2 : Int_Graph.Graph_Type;
    Graph_3 : Int_Graph.Graph_Type;
    Is_Exception_Thrown : Boolean := False;
  begin  -- test case
    begin  -- test part
      Graph_1.Add_Vertex(0);
      Graph_1.Add_Vertex(1);
      Graph_1.Add_Vertex(2);
      Graph_1.Add_Vertex(3);
      Graph_1.Add_Vertex(4);
      Graph_1.Add_Vertex(5);
      Graph_1.Add_Vertex(6);
      Graph_1.Add_Vertex(7);
      Graph_1.Add_Vertex(8);
      Graph_1.Add_Edge(0, 1, 4);
      Graph_1.Add_Edge(0, 7, 8);
      Graph_1.Add_Edge(1, 2, 8);
      Graph_1.Add_Edge(1, 7, 11);
      Graph_1.Add_Edge(2, 3, 7);
      Graph_1.Add_Edge(2, 8, 2);
      Graph_1.Add_Edge(2, 5, 4);
      Graph_1.Add_Edge(3, 5, 14);
      Graph_1.Add_Edge(5, 6, 2);
      Graph_1.Add_Edge(6, 8, 6);
      Graph_1.Add_Edge(6, 7, 1);
      Graph_1.Add_Edge(7, 8, 7);
      Graph_2.Add_Vertex(0);
      Graph_2.Add_Vertex(1);
      Graph_2.Add_Vertex(2);
      Graph_2.Add_Vertex(3);
      Graph_2.Add_Vertex(4);
      Graph_2.Add_Vertex(5);
      Graph_2.Add_Vertex(6);
      Graph_2.Add_Vertex(7);
      Graph_2.Add_Vertex(8);
      Graph_2.Add_Edge(6, 7, 1);
      Graph_2.Add_Edge(2, 8, 2);
      Graph_2.Add_Edge(5, 6, 2);
      Graph_2.Add_Edge(0, 1, 4);
      Graph_2.Add_Edge(2, 5, 4);
      Graph_2.Add_Edge(2, 3, 7);
      Graph_2.Add_Edge(0, 7, 8);
      Graph_2.Add_Edge(3, 4, 9);
      begin
      Graph_3 := Int_Graph_Algos.Find_Min_Spanning_Tree(G => Graph_1);
      exception
      	when Int_Graph_Algos.Graph_Not_Connected_Exception =>
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
          Put_Line ("(5)  Test MSP Graph_Not_Connected_Exception (5)");
          Put_Line ("           Script name:'main.ts'; Line:170 ");
          Put_Line ("      ...FAIL.");
          Put_Line ("         (" & "path `=>' was taken, but predicate is FALSE" & ")");
        end if;
      else
        Driver_Internals.Test_Case_Passed := False;
        Driver_Internals.Fail_Result := True;
        Put_Line ("(5)  Test MSP Graph_Not_Connected_Exception (5)");
        Put_Line ("           Script name:'main.ts'; Line:170 ");
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
