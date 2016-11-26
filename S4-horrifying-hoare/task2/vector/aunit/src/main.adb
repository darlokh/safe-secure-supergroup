with AUnit.Reporter.Text;
with AUnit.Run;
with Vectors_Suite; use Vectors_Suite;

procedure Main is
   procedure Runner is new AUnit.Run.Test_Runner (Suite);
   Reporter : AUnit.Reporter.Text.Text_Reporter;
begin
   Runner (Reporter);
end Main;
