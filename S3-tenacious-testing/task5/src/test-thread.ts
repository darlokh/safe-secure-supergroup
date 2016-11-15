Context
	with Thread;

***** (1) Test Initialize State
Define	My_State : Thread.State;
		My_Action : Thread.Action;
Test		Thread.Initialize(My_State);
Pass		My_State = Ready
