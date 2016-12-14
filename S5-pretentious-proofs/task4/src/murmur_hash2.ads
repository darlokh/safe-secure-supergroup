with Interfaces;
use Interfaces;

package Murmur_Hash2 is

   type Int64  is new Interfaces.Integer_64;
   type Uint8  is new Interfaces.Unsigned_8;
   type Uint32 is new Interfaces.Unsigned_32;
   type Uint64 is new Interfaces.Unsigned_64;

   type Byte_Array is array (Uint64 range <>) of Uint8;

   subtype Key_Type   is Byte_Array (Uint64 range 0..7);
   subtype Hash_Type  is Byte_Array (Uint64 range 0..7);

   -- Hashes the given message under the given seed key and returns
   -- an instance that keeps track of the internal state.
   procedure Hash(Message: Byte_Array;
                  Seed: Key_Type;
                  Result: out Hash_Type);

   -- Transforms a Key_Type to a UInt64
   function Hash_Type_To_UInt64(A: Key_Type) return Uint64;
   -- Transform 8 Bytes from an Byte Array starting from an Index to a UInt64
   function Byte_Array_To_UInt64(A: Byte_Array; Start_Index: Uint64) return Uint64;
   -- Transforms a UInt64 to a Key_Type
   function UInt64_To_Hash_Type(A: UInt64) return Key_Type;
   -- Put Hash_Type in the form [x,x,x,x,x,x,x,x]
   procedure Put_Hash_Type (A: Hash_Type);
   -- Compare two Hash-Types and returns ture if they have the same values
   function Compare_Hashes(A: Hash_Type; B: Hash_Type) return Boolean;
end Murmur_Hash2;
