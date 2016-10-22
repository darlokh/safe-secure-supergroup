with Ada.Numerics.Discrete_Random;

package body Random_Numbers is
	
	subtype RNG_Range is Positive;
	package RNG_Int is new Ada.Numerics.Discrete_Random(RNG_Range);

	RNG : RNG_Int.Generator;

	function Get_Random_Integer( n : in Positive) return Integer is
	begin
		return RNG_Int.Random(RNG) mod n;
	end Get_Random_Integer;

	begin
	RNG_Int.Reset(RNG);
end Random_Numbers;

