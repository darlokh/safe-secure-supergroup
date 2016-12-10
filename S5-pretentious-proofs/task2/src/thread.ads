package Thread is
    type State  is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Notify, Resume, Sleep, Start, Stop, Wait);

    S: State := None;

    procedure Initialize;
    -- Sets S to Ready.

    procedure Do_Action(A: Action);
    -- Updates the state S according to the given input state S, and the 
    -- given action A. Sets S to None if the transition is not defined.
end Thread;
