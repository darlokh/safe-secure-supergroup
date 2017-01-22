package body Mini_XTEA is

	function Encrypt(Plaintext: State_Type; Key: Key_Type) return State_Type is
	Left_PlainText : Word_Type;
	Right_PlainText : Word_Type;
	Shifted_Left : Word_Type;
	Shifted_Right : Word_Type;
	Temp : Word_Type;
	Delta_Value : Word_Type := 16#0#;
	Delta_Key : Word_Type;
	Result : State_Type;
	begin
		-- split into left and right
		Left_PlainText := Plaintext(Left);
		Right_PlainText := Plaintext(Right);
		

		for I in Integer range 1 .. NUM_ROUNDS/2 loop
			--shift 4 left
			Shifted_Left := Interfaces.Shift_Left(Right_PlainText, 4);
			--shift 5 right
			Shifted_Right := Interfaces.Shift_Right(Right_PlainText, 5);
		
			--xor shifted message blocks
			Temp := Shifted_Left xor Shifted_Right;

			--add result to original Right Side
			Temp := Temp + Right_PlainText;

			--add Delta to Key
			Delta_Key := Delta_Value + Key(0);

			--Xor Delta_Key with Temp
			Temp := Temp xor Delta_Key;

			--add Result to original Left Side
			Left_PlainText := Left_PlainText + Temp;

			--initialize left and right side for next round
			Temp := Right_PlainText;

			Right_PlainText := Left_PlainText;

			Left_PlainText := Temp;

			--increase Delta
			Delta_Value := Delta_Value + DELTA_CONSTANT;
		
		end loop;

		for I in Integer range 1 .. NUM_ROUNDS/2 loop
			--shift 4 left
			Shifted_Left := Interfaces.Shift_Left(Right_PlainText, 4);
			--shift 5 right
			Shifted_Right := Interfaces.Shift_Right(Right_PlainText, 5);
		
			--xor shifted message blocks
			Temp := Shifted_Left xor Shifted_Right;

			--add result to original Right Side
			Temp := Temp + Right_PlainText;

			--add Delta to Key
			Delta_Key := Delta_Value + Key(1);

			--Xor Delta_Key with Temp
			Temp := Temp xor Delta_Key;

			--add Result to original Left Side
			Left_PlainText := Left_PlainText + Temp;

			--initialize left and right side for next round
			Temp := Right_PlainText;

			Right_PlainText := Left_PlainText;

			Left_PlainText := Temp;

			--increase Delta
			Delta_Value := Delta_Value + DELTA_CONSTANT;
		
		end loop;

		Result(Left) := Left_PlainText;
		Result(Right) := Right_PlainText;

		return Result;

	end Encrypt;

	function Encrypt_First_Half(Plaintext: State_Type; Key: Word_Type) return State_Type is
	Left_PlainText : Word_Type;
	Right_PlainText : Word_Type;
	Shifted_Left : Word_Type;
	Shifted_Right : Word_Type;
	Temp : Word_Type;
	Delta_Value : Word_Type := 16#0#;
	Delta_Key : Word_Type;
	Result : State_Type;
	begin
		-- split into left and right
		Left_PlainText := Plaintext(Left);
		Right_PlainText := Plaintext(Right);
		

		for I in Integer range 1 .. NUM_ROUNDS/2 loop
			--shift 4 left
			Shifted_Left := Interfaces.Shift_Left(Right_PlainText, 4);
			--shift 5 right
			Shifted_Right := Interfaces.Shift_Right(Right_PlainText, 5);
		
			--xor shifted message blocks
			Temp := Shifted_Left xor Shifted_Right;

			--add result to original Right Side
			Temp := Temp + Right_PlainText;

			--add Delta to Key
			Delta_Key := Delta_Value + Key;

			--Xor Delta_Key with Temp
			Temp := Temp xor Delta_Key;

			--add Result to original Left Side
			Left_PlainText := Left_PlainText + Temp;

			--initialize left and right side for next round
			Temp := Right_PlainText;

			Right_PlainText := Left_PlainText;

			Left_PlainText := Temp;

			--increase Delta
			Delta_Value := Delta_Value + DELTA_CONSTANT;
		end loop;

		Result(Left) := Left_PlainText;
		Result(Right) := Right_PlainText;

		return Result;

	end Encrypt_First_Half;

	function Decrypt(Ciphertext: State_Type; Key: Key_Type) return State_Type is
	Left_Ciphertext : Word_Type;
	Right_Ciphertext : Word_Type;
	Shifted_Left : Word_Type;
	Shifted_Right : Word_Type;
	Temp : Word_Type;
	Delta_Value : Word_Type := 16#0#;
	Delta_Key : Word_Type;
	Result : State_Type;
	Left_Result : Word_Type;
	begin
		-- split into left and right
		Left_Ciphertext := Ciphertext(Left);
		Right_Ciphertext := Ciphertext(Right);
		

		--compute delta
		for I in Integer range 1 .. NUM_ROUNDS loop
			Delta_Value := Delta_Value + DELTA_CONSTANT;
		end loop;

		for I in Integer range 1 .. NUM_ROUNDS/2 loop
			--shift 4 left
			Shifted_Left := Interfaces.Shift_Left(Left_Ciphertext, 4);
			--shift 5 right
			Shifted_Right := Interfaces.Shift_Right(Left_Ciphertext, 5);
		
			--xor shifted message blocks
			Temp := Shifted_Left xor Shifted_Right;

			--add result to original Right Side
			Temp := Temp + Left_Ciphertext;

			--add Delta to Key
			Delta_Key := Delta_Value + Key(0);

			--Xor Delta_Key with Temp
			Temp := Temp xor Delta_Key;


			Left_Result := Right_Ciphertext - Temp;

			Right_Ciphertext := Left_Ciphertext;

			Left_Ciphertext := Left_Result;

			--decrease Delta
			Delta_Value := Delta_Value - DELTA_CONSTANT;
		end loop;

		for I in Integer range 1 .. NUM_ROUNDS/2 loop
			--shift 4 left
			Shifted_Left := Interfaces.Shift_Left(Left_Ciphertext, 4);
			--shift 5 right
			Shifted_Right := Interfaces.Shift_Right(Left_Ciphertext, 5);
		
			--xor shifted message blocks
			Temp := Shifted_Left xor Shifted_Right;

			--add result to original Right Side
			Temp := Temp + Left_Ciphertext;

			--add Delta to Key
			Delta_Key := Delta_Value + Key(1);

			--Xor Delta_Key with Temp
			Temp := Temp xor Delta_Key;


			Left_Result := Right_Ciphertext - Temp;

			Right_Ciphertext := Left_Ciphertext;

			Left_Ciphertext := Left_Result;

			--decrease Delta
			Delta_Value := Delta_Value - DELTA_CONSTANT;
		end loop;

		Result(Left) := Left_Ciphertext;
		Result(Right) := Right_Ciphertext;

		return Result;
	end Decrypt;

	function Decrypt_Second_Half(Ciphertext: State_Type; Key: Word_Type) return State_Type is
	Left_Ciphertext : Word_Type;
	Right_Ciphertext : Word_Type;
	Shifted_Left : Word_Type;
	Shifted_Right : Word_Type;
	Temp : Word_Type;
	Delta_Value : Word_Type := 16#0#;
	Delta_Key : Word_Type;
	Result : State_Type;
	Left_Result : Word_Type;
	begin
		-- split into left and right
		Left_Ciphertext := Ciphertext(Left);
		Right_Ciphertext := Ciphertext(Right);

		--compute delta
		for I in Integer range 1 .. NUM_ROUNDS loop
			Delta_Value := Delta_Value + DELTA_CONSTANT;
		end loop;

		for I in Integer range 1 .. NUM_ROUNDS/2 loop
			--shift 4 left
			Shifted_Left := Interfaces.Shift_Left(Left_Ciphertext, 4);
			--shift 5 right
			Shifted_Right := Interfaces.Shift_Right(Left_Ciphertext, 5);
		
			--xor shifted message blocks
			Temp := Shifted_Left xor Shifted_Right;

			--add result to original Right Side
			Temp := Temp + Left_Ciphertext;

			--add Delta to Key
			Delta_Key := Delta_Value + Key;

			--Xor Delta_Key with Temp
			Temp := Temp xor Delta_Key;


			Left_Result := Right_Ciphertext - Temp;

			Right_Ciphertext := Left_Ciphertext;

			Left_Ciphertext := Left_Result;

			--decrease Delta
			Delta_Value := Delta_Value - DELTA_CONSTANT;
		end loop;

		Result(Left) := Left_Ciphertext;
		Result(Right) := Right_Ciphertext;

		return Result;
	end Decrypt_Second_Half;

end Mini_XTEA;