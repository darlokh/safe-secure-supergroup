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
   
    procedure Initialize(S: out State);
    -- Sets S to Ready.
    procedure Do_Action(S: in out State; A: Action);
    -- Updates the state S according to the given input state S, and the 
    -- given action A. Sets S to None if the transition is not defined.
end Thread;
