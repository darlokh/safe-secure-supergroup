context with Ada.Text_IO; use Ada.Text_IO;
with Parallel_Algorithms;

code Ada.Text_IO.Put_Line("Begin Testing: ");

***** Test (1) Even Array_Length (6)
define 	package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 6);
   		T1, T2 : Adder;
test 	for I in Data'Range loop
      		Data(I) := I;
   		end loop;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 21

***** Test (2) Odd Array_Length (5)
define 	package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 5);
   		T1, T2 : Adder;
test 	for I in Data'Range loop
      		Data(I) := I;
   		end loop;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 15

***** Test (3) one Element (1)
define 	package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 1);
   		T1, T2 : Adder;
test 	for I in Data'Range loop
      		Data(I) := I;
   		end loop;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 1

***** Test (4) array with independent values (odd)
define 	package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 5);
   		T1, T2 : Adder;
test 	Data(1) := 40;
		Data(2) := 2;
		Data(3) := 18;
		Data(4) := 5;
		Data(5) := 10;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 75

***** Test (5) array with independent values (even)
define 	package adders is new Parallel_Algorithms(Item_Type => Integer, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 6);
   		T1, T2 : Adder;
test 	Data(1) := 40;
		Data(2) := 2;
		Data(3) := 18;
		Data(4) := 5;
		Data(5) := 2;
		Data(6) := 3;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 70

***** Test (6) Item_Type = Natural (even)
define 	package adders is new Parallel_Algorithms(Item_Type => Natural, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 6);
   		T1, T2 : Adder;
test 	for I in Data'Range loop
      		Data(I) := I;
   		end loop;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 21

***** Test (7) Item_Type = Natural (odd)
define 	package adders is new Parallel_Algorithms(Item_Type => Natural, "+" => "+");
   		use adders;
   		Data : aliased adders.Array_Access_Type := new adders.Array_Type(1 .. 5);
   		T1, T2 : Adder;
test 	for I in Data'Range loop
      		Data(I) := I;
   		end loop;

   		T1.Set_Slice(Array_Length => Data'Last, isFirst => True, Item => Data, Val => 0);
   		T2.Set_Slice(Array_Length => Data'Last, isFirst => False, Item => Data, Val => ResultWrapper.getRes);

   		loop
      		if T1'Terminated and then T2'Terminated then
         		exit;
      		end if;
   		end loop;
pass 	ResultWrapper.getRes = 15

code Ada.Text_IO.Put_Line("done");
