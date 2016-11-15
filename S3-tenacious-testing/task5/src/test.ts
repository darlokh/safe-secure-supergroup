Context
	with Thread;
	use Thread;

***** (1) Test Initialize State
Define	My_State : State;
		My_Action : Action;
Test		Initialize(My_State);
Pass		My_State = Ready
