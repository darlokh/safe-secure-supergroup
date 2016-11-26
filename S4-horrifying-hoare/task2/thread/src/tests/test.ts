Context
	with Ada.Text_IO; use Ada.Text_IO;
	with Thread; use Thread;

***** (1) Test Initialize State
Define	My_State : State;
		My_Action : Action;
Test		Initialize(My_State);
Pass		My_State = Ready

***** (2) Test Change State 1
Define	My_State : State := Ready;
		My_Action : Action := Start;
Test		Do_Action(My_State, My_Action);
Pass		My_State = Running

***** (3) Test Change State 2
Define	My_State : State := Ready;
		My_Action : Action := Stop;
Test		Do_Action(My_State, My_Action);
Pass		My_State = Stopped

***** (4) Test Change State 3
Define	My_State : State := Waiting;
		My_Action : Action := Notify;
Test		Do_Action(My_State, My_Action);
Pass		My_State = Running

***** (5) Test Change State 4
Define	My_State : State := Running;
		My_Action : Action := Notify;
Test		Do_Action(My_State, My_Action);
Pass		My_State = Waiting

***** (6) Test Change State 5
Define	My_State : State := Running;
		My_Action : Action := Sleep;
Test		Do_Action(My_State, My_Action);
Pass		My_State = Sleeping

***** (7) Test Change State 6
Define	My_State : State := Sleeping;
		My_Action : Action := Resume;
Test		Do_Action(My_State, My_Action);
Pass		My_State = Running

***** (8) Test Change State 7
Define	My_State : State := Running;
		My_Action : Action := Start;
Test		Do_Action(My_State, My_Action);
Pass		My_State = None