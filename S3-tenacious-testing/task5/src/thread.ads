-------------------------------------------------------------
--
--   Task: 5
--   Program: Thread
--   Purpose: Controls states and executes actions
--            ("Exit" had to be changed to "Quit" because
--             cannot used as identifier)
-------------------------------------------------------------

package Thread is
   pragma Assertion_Policy(Pre => Check);
   pragma Assertion_Policy(Post => Check);
   
   type State is (None, Ready, Running, Stopped, Sleeping, Waiting);
   type Action is (Create, Notify, Resume, Sleep, Start, Stop, Wait);
   
   -- Sets S to Ready.
   procedure Initialize(S: out State) with
     Post => (S = Ready);
      
   -- Updates the state S according to the given input state S, and the 
   -- given action A. Sets S to None if the transition is not defined. 
   procedure Do_Action(S: in out State; A: Action) with
     Post => (S /= S'Old) and
                (if S'Old=Ready and A=Start then
                     S = Running
                 elsif S'Old=Ready and A=Stop then
                     S = Stopped
                 elsif S'Old=Waiting and A=Notify then
                     S = Running
                 elsif S'Old=Running and A=Notify then
                     S = Waiting
                 elsif S'Old=Running and A=Stop then
                     S = Stopped
                 elsif S'Old=Running and A=Sleep then
                     S = Sleeping
                 elsif S'Old=Sleeping and A=Resume then
                     S = Running
                 );
end Thread;
