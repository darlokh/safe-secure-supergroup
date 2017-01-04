Context
	with Ada.Text_IO; use Ada.Text_IO;
	with Sorting; use Sorting;

***** Sorting 1
Define
	My_Array : Sorting.Natural_Array :=
     (1,3,5,7,9,2,4,6,8);
Test
	Sorting.Selection_Sort(My_Array);
Pass Is_Sorted(My_Array)

***** Sorting 2
Define
	My_Array : Sorting.Natural_Array :=
     (9,8,7,6,5,4,3,2,1);
Test
	Sorting.Selection_Sort(My_Array);
Pass Is_Sorted(My_Array)

***** Sorting 3
Define
	My_Array : Sorting.Natural_Array :=
     (9,9,8,8,7,7,3,3,2,2,1,1);
Test
	Sorting.Selection_Sort(My_Array);
Pass Is_Sorted(My_Array)