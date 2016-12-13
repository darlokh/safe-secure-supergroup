uint64_t MurmurHash2 ( const void *key , int len , uint64_t seed) {
	const uint64_t m = (0 xc6a4a793 << 32) | 0 x5bd1e995 ; 		// m defined as const unsigned int 64 with 32 bit shifted left of hex number
																// c6a4a793 and OR operation of hex number x5bd1e995
	const int r = 24;											// r defined as constant int with value 24
	uint64_t h = seed ^ len ;									// h defined as unsigned int 64 with value seed XOR len (~random number)
	const unsigned char * data = ( const unsigned char *) key ;	// void pointer transformed to unsigned char array pointer

	while (len >= 8) {											// loop aslong len is greater equal 8
		uint64_t k = *( uint64_t *) data;						// unsigned char array transformed to unsigned 64bit int value

		k *= m;													// mult m on k
		k ^= k >> r;											// shift r-bits of k to the right, take k XOR to the result
		k *= m;													// mult m on k

		h *= m;													// mult m on h
		h ^= k;													// take h XOR k

		data += 8;												// set pointer to 8th next address
		len -= 8;												// sub 8 on len
	}

	switch (len ) {												// depending on len ...
		case 7: h ^= data [6] << 48;							// if len=7: take h XOR with data[6] shifted 48 left
		case 6: h ^= data [5] << 40;							// if len=6: h XOR with data[5] shifted 40 left
		case 5: h ^= data [4] << 32;							// if len=5: h XOR with data[4] shifted 32 left
		case 4: h ^= data [3] << 24;							// if len=4: h XOR with data[3] shifted 24 left
		case 3: h ^= data [2] << 16;							// if len=3: h XOR with data[2] shifted 16 left
		case 2: h ^= data [1] << 8;								// if len=2: h XOR with data[1] shifted 8 left
		case 1: h ^= data [0];									// if len=1: h XOR with data[0]
		h *= m;													// mult m on h
	};															// no break condition, one case executes all following cases

	h ^= h >> 13;												// take h XOR with h shifted right by 13
	h *= m;														// mult m on h
	h ^= h >> 15;												// take h XOR with h shifted right by 15
	return h;													// return hash value h
}
