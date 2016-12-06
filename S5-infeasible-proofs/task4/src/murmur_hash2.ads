with Interfaces;
use Interfaces;

package Murmur_Hash2 is

   type Int64  is new Integer_64;
   type Uint8  is new Unsigned_8;
   type Uint32 is new Unsigned_32;
   type Uint64 is new Unsigned_64;

   type Byte_Array is array (Uint64 range <>) of Uint8;

   subtype Key_Type   is Byte_Array (Uint64 range 0..7);
   subtype Hash_Type  is Byte_Array (Uint64 range 0..7);
   subtype State_Type is Byte_Array (Uint64 range 0..7);

   -- Hashes the given message under the given seed key and returns
   -- an instance that keeps track of the internal state.
   procedure Hash(Message: Byte_Array;
                  Seed: Key_Type;
                  Result: out Hash_Type);

end Murmur_Hash2;
