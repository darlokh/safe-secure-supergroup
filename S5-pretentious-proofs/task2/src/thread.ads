pragma SPARK_Mode(on);
package Thread is
    type State  is (None, Ready, Running, Stopped, Sleeping, Waiting);
    type Action is (Notify, Resume, Sleep, Start, Stop, Wait);

    S: State := None;

   procedure Initialize with
     Global => (Output => S),
     Post => S = Ready;

   procedure Do_Action(A: Action) with
     Global => (In_Out => S),
     Depends => (S =>+ A), 
     Pre => ((S = Ready or S = Running or S = Stopped 
             or S = Sleeping or S = Waiting)), 
     Post => ((if S'Old = Ready and A = Start then S = Running) or
      (if S'Old = Running and A = Wait then S = Waiting) or
      (if S'Old = Waiting and A = Notify then S = Running) or
      (if S'Old = Running and A = Sleep then  S = Sleeping) or
      (if S'Old = Sleeping and A = Resume then S = Running) or
      (if S'Old = Running and A = Stop then S = Stopped) or
      (if S'Old = Ready and A = Stop then S = Stopped) or
      S = None); -- implicitly: A is of Action and S is of State
end Thread;
