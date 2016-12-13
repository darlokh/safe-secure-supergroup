context with Ada.Text_IO; use Ada.Text_IO;
  with Thread;

code Ada.Text_IO.Put_Line("Start Tests: ");

***** Test (1) Init
define use Thread;
test Initialize;
pass S = Ready

***** Test (2) Stop
define use Thread;
test Initialize;
  Do_Action(Stop);
pass S = Stopped

***** Test (3) Start
define use Thread;
test Initialize;
  Do_Action(Start);
pass S = Running

***** Test (4) Wait
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
pass S = Waiting

***** Test (5) Notify
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
  Do_Action(Notify);
pass S = Running

***** Test (6) Sleep
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
pass S = Sleeping

***** Test (7) Resume
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
  Do_Action(Resume);
pass S = Running

***** Test (8) Stop2
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Stop);
pass S = Stopped

***** Test (9) invalid transitions from ready
define use Thread;
test Initialize;
  Do_Action(Notify);
pass S = None

***** Test (10)
define use Thread;
test Initialize;
  Do_Action(Wait);
pass S = None

***** Test (11)
define use Thread;
test Initialize;
  Do_Action(Sleep);
pass S = None

***** Test (12)
define use Thread;
test Initialize;
  Do_Action(Resume);
pass S = None

***** Test (13) invalid transitions from Running
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Start);
pass S = None

***** Test (14)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Notify);
pass S = None

***** Test (15)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Resume);
pass S = None

***** Test (16) invalid transitions from Waiting
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
  Do_Action(Start);
pass S = None

***** Test (17)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
  Do_Action(Wait);
pass S = None

***** Test (18)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
  Do_Action(Resume);
pass S = None

***** Test (19)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
  Do_Action(Sleep);
pass S = None

***** Test (20)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Wait);
  Do_Action(Stop);
pass S = None


***** Test (21) invalid transitions from Sleeping
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
  Do_Action(Start);
pass S = None

***** Test (22)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
  Do_Action(Wait);
pass S = None

***** Test (23)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
  Do_Action(Notify);
pass S = None

***** Test (24)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
  Do_Action(Sleep);
pass S = None

***** Test (25)
define use Thread;
test Initialize;
  Do_Action(Start);
  Do_Action(Sleep);
  Do_Action(Stop);
pass S = None


***** Test (26) invalid transitions from Stopped
define use Thread;
test Initialize;
  Do_Action(Stop);
  Do_Action(Start);
pass S = None

***** Test (27)
define use Thread;
test Initialize;
  Do_Action(Stop);
  Do_Action(Wait);
pass S = None

***** Test (28)
define use Thread;
test Initialize;
  Do_Action(Stop);
  Do_Action(Notify);
pass S = None

***** Test (29)
define use Thread;
test Initialize;
  Do_Action(Stop);
  Do_Action(Sleep);
pass S = None

***** Test (30)
define use Thread;
test Initialize;
  Do_Action(Stop);
  Do_Action(Stop);
pass S = None

***** Test (31)
define use Thread;
test Initialize;
  Do_Action(Stop);
  Do_Action(Resume);
pass S = None

code Ada.Text_IO.Put_Line("done");
