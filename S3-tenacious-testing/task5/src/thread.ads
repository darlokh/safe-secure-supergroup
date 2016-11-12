-------------------------------------------------------------
--
--   Task: 5
--   Program: Thread
--   Purpose: Controls states and executes actions
--            ("Exit" had to be changed to "Quit" because
--             cannot used as identifier)
-------------------------------------------------------------

package Thread is
    type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Create, Notify, Resume, Sleep, Start, Stop, Wait, Quit);
   
   -- Sets S to Ready.
   procedure Initialize(S: out State) with
     Post => (S = Ready);
      
   -- Updates the state S according to the given input state S, and the 
   -- given action A. Sets S to None if the transition is not defined. 
   procedure Do_Action(S: in out State; A: Action) with
     Post => (S /= S'Old) and
                (if S=Ready and A=Start then
                     S = Running
                 elsif S=Ready and A=Stop then
                     S = Stopped
                 elsif S=Waiting and A=Notify then
                     S = Running
                 elsif S=Running and A=Notify then
                     S = Waiting
                 elsif S=Running and A=Quit then
                     S = Stopped
                 elsif S=Running and A=Sleep then
                     S = Sleeping
                 elsif S=Sleeping and A=Resume then
                     S = Running
                 );
end Thread;
