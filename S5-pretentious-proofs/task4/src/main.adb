with Ada.Text_IO;
with Murmur_Hash2;
use Murmur_Hash2;

procedure Main is
   -- Test 0a
   My0a_HT1 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
   My0a_HT2 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
   -- Test 0b
   My0b_HT1 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
   My0b_HT2 : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#78#);
   -- Test 1
   My1_HT : constant Hash_Type := (16#00#,16#11#,16#22#,16#33#,16#44#,16#55#,16#66#,16#77#);
   -- Test 2
   My2_BA : constant Byte_Array := (16#99#,16#88#,16#77#,16#66#,16#55#,16#44#,16#33#,16#22#,16#11#,16#00#);
   My2_Index : constant Uint64 := 2;
   -- Test 3
   My3_Uint64 : constant Uint64 := 16#7766554433221100#;
   My3_HT1 : Hash_Type := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
   My3_HT2 : constant Hash_Type := (119,102,85,68,51,34,17,0);
   -- Test e01
   My01_Message : constant Byte_Array (1 .. 0) := (others => 0);
   My01_Seed : constant Key_Type := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
   My01_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My01_Hash2 : constant Hash_Type := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
   -- Test e02
   My02_Message : constant Byte_Array (1 .. 0) := (others => 0);
   My02_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
   My02_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My02_Hash2 : constant Hash_Type := (16#6e#,16#dd#,16#0e#,16#96#,16#27#,16#8b#,16#03#,16#a5#);
   -- Test e03
   My03_Message : constant Byte_Array (1 .. 0) := (others => 0);
   My03_Seed : constant Key_Type := (16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#);
   My03_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My03_Hash2 : constant Hash_Type := (16#16#,16#75#,16#19#,16#e7#,16#96#,16#00#,16#5f#,16#3a#);
   -- Test e08
   My08_Message : constant Byte_Array := (16#00#,16#00#);
   My08_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
   My08_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My08_Hash2 : constant Hash_Type := (16#c6#,16#c1#,16#90#,16#86#,16#05#,16#c0#,16#d1#,16#c0#);
   -- Test e09
   My09_Message : constant Byte_Array := (16#00#,16#00#);
   My09_Seed : constant Key_Type := (16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#);
   My09_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My09_Hash2 : constant Hash_Type := (16#ed#,16#bc#,16#80#,16#3e#,16#9a#,16#6c#,16#0d#,16#4e#);
   -- Test e14
   My14_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#);
   My14_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
   My14_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My14_Hash2 : constant Hash_Type := (16#58#,16#e5#,16#75#,16#8e#,16#20#,16#e5#,16#d3#,16#57#);
   -- Test e27
   My27_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
   My27_Seed : constant Key_Type := (16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#,16#11#);
   My27_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My27_Hash2 : constant Hash_Type := (16#6e#,16#5d#,16#fd#,16#3e#,16#58#,16#52#,16#8b#,16#c5#);
   -- Test e29
   My29_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
   My29_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
   My29_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My29_Hash2 : constant Hash_Type := (16#14#,16#3c#,16#5a#,16#ec#,16#0b#,16#30#,16#89#,16#b9#);
   --Test e35
   My35_Message : constant Byte_Array := (16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#,16#00#);
   My35_Seed : constant Key_Type := (16#01#,16#23#,16#45#,16#67#,16#89#,16#ab#,16#cd#,16#ef#);
   My35_Hash : Hash_Type := (0,0,0,0,0,0,0,0);
   My35_Hash2 : constant Hash_Type := (16#d1#,16#ac#,16#51#,16#08#,16#b3#,16#6d#,16#59#,16#26#);


begin
   -- Test 0a: Compate True
   Ada.Text_IO.Put_Line("Test 0a: Compare True");
   if Compare_Hashes(My0a_HT1,My0a_HT2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   -- Test 0b: Compate False
   Ada.Text_IO.Put_Line("Test 0b: Compare False");
   if not Compare_Hashes(My0b_HT1,My0b_HT2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   -- Test 1: Hash-Type to UInt64
   Ada.Text_IO.Put_Line("Test 1: Hash-Type to UInt64");
   if Hash_Type_To_UInt64(My1_HT) = 4822678189205111 then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   -- Test 2: Byte-Array to UInt64
   Ada.Text_IO.Put_Line("Test 2: Byte_Array to UInt64");
   if Byte_Array_To_UInt64(A => My2_BA, Start_Index => My2_Index) = 8603657889541918976 then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   -- Test 3: UInt64 to Hash-Type
   Ada.Text_IO.Put_Line("Test 3: UInt64 to Hash-Type");
   My3_HT1 := UInt64_To_Hash_Type(My3_Uint64);
   if Compare_Hashes(My3_HT1,My3_HT2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   -- Tests Eik
   Ada.Text_IO.Put_Line("Test: e01");
   Hash(Message => My01_Message, Seed => My01_Seed, Result => My01_Hash);
   if Compare_Hashes(My01_Hash,My01_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e02");
   Hash(Message => My02_Message, Seed => My02_Seed, Result => My02_Hash);
   if Compare_Hashes(My02_Hash,My02_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e03");
   Hash(Message => My03_Message, Seed => My03_Seed, Result => My03_Hash);
   if Compare_Hashes(My03_Hash,My03_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e08");
   Hash(Message => My08_Message, Seed => My08_Seed, Result => My08_Hash);
   if Compare_Hashes(My08_Hash,My08_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e09");
   Hash(Message => My09_Message, Seed => My09_Seed, Result => My09_Hash);
   if Compare_Hashes(My09_Hash,My09_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e14");
   Hash(Message => My14_Message, Seed => My14_Seed, Result => My14_Hash);
   if Compare_Hashes(My14_Hash,My14_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e27");
   Hash(Message => My27_Message, Seed => My27_Seed, Result => My27_Hash);
   if Compare_Hashes(My27_Hash,My27_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e29");
   Hash(Message => My29_Message, Seed => My29_Seed, Result => My29_Hash);
   if Compare_Hashes(My29_Hash,My29_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;

   Ada.Text_IO.Put_Line("Test: e35");
   Hash(Message => My35_Message, Seed => My35_Seed, Result => My35_Hash);
   if Compare_Hashes(My35_Hash,My35_Hash2) then
      Ada.Text_IO.Put_Line("Pass.");
   else
      Ada.Text_IO.Put_Line("Failed.");
   end if;
end Main;
