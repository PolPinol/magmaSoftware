/************************************************************/
/*                                                          */
/* Project name: Qary nonlinear codes in MAGMA              */
/* Test file name:   QaryInformationSets_BB_test.m          */
/*                                                          */
/* Comments: Black-box tests for the functions              */
/*           IsInformationSet, IsSystematic,                */
/*           InformationSpace, InformationSet,              */
/*           and AllInformationSets included in the         */ 
/*           QaryCodes_InformationSets.m file               */
/*                                                          */
/* Authors: P. Piñol, J. Pujol, and M. Villanueva           */
/*                                                          */
/* Revision version and last date: 1.0, 02/06/2020          */
/*                                                          */
/************************************************************/

SetAssertions(true);
Alarm(30*60);

/************************************************************/
/*                                                          */
/*                                                          */
/************************************************************/
/************************************************************/
/*                                                          */
/*                                                          */
/************************************************************/
print "test 1: Universe code of length 10 over GF(3)";
universeCode := UniverseCode(GF(3), 10);
C := QaryCode(universeCode);

I1 := [1..Length(C)];
I2 := [1..Length(C)] cat [3,4];
I3 := [1,2,6];
I4 := [1,2,7,7];

expectedOutputAllInformationSets := [ [1..10] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := true;
expectedOutputIsInformationSet3 := false;
expectedOutputIsInformationSet4 := false;
expectedInformationSpace := VectorSpace(GF(3), 10);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);
OutputIsInformationSet4 := IsInformationSet(C, I4);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;
assert expectedOutputIsInformationSet4 eq OutputIsInformationSet4;


/****************************************************************/
print "test 2: Repetition code of length 12 over GF(4)";
repetitionCode := RepetitionCode(GF(4), 12);
C := QaryCode(repetitionCode);

I1 := [1..Length(C)];
I2 := [1..Length(C)] cat [3,4];
I3 := [1];
I4 := [4,4,4];

expectedOutputAllInformationSets := [ [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := false;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := true;
expectedOutputIsInformationSet4 := true;
expectedInformationSpace := VectorSpace(GF(4), 1);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);
OutputIsInformationSet4 := IsInformationSet(C, I4);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;
assert expectedOutputIsInformationSet4 eq OutputIsInformationSet4;

/****************************************************************/

print "test 3: Zero code of length 13 over GF(8)";
zeroCode := ZeroCode(GF(8), 13);
C := QaryCode(zeroCode);

I1 := [1..Length(C)];
I2 := [1];
I3 := [];

expectedOutputAllInformationSets := [];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := false;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := true;
expectedInformationSpace := VectorSpace(GF(8), 0);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;


/****************************************************************/
print "test 4: q=3, n=13, kerDim=8, #C=59049, #rep=9, nonlinear"; 
load "./data/Cq3n13ker8c_seqgen.m";
L := Cq3n13ker8c_seq;
C := QaryCode(L);

I1 := [1,2,3,4,5,6,7,8,10,11];
I2 := [1,2,3,4,5,6,7,8,10,11];
I3 := [1,2,3,4,5,6,7,8,9,12];
I4 := [1,2,3,4,5,6,7,8,10,12];
I5 := [1..10];
I6 := [2..11];
I7 := [3..12];

expectedOutputAllInformationSets := [ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 11 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 10, 11 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 10, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 10, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 11, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 11 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 11 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 13 ], [ 1, 2, 3, 4, 5, 6, 8, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 11 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 12 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 12 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 5, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 11 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 11, 12 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 6, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 11, 12 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 7, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 7, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 7, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 11 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 12 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 5, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 12 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 4, 5, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 2, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 2, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 2, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 10, 11 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 10, 12 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 10, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 1, 3, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 3, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 3, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 3, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 3, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 3, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 4, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 12 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 10, 11, 12 ], [ 2, 3, 4, 5, 6, 7, 8, 10, 11, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 10, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 12 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 13 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 12, 13 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 12 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 13 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 12, 13 ], [ 2, 3, 4, 5, 6, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 8, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 10, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 2, 3, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 2, 4, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 2, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 2, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 4, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 2, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 3, 4, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 3, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 3, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 3, 4, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 3, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 3, 4, 6, 7, 8, 9, 10, 11, 12, 13 ] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := true;
expectedOutputIsInformationSet3 := true;
expectedOutputIsInformationSet4 := true;
expectedOutputIsInformationSet5 := false;
expectedOutputIsInformationSet6 := false;
expectedOutputIsInformationSet7 := true;
expectedInformationSpace := VectorSpace(GF(3), 10);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);
OutputIsInformationSet4 := IsInformationSet(C, I4);
OutputIsInformationSet5 := IsInformationSet(C, I5);
OutputIsInformationSet6 := IsInformationSet(C, I6);
OutputIsInformationSet7 := IsInformationSet(C, I7);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;
assert expectedOutputIsInformationSet4 eq OutputIsInformationSet4;
assert expectedOutputIsInformationSet5 eq OutputIsInformationSet5;
assert expectedOutputIsInformationSet6 eq OutputIsInformationSet6;
assert expectedOutputIsInformationSet7 eq OutputIsInformationSet7;

/****************************************************************/
print "test 5: q=3, n=13, kerDim=9, #C=59049, #rep=3, nonlinear"; 
load "./data/Cq3n13ker9a_seqgen.m";
L := Cq3n13ker9a_seq;
C := QaryCode(L);

I1 := [1,2,3,4,5,6,7,8,10,11];
I2 := [1..10];
I3 := [3..12];

expectedOutputAllInformationSets := [ [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 11 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 10, 11 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 10, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 10, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 11, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 8, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 11 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 12 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 11 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 13 ], [ 1, 2, 3, 4, 5, 6, 8, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 11 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 12 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 12 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 5, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 11 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 11, 12 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 6, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 11, 12 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 7, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 7, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 7, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 11 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 12 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 11, 12 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 10, 11, 12 ], [ 1, 2, 3, 5, 6, 7, 8, 10, 11, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 9, 10, 11, 13 ], [ 1, 2, 3, 5, 6, 7, 9, 10, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 5, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 12 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 11, 12 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 11, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 11, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 9, 10, 11, 12 ], [ 1, 2, 4, 5, 6, 7, 9, 10, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 4, 5, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 2, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 2, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 2, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 10, 11 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 10, 12 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 10, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 11, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 9, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 12 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 9, 10, 11, 12 ], [ 1, 3, 4, 5, 6, 7, 9, 10, 11, 13 ], [ 1, 3, 4, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 1, 3, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 3, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 3, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 3, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 3, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 3, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 4, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 1, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 12 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 10, 11, 12 ], [ 2, 3, 4, 5, 6, 7, 8, 10, 11, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 10, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 12 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 13 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 12, 13 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 12 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 13 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 12, 13 ], [ 2, 3, 4, 5, 6, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 8, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 10, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 2, 3, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 2, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 2, 4, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 2, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 2, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 4, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 2, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ], [ 3, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 3, 4, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 3, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 3, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 3, 4, 5, 6, 8, 9, 10, 11, 12, 13 ], [ 3, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 3, 4, 6, 7, 8, 9, 10, 11, 12, 13 ] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := true;
expectedInformationSpace := VectorSpace(GF(3), 10);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;

/****************************************************************/
print "test 6: q=4, n=16, kerDim=1, #C=64, #rep=16, nonlinear"; 
load "./data/CHadq4n16ker1b_seqgen.m";
L := CHadq4n16ker1b_seq;
C := QaryCode(L);

I1 := [2,7,8];
I2 := [1,3,5];
I3 := [1..3];
I4 := [1,2];

expectedOutputAllInformationSets := [ [ 1, 2, 7 ], [ 1, 2, 8 ], [ 1, 2, 11 ], [ 1, 2, 12 ], [ 1, 2, 15 ], [ 1, 2, 16 ], [ 1, 3, 5 ], [ 1, 3, 8 ], [ 1, 3, 10 ], [ 1, 3, 12 ], [ 1, 3, 13 ], [ 1, 3, 15 ], [ 1, 4, 6 ], [ 1, 4, 8 ], [ 1, 4, 9 ], [ 1, 4, 12 ], [ 1, 4, 14 ], [ 1, 4, 15 ], [ 1, 5, 7 ], [ 1, 6, 7 ], [ 1, 6, 9 ], [ 1, 6, 14 ], [ 1, 7, 8 ], [ 1, 9, 11 ], [ 1, 9, 14 ], [ 1, 10, 11 ], [ 1, 11, 12 ], [ 1, 13, 16 ], [ 1, 14, 16 ], [ 1, 15, 16 ], [ 2, 3, 5 ], [ 2, 3, 7 ], [ 2, 3, 10 ], [ 2, 3, 11 ], [ 2, 3, 13 ], [ 2, 3, 16 ], [ 2, 4, 6 ], [ 2, 4, 7 ], [ 2, 4, 9 ], [ 2, 4, 11 ], [ 2, 4, 14 ], [ 2, 4, 16 ], [ 2, 5, 8 ], [ 2, 5, 10 ], [ 2, 5, 13 ], [ 2, 6, 8 ], [ 2, 7, 8 ], [ 2, 9, 12 ], [ 2, 10, 12 ], [ 2, 10, 13 ], [ 2, 11, 12 ], [ 2, 13, 15 ], [ 2, 14, 15 ], [ 2, 15, 16 ], [ 3, 4, 5 ], [ 3, 4, 6 ], [ 3, 4, 9 ], [ 3, 4, 10 ], [ 3, 4, 13 ], [ 3, 4, 14 ], [ 3, 5, 6 ], [ 3, 6, 7 ], [ 3, 6, 8 ], [ 3, 8, 12 ], [ 3, 8, 15 ], [ 3, 9, 10 ], [ 3, 9, 11 ], [ 3, 9, 12 ], [ 3, 12, 15 ], [ 3, 13, 14 ], [ 3, 14, 15 ], [ 3, 14, 16 ], [ 4, 5, 6 ], [ 4, 5, 7 ], [ 4, 5, 8 ], [ 4, 7, 11 ], [ 4, 7, 16 ], [ 4, 9, 10 ], [ 4, 10, 11 ], [ 4, 10, 12 ], [ 4, 11, 16 ], [ 4, 13, 14 ], [ 4, 13, 15 ], [ 4, 13, 16 ], [ 5, 6, 11 ], [ 5, 6, 12 ], [ 5, 6, 15 ], [ 5, 6, 16 ], [ 5, 7, 10 ], [ 5, 7, 12 ], [ 5, 7, 13 ], [ 5, 7, 15 ], [ 5, 8, 9 ], [ 5, 8, 12 ], [ 5, 8, 14 ], [ 5, 8, 15 ], [ 5, 9, 11 ], [ 5, 10, 11 ], [ 5, 10, 13 ], [ 5, 10, 15 ], [ 5, 11, 12 ], [ 5, 11, 16 ], [ 5, 12, 13 ], [ 5, 13, 16 ], [ 5, 14, 16 ], [ 5, 15, 16 ], [ 6, 7, 10 ], [ 6, 7, 11 ], [ 6, 7, 13 ], [ 6, 7, 16 ], [ 6, 8, 9 ], [ 6, 8, 11 ], [ 6, 8, 14 ], [ 6, 8, 16 ], [ 6, 9, 12 ], [ 6, 9, 14 ], [ 6, 9, 16 ], [ 6, 10, 12 ], [ 6, 11, 12 ], [ 6, 11, 14 ], [ 6, 12, 15 ], [ 6, 13, 15 ], [ 6, 14, 15 ], [ 6, 15, 16 ], [ 7, 8, 9 ], [ 7, 8, 10 ], [ 7, 8, 13 ], [ 7, 8, 14 ], [ 7, 9, 10 ], [ 7, 9, 11 ], [ 7, 9, 12 ], [ 7, 9, 14 ], [ 7, 10, 16 ], [ 7, 11, 13 ], [ 7, 11, 16 ], [ 7, 13, 14 ], [ 7, 14, 15 ], [ 7, 14, 16 ], [ 8, 9, 10 ], [ 8, 9, 15 ], [ 8, 10, 11 ], [ 8, 10, 12 ], [ 8, 10, 13 ], [ 8, 12, 14 ], [ 8, 12, 15 ], [ 8, 13, 14 ], [ 8, 13, 15 ], [ 8, 13, 16 ], [ 9, 10, 15 ], [ 9, 10, 16 ], [ 9, 11, 13 ], [ 9, 11, 16 ], [ 9, 12, 14 ], [ 9, 12, 16 ], [ 9, 13, 15 ], [ 9, 14, 15 ], [ 9, 15, 16 ], [ 10, 11, 13 ], [ 10, 11, 15 ], [ 10, 12, 14 ], [ 10, 12, 15 ], [ 10, 13, 16 ], [ 10, 14, 16 ], [ 10, 15, 16 ], [ 11, 12, 13 ], [ 11, 12, 14 ], [ 11, 13, 14 ], [ 11, 14, 15 ], [ 11, 14, 16 ], [ 12, 13, 14 ], [ 12, 13, 15 ], [ 12, 13, 16 ] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := true;
expectedOutputIsInformationSet3 := false;
expectedOutputIsInformationSet4 := false;
expectedInformationSpace := VectorSpace(GF(4), 3);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);
OutputIsInformationSet4 := IsInformationSet(C, I4);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;
assert expectedOutputIsInformationSet4 eq OutputIsInformationSet4;

/****************************************************************/
print "test 7: q=4, n=16, kerDim=0, #C=16, #rep=16, nonlinear"; 
load "./data/Cq4n16ker0_seqgen.m";
L := Cq4n16ker0_seq;
C := QaryCode(L);

I1 := [1,2];
I2 := [2,3];
I3 := [1,16];

expectedOutputIsSystematic := false;
expectedOutputIsInformationSet1 := false;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := false;
expectedInformationSpace := VectorSpace(GF(4), 2);

OutputIsSystematic := IsSystematic(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;


/****************************************************************/
print "test 8: q=8, n=20, kerDim=3, #C=2560, #rep=5, nonlinear";  
load "./data/Cq8n20ker3_seqgen.m";
L := Cq8n20ker3_seq;
C := QaryCode(L);

I1 := [1..4];
I2 := [3,6,8];
I3 := [1..Length(C)];

expectedOutputIsSystematic := false;
expectedOutputIsInformationSet1 := false;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := false;

OutputIsSystematic := IsSystematic(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;

/****************************************************************/
print "test 9: q=4, n=16, kerDim=3, #C=64, #rep=0, linear";
load "./data/CHadq4n16ker3_seqgen.m";
L := CHadq4n16ker3_seq;
C := QaryCode(L);

I1 := [2,6,9];
I2 := [1..3];
I3 := [2,3,5];

expectedOutputAllInformationSets := [ [ 1, 2, 5 ], [ 1, 2, 6 ], [ 1, 2, 7 ], [ 1, 2, 8 ], [ 1, 2, 9 ], [ 1, 2, 10 ], [ 1, 2, 11 ], [ 1, 2, 12 ], [ 1, 2, 13 ], [ 1, 2, 14 ], [ 1, 2, 15 ], [ 1, 2, 16 ], [ 1, 3, 5 ], [ 1, 3, 6 ], [ 1, 3, 7 ], [ 1, 3, 8 ], [ 1, 3, 9 ], [ 1, 3, 10 ], [ 1, 3, 11 ], [ 1, 3, 12 ], [ 1, 3, 13 ], [ 1, 3, 14 ], [ 1, 3, 15 ], [ 1, 3, 16 ], [ 1, 4, 5 ], [ 1, 4, 6 ], [ 1, 4, 7 ], [ 1, 4, 8 ], [ 1, 4, 9 ], [ 1, 4, 10 ], [ 1, 4, 11 ], [ 1, 4, 12 ], [ 1, 4, 13 ], [ 1, 4, 14 ], [ 1, 4, 15 ], [ 1, 4, 16 ], [ 1, 5, 6 ], [ 1, 5, 7 ], [ 1, 5, 8 ], [ 1, 5, 10 ], [ 1, 5, 11 ], [ 1, 5, 12 ], [ 1, 5, 14 ], [ 1, 5, 15 ], [ 1, 5, 16 ], [ 1, 6, 7 ], [ 1, 6, 8 ], [ 1, 6, 9 ], [ 1, 6, 10 ], [ 1, 6, 12 ], [ 1, 6, 13 ], [ 1, 6, 14 ], [ 1, 6, 15 ], [ 1, 7, 8 ], [ 1, 7, 9 ], [ 1, 7, 10 ], [ 1, 7, 11 ], [ 1, 7, 13 ], [ 1, 7, 15 ], [ 1, 7, 16 ], [ 1, 8, 9 ], [ 1, 8, 11 ], [ 1, 8, 12 ], [ 1, 8, 13 ], [ 1, 8, 14 ], [ 1, 8, 16 ], [ 1, 9, 10 ], [ 1, 9, 11 ], [ 1, 9, 12 ], [ 1, 9, 14 ], [ 1, 9, 15 ], [ 1, 9, 16 ], [ 1, 10, 11 ], [ 1, 10, 12 ], [ 1, 10, 13 ], [ 1, 10, 14 ], [ 1, 10, 16 ], [ 1, 11, 12 ], [ 1, 11, 13 ], [ 1, 11, 14 ], [ 1, 11, 15 ], [ 1, 12, 13 ], [ 1, 12, 15 ], [ 1, 12, 16 ], [ 1, 13, 14 ], [ 1, 13, 15 ], [ 1, 13, 16 ], [ 1, 14, 15 ], [ 1, 14, 16 ], [ 1, 15, 16 ], [ 2, 3, 5 ], [ 2, 3, 6 ], [ 2, 3, 7 ], [ 2, 3, 8 ], [ 2, 3, 9 ], [ 2, 3, 10 ], [ 2, 3, 11 ], [ 2, 3, 12 ], [ 2, 3, 13 ], [ 2, 3, 14 ], [ 2, 3, 15 ], [ 2, 3, 16 ], [ 2, 4, 5 ], [ 2, 4, 6 ], [ 2, 4, 7 ], [ 2, 4, 8 ], [ 2, 4, 9 ], [ 2, 4, 10 ], [ 2, 4, 11 ], [ 2, 4, 12 ], [ 2, 4, 13 ], [ 2, 4, 14 ], [ 2, 4, 15 ], [ 2, 4, 16 ], [ 2, 5, 6 ], [ 2, 5, 7 ], [ 2, 5, 8 ], [ 2, 5, 9 ], [ 2, 5, 10 ], [ 2, 5, 11 ], [ 2, 5, 13 ], [ 2, 5, 14 ], [ 2, 5, 16 ], [ 2, 6, 7 ], [ 2, 6, 8 ], [ 2, 6, 9 ], [ 2, 6, 11 ], [ 2, 6, 12 ], [ 2, 6, 13 ], [ 2, 6, 15 ], [ 2, 6, 16 ], [ 2, 7, 8 ], [ 2, 7, 10 ], [ 2, 7, 11 ], [ 2, 7, 12 ], [ 2, 7, 13 ], [ 2, 7, 14 ], [ 2, 7, 15 ], [ 2, 8, 9 ], [ 2, 8, 10 ], [ 2, 8, 12 ], [ 2, 8, 14 ], [ 2, 8, 15 ], [ 2, 8, 16 ], [ 2, 9, 10 ], [ 2, 9, 11 ], [ 2, 9, 12 ], [ 2, 9, 13 ], [ 2, 9, 14 ], [ 2, 9, 15 ], [ 2, 10, 11 ], [ 2, 10, 12 ], [ 2, 10, 13 ], [ 2, 10, 15 ], [ 2, 10, 16 ], [ 2, 11, 12 ], [ 2, 11, 14 ], [ 2, 11, 15 ], [ 2, 11, 16 ], [ 2, 12, 13 ], [ 2, 12, 14 ], [ 2, 12, 16 ], [ 2, 13, 14 ], [ 2, 13, 15 ], [ 2, 13, 16 ], [ 2, 14, 15 ], [ 2, 14, 16 ], [ 2, 15, 16 ], [ 3, 4, 5 ], [ 3, 4, 6 ], [ 3, 4, 7 ], [ 3, 4, 8 ], [ 3, 4, 9 ], [ 3, 4, 10 ], [ 3, 4, 11 ], [ 3, 4, 12 ], [ 3, 4, 13 ], [ 3, 4, 14 ], [ 3, 4, 15 ], [ 3, 4, 16 ], [ 3, 5, 6 ], [ 3, 5, 7 ], [ 3, 5, 8 ], [ 3, 5, 9 ], [ 3, 5, 11 ], [ 3, 5, 12 ], [ 3, 5, 13 ], [ 3, 5, 14 ], [ 3, 5, 15 ], [ 3, 6, 7 ], [ 3, 6, 8 ], [ 3, 6, 9 ], [ 3, 6, 10 ], [ 3, 6, 11 ], [ 3, 6, 14 ], [ 3, 6, 15 ], [ 3, 6, 16 ], [ 3, 7, 8 ], [ 3, 7, 9 ], [ 3, 7, 10 ], [ 3, 7, 12 ], [ 3, 7, 13 ], [ 3, 7, 14 ], [ 3, 7, 16 ], [ 3, 8, 10 ], [ 3, 8, 11 ], [ 3, 8, 12 ], [ 3, 8, 13 ], [ 3, 8, 15 ], [ 3, 8, 16 ], [ 3, 9, 10 ], [ 3, 9, 11 ], [ 3, 9, 12 ], [ 3, 9, 13 ], [ 3, 9, 15 ], [ 3, 9, 16 ], [ 3, 10, 11 ], [ 3, 10, 12 ], [ 3, 10, 13 ], [ 3, 10, 14 ], [ 3, 10, 15 ], [ 3, 11, 12 ], [ 3, 11, 13 ], [ 3, 11, 14 ], [ 3, 11, 16 ], [ 3, 12, 14 ], [ 3, 12, 15 ], [ 3, 12, 16 ], [ 3, 13, 14 ], [ 3, 13, 15 ], [ 3, 13, 16 ], [ 3, 14, 15 ], [ 3, 14, 16 ], [ 3, 15, 16 ], [ 4, 5, 6 ], [ 4, 5, 7 ], [ 4, 5, 8 ], [ 4, 5, 9 ], [ 4, 5, 10 ], [ 4, 5, 12 ], [ 4, 5, 13 ], [ 4, 5, 15 ], [ 4, 5, 16 ], [ 4, 6, 7 ], [ 4, 6, 8 ], [ 4, 6, 10 ], [ 4, 6, 11 ], [ 4, 6, 12 ], [ 4, 6, 13 ], [ 4, 6, 14 ], [ 4, 6, 16 ], [ 4, 7, 8 ], [ 4, 7, 9 ], [ 4, 7, 11 ], [ 4, 7, 12 ], [ 4, 7, 14 ], [ 4, 7, 15 ], [ 4, 7, 16 ], [ 4, 8, 9 ], [ 4, 8, 10 ], [ 4, 8, 11 ], [ 4, 8, 13 ], [ 4, 8, 14 ], [ 4, 8, 15 ], [ 4, 9, 10 ], [ 4, 9, 11 ], [ 4, 9, 12 ], [ 4, 9, 13 ], [ 4, 9, 14 ], [ 4, 9, 16 ], [ 4, 10, 11 ], [ 4, 10, 12 ], [ 4, 10, 14 ], [ 4, 10, 15 ], [ 4, 10, 16 ], [ 4, 11, 12 ], [ 4, 11, 13 ], [ 4, 11, 15 ], [ 4, 11, 16 ], [ 4, 12, 13 ], [ 4, 12, 14 ], [ 4, 12, 15 ], [ 4, 13, 14 ], [ 4, 13, 15 ], [ 4, 13, 16 ], [ 4, 14, 15 ], [ 4, 14, 16 ], [ 4, 15, 16 ], [ 5, 6, 9 ], [ 5, 6, 10 ], [ 5, 6, 11 ], [ 5, 6, 12 ], [ 5, 6, 13 ], [ 5, 6, 14 ], [ 5, 6, 15 ], [ 5, 6, 16 ], [ 5, 7, 9 ], [ 5, 7, 10 ], [ 5, 7, 11 ], [ 5, 7, 12 ], [ 5, 7, 13 ], [ 5, 7, 14 ], [ 5, 7, 15 ], [ 5, 7, 16 ], [ 5, 8, 9 ], [ 5, 8, 10 ], [ 5, 8, 11 ], [ 5, 8, 12 ], [ 5, 8, 13 ], [ 5, 8, 14 ], [ 5, 8, 15 ], [ 5, 8, 16 ], [ 5, 9, 10 ], [ 5, 9, 11 ], [ 5, 9, 12 ], [ 5, 9, 14 ], [ 5, 9, 15 ], [ 5, 9, 16 ], [ 5, 10, 11 ], [ 5, 10, 12 ], [ 5, 10, 13 ], [ 5, 10, 14 ], [ 5, 10, 15 ], [ 5, 11, 12 ], [ 5, 11, 13 ], [ 5, 11, 15 ], [ 5, 11, 16 ], [ 5, 12, 13 ], [ 5, 12, 14 ], [ 5, 12, 16 ], [ 5, 13, 14 ], [ 5, 13, 15 ], [ 5, 13, 16 ], [ 5, 14, 15 ], [ 5, 14, 16 ], [ 5, 15, 16 ], [ 6, 7, 9 ], [ 6, 7, 10 ], [ 6, 7, 11 ], [ 6, 7, 12 ], [ 6, 7, 13 ], [ 6, 7, 14 ], [ 6, 7, 15 ], [ 6, 7, 16 ], [ 6, 8, 9 ], [ 6, 8, 10 ], [ 6, 8, 11 ], [ 6, 8, 12 ], [ 6, 8, 13 ], [ 6, 8, 14 ], [ 6, 8, 15 ], [ 6, 8, 16 ], [ 6, 9, 10 ], [ 6, 9, 11 ], [ 6, 9, 12 ], [ 6, 9, 13 ], [ 6, 9, 14 ], [ 6, 9, 16 ], [ 6, 10, 11 ], [ 6, 10, 12 ], [ 6, 10, 13 ], [ 6, 10, 15 ], [ 6, 10, 16 ], [ 6, 11, 12 ], [ 6, 11, 13 ], [ 6, 11, 14 ], [ 6, 11, 15 ], [ 6, 12, 14 ], [ 6, 12, 15 ], [ 6, 12, 16 ], [ 6, 13, 14 ], [ 6, 13, 15 ], [ 6, 13, 16 ], [ 6, 14, 15 ], [ 6, 14, 16 ], [ 6, 15, 16 ], [ 7, 8, 9 ], [ 7, 8, 10 ], [ 7, 8, 11 ], [ 7, 8, 12 ], [ 7, 8, 13 ], [ 7, 8, 14 ], [ 7, 8, 15 ], [ 7, 8, 16 ], [ 7, 9, 10 ], [ 7, 9, 11 ], [ 7, 9, 12 ], [ 7, 9, 13 ], [ 7, 9, 14 ], [ 7, 9, 15 ], [ 7, 10, 11 ], [ 7, 10, 12 ], [ 7, 10, 14 ], [ 7, 10, 15 ], [ 7, 10, 16 ], [ 7, 11, 12 ], [ 7, 11, 13 ], [ 7, 11, 14 ], [ 7, 11, 16 ], [ 7, 12, 13 ], [ 7, 12, 15 ], [ 7, 12, 16 ], [ 7, 13, 14 ], [ 7, 13, 15 ], [ 7, 13, 16 ], [ 7, 14, 15 ], [ 7, 14, 16 ], [ 7, 15, 16 ], [ 8, 9, 10 ], [ 8, 9, 11 ], [ 8, 9, 12 ], [ 8, 9, 13 ], [ 8, 9, 15 ], [ 8, 9, 16 ], [ 8, 10, 11 ], [ 8, 10, 12 ], [ 8, 10, 13 ], [ 8, 10, 14 ], [ 8, 10, 16 ], [ 8, 11, 12 ], [ 8, 11, 14 ], [ 8, 11, 15 ], [ 8, 11, 16 ], [ 8, 12, 13 ], [ 8, 12, 14 ], [ 8, 12, 15 ], [ 8, 13, 14 ], [ 8, 13, 15 ], [ 8, 13, 16 ], [ 8, 14, 15 ], [ 8, 14, 16 ], [ 8, 15, 16 ], [ 9, 10, 13 ], [ 9, 10, 14 ], [ 9, 10, 15 ], [ 9, 10, 16 ], [ 9, 11, 13 ], [ 9, 11, 14 ], [ 9, 11, 15 ], [ 9, 11, 16 ], [ 9, 12, 13 ], [ 9, 12, 14 ], [ 9, 12, 15 ], [ 9, 12, 16 ], [ 9, 13, 14 ], [ 9, 13, 15 ], [ 9, 13, 16 ], [ 9, 14, 15 ], [ 9, 14, 16 ], [ 9, 15, 16 ], [ 10, 11, 13 ], [ 10, 11, 14 ], [ 10, 11, 15 ], [ 10, 11, 16 ], [ 10, 12, 13 ], [ 10, 12, 14 ], [ 10, 12, 15 ], [ 10, 12, 16 ], [ 10, 13, 14 ], [ 10, 13, 15 ], [ 10, 13, 16 ], [ 10, 14, 15 ], [ 10, 14, 16 ], [ 10, 15, 16 ], [ 11, 12, 13 ], [ 11, 12, 14 ], [ 11, 12, 15 ], [ 11, 12, 16 ], [ 11, 13, 14 ], [ 11, 13, 15 ], [ 11, 13, 16 ], [ 11, 14, 15 ], [ 11, 14, 16 ], [ 11, 15, 16 ], [ 12, 13, 14 ], [ 12, 13, 15 ], [ 12, 13, 16 ], [ 12, 14, 15 ], [ 12, 14, 16 ], [ 12, 15, 16 ] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := true;
expectedInformationSpace := VectorSpace(GF(4), 3);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;

/****************************************************************/
print "test 10: q=2, n=20, kerDim=0, #C=127, #rep=127, nonlinear, 0 notin C";
load "./data/Cq2n20ker0_seqgen.m";
L := Cq2n20ker0_seq;
C := QaryCode(L);


I1 := [1..4];
I2 := [3,6,8];
I3 := [1..Length(C)];

expectedOutputIsSystematic := false;
expectedOutputIsInformationSet1 := false;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := false;

OutputIsSystematic := IsSystematic(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;

/****************************************************************/
print "test 11: q=2, n=16, kerDim=4, #C=2048, #rep=128, nonlinear, 0 notin C";
load "./data/CHamq2n16ker4t_seqgen.m";
L := CHamq2n16ker4t_seq;
C := QaryCode(L);

I1 := [2,3,4,5,6,7,8,9,13,14,15];
I2 := [1..11]; 
I3 := [2,3,4,5,6,7,8,9,14,15,16];

expectedOutputAllInformationSets := [ [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 14 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 14 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 10, 13, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 12, 14 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 11, 12, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 12, 13, 14 ], [ 1, 2, 3, 4, 5, 6, 7, 9, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 14 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 11, 13, 14 ], [ 1, 2, 3, 4, 5, 6, 7, 10, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 11, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 14 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 15 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 14 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 10, 14, 15 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 14 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 15 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 11, 12, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 12, 15, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 9, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 14 ], [ 1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 15 ], [ 1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 10, 11, 15, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 10, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 6, 8, 11, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 6, 8, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 6, 9, 10, 11, 13, 16 ], [ 1, 2, 3, 4, 5, 6, 9, 10, 11, 14, 15 ], [ 1, 2, 3, 4, 5, 6, 9, 10, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 6, 9, 10, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 6, 9, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 6, 9, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 6, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 14 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 12, 14 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 12, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 10, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 14 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 11, 12, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 12, 13, 14 ], [ 1, 2, 3, 4, 5, 7, 8, 9, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 5, 7, 8, 10, 11, 12, 14 ], [ 1, 2, 3, 4, 5, 7, 8, 10, 11, 12, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 10, 11, 13, 14 ], [ 1, 2, 3, 4, 5, 7, 8, 10, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 11, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 8, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 9, 10, 11, 13, 16 ], [ 1, 2, 3, 4, 5, 7, 9, 10, 11, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 9, 10, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 7, 9, 10, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 9, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 7, 9, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 9, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 9, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 7, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 5, 7, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 10, 11, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 7, 10, 11, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 13, 14 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 13, 15 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 14, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 11, 15, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 12, 13, 14 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 12, 13, 15 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 12, 14, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 12, 15, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 8, 9, 10, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 11, 12, 13, 14 ], [ 1, 2, 3, 4, 5, 8, 9, 11, 12, 13, 15 ], [ 1, 2, 3, 4, 5, 8, 9, 11, 12, 14, 16 ], [ 1, 2, 3, 4, 5, 8, 9, 11, 12, 15, 16 ], [ 1, 2, 3, 4, 5, 8, 10, 11, 12, 13, 14 ], [ 1, 2, 3, 4, 5, 8, 10, 11, 12, 13, 15 ], [ 1, 2, 3, 4, 5, 8, 10, 11, 12, 14, 16 ], [ 1, 2, 3, 4, 5, 8, 10, 11, 12, 15, 16 ], [ 1, 2, 3, 4, 5, 8, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 8, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 9, 10, 11, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 9, 10, 11, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 9, 10, 11, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 9, 10, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 9, 10, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 9, 10, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 9, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 9, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 9, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 5, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 15 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 15 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 12, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 10, 13, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 15 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 12, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 9, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 15 ], [ 1, 2, 3, 4, 6, 7, 8, 10, 11, 12, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 10, 11, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 10, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 11, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 8, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 11, 13, 14 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 11, 13, 15 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 11, 14, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 11, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 12, 13, 14 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 12, 13, 15 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 12, 14, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 12, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 13, 14, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 10, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 11, 12, 13, 14 ], [ 1, 2, 3, 4, 6, 7, 9, 11, 12, 13, 15 ], [ 1, 2, 3, 4, 6, 7, 9, 11, 12, 14, 16 ], [ 1, 2, 3, 4, 6, 7, 9, 11, 12, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 10, 11, 12, 13, 14 ], [ 1, 2, 3, 4, 6, 7, 10, 11, 12, 13, 15 ], [ 1, 2, 3, 4, 6, 7, 10, 11, 12, 14, 16 ], [ 1, 2, 3, 4, 6, 7, 10, 11, 12, 15, 16 ], [ 1, 2, 3, 4, 6, 7, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 6, 7, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 11, 13, 16 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 11, 14, 15 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 12, 13, 16 ], [ 1, 2, 3, 4, 6, 8, 9, 10, 12, 14, 15 ], [ 1, 2, 3, 4, 6, 8, 9, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 6, 8, 9, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 6, 8, 9, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 8, 9, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 6, 8, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 6, 8, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 6, 8, 10, 11, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 8, 10, 11, 14, 15, 16 ], [ 1, 2, 3, 4, 6, 9, 10, 11, 13, 14, 16 ], [ 1, 2, 3, 4, 6, 9, 10, 11, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 9, 10, 11, 14, 15, 16 ], [ 1, 2, 3, 4, 6, 9, 10, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 6, 9, 10, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 9, 10, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 6, 9, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 6, 9, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 9, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 6, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 6, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 11, 13, 16 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 11, 14, 15 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 12, 13, 16 ], [ 1, 2, 3, 4, 7, 8, 9, 10, 12, 14, 15 ], [ 1, 2, 3, 4, 7, 8, 9, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 7, 8, 9, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 7, 8, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 4, 7, 8, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 4, 7, 9, 10, 11, 13, 14, 15 ], [ 1, 2, 3, 4, 7, 9, 10, 11, 13, 14, 16 ], [ 1, 2, 3, 4, 7, 9, 10, 11, 13, 15, 16 ], [ 1, 2, 3, 4, 7, 9, 10, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 7, 9, 10, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 7, 9, 10, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 7, 9, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 7, 9, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 7, 9, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 7, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 7, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 4, 7, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 8, 9, 10, 11, 13, 14, 15 ], [ 1, 2, 3, 4, 8, 9, 10, 11, 13, 15, 16 ], [ 1, 2, 3, 4, 8, 9, 10, 11, 14, 15, 16 ], [ 1, 2, 3, 4, 8, 9, 10, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 8, 9, 10, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 8, 9, 10, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 8, 9, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 8, 9, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 8, 9, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 4, 8, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 4, 8, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 4, 8, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 14 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 15 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 12, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 13, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 10, 14, 15 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 12, 13, 14 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 12, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 13, 14, 15 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 13, 14, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 13, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 9, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 10, 13, 14, 15 ], [ 1, 2, 3, 5, 6, 7, 8, 10, 13, 14, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 10, 13, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 10, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 12, 13, 14, 15 ], [ 1, 2, 3, 5, 6, 7, 8, 12, 13, 14, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 12, 13, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 8, 12, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 14 ], [ 1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 16 ], [ 1, 2, 3, 5, 6, 7, 9, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 10, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 7, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 8, 9, 10, 11, 12, 14 ], [ 1, 2, 3, 5, 6, 8, 9, 10, 11, 12, 15 ], [ 1, 2, 3, 5, 6, 8, 9, 10, 11, 12, 16 ], [ 1, 2, 3, 5, 6, 8, 9, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 8, 10, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 8, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 6, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 5, 6, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 5, 7, 8, 9, 10, 11, 12, 14 ], [ 1, 2, 3, 5, 7, 8, 9, 10, 11, 12, 15 ], [ 1, 2, 3, 5, 7, 8, 9, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 7, 8, 10, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 7, 8, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 7, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 5, 7, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 5, 7, 9, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 8, 9, 10, 11, 12, 13, 14 ], [ 1, 2, 3, 5, 8, 9, 10, 11, 12, 13, 15 ], [ 1, 2, 3, 5, 8, 9, 10, 11, 12, 14, 16 ], [ 1, 2, 3, 5, 8, 9, 10, 11, 12, 15, 16 ], [ 1, 2, 3, 5, 8, 9, 10, 13, 14, 15, 16 ], [ 1, 2, 3, 5, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 5, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 5, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 5, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 15 ], [ 1, 2, 3, 6, 7, 8, 9, 10, 11, 12, 16 ], [ 1, 2, 3, 6, 7, 8, 9, 13, 14, 15, 16 ], [ 1, 2, 3, 6, 7, 8, 10, 13, 14, 15, 16 ], [ 1, 2, 3, 6, 7, 8, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 6, 7, 9, 10, 11, 12, 13, 14 ], [ 1, 2, 3, 6, 7, 9, 10, 11, 12, 13, 15 ], [ 1, 2, 3, 6, 7, 9, 10, 11, 12, 14, 16 ], [ 1, 2, 3, 6, 7, 9, 10, 11, 12, 15, 16 ], [ 1, 2, 3, 6, 7, 9, 10, 13, 14, 15, 16 ], [ 1, 2, 3, 6, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 6, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 6, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 6, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 6, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 6, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 6, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 7, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 3, 7, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 3, 7, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 3, 7, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 7, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 2, 3, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 3, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 3, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 3, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 13 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 14 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 15 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 13, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 14, 15 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 13, 14, 15 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 13, 14, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 13, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 9, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 11, 13, 14 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 11, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 13, 14, 15 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 13, 14, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 13, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 10, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 11, 13, 14, 15 ], [ 1, 2, 4, 5, 6, 7, 8, 11, 13, 14, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 11, 13, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 8, 11, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 5, 6, 7, 9, 10, 11, 12, 14 ], [ 1, 2, 4, 5, 6, 7, 9, 10, 11, 12, 16 ], [ 1, 2, 4, 5, 6, 7, 9, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 10, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 7, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 8, 9, 10, 11, 12, 14 ], [ 1, 2, 4, 5, 6, 8, 9, 10, 11, 12, 15 ], [ 1, 2, 4, 5, 6, 8, 9, 10, 11, 12, 16 ], [ 1, 2, 4, 5, 6, 8, 9, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 8, 10, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 8, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 6, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 4, 5, 6, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 14 ], [ 1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 15 ], [ 1, 2, 4, 5, 7, 8, 9, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 7, 8, 10, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 7, 8, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 7, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 4, 5, 7, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 4, 5, 7, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 8, 9, 10, 11, 12, 13, 14 ], [ 1, 2, 4, 5, 8, 9, 10, 11, 12, 13, 15 ], [ 1, 2, 4, 5, 8, 9, 10, 11, 12, 14, 16 ], [ 1, 2, 4, 5, 8, 9, 10, 11, 12, 15, 16 ], [ 1, 2, 4, 5, 8, 9, 10, 13, 14, 15, 16 ], [ 1, 2, 4, 5, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 4, 5, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 4, 5, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 4, 5, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 15 ], [ 1, 2, 4, 6, 7, 8, 9, 10, 11, 12, 16 ], [ 1, 2, 4, 6, 7, 8, 9, 13, 14, 15, 16 ], [ 1, 2, 4, 6, 7, 8, 10, 13, 14, 15, 16 ], [ 1, 2, 4, 6, 7, 8, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 6, 7, 9, 10, 11, 12, 13, 14 ], [ 1, 2, 4, 6, 7, 9, 10, 11, 12, 13, 15 ], [ 1, 2, 4, 6, 7, 9, 10, 11, 12, 14, 16 ], [ 1, 2, 4, 6, 7, 9, 10, 11, 12, 15, 16 ], [ 1, 2, 4, 6, 7, 9, 10, 13, 14, 15, 16 ], [ 1, 2, 4, 6, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 4, 6, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 4, 6, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 6, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 4, 6, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 4, 6, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 4, 6, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 7, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 4, 7, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 4, 7, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 4, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 4, 7, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 4, 7, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 4, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 4, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 4, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 4, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 11, 13, 16 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 11, 14, 15 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 12, 13, 16 ], [ 1, 2, 5, 6, 7, 8, 9, 10, 12, 14, 15 ], [ 1, 2, 5, 6, 7, 8, 9, 12, 13, 14, 15 ], [ 1, 2, 5, 6, 7, 8, 9, 12, 13, 14, 16 ], [ 1, 2, 5, 6, 7, 8, 9, 12, 13, 15, 16 ], [ 1, 2, 5, 6, 7, 8, 9, 12, 14, 15, 16 ], [ 1, 2, 5, 6, 7, 8, 10, 11, 13, 14, 15 ], [ 1, 2, 5, 6, 7, 8, 10, 11, 13, 14, 16 ], [ 1, 2, 5, 6, 7, 8, 10, 11, 13, 15, 16 ], [ 1, 2, 5, 6, 7, 8, 10, 11, 14, 15, 16 ], [ 1, 2, 5, 6, 7, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 5, 6, 7, 9, 12, 13, 14, 15, 16 ], [ 1, 2, 5, 6, 7, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 5, 6, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 5, 6, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 2, 5, 6, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 5, 7, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 2, 5, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 2, 5, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 5, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 2, 5, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 2, 5, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 5, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 2, 6, 7, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 2, 6, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 2, 6, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 6, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 2, 6, 7, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 2, 6, 7, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 2, 6, 7, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 12, 14 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 12, 15 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 12, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 13, 14 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 11, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 13, 14, 15 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 13, 14, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 13, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 10, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 12, 13, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 12, 14, 15 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 13, 14, 15 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 13, 14, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 13, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 11, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 12, 13, 14, 15 ], [ 1, 3, 4, 5, 6, 7, 8, 12, 13, 14, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 12, 13, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 8, 12, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14 ], [ 1, 3, 4, 5, 6, 7, 9, 10, 11, 12, 16 ], [ 1, 3, 4, 5, 6, 7, 10, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 11, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 8, 9, 10, 11, 12, 14 ], [ 1, 3, 4, 5, 6, 8, 9, 10, 11, 12, 15 ], [ 1, 3, 4, 5, 6, 8, 9, 10, 11, 12, 16 ], [ 1, 3, 4, 5, 6, 8, 10, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 8, 11, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 8, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 6, 9, 10, 11, 12, 13, 16 ], [ 1, 3, 4, 5, 6, 9, 10, 11, 12, 14, 15 ], [ 1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 14 ], [ 1, 3, 4, 5, 7, 8, 9, 10, 11, 12, 15 ], [ 1, 3, 4, 5, 7, 8, 10, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 7, 8, 11, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 7, 8, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 7, 9, 10, 11, 12, 13, 16 ], [ 1, 3, 4, 5, 7, 9, 10, 11, 12, 14, 15 ], [ 1, 3, 4, 5, 7, 10, 11, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14 ], [ 1, 3, 4, 5, 8, 9, 10, 11, 12, 13, 15 ], [ 1, 3, 4, 5, 8, 9, 10, 11, 12, 14, 16 ], [ 1, 3, 4, 5, 8, 9, 10, 11, 12, 15, 16 ], [ 1, 3, 4, 5, 8, 11, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 3, 4, 5, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 3, 4, 5, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 3, 4, 5, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 1, 3, 4, 6, 7, 8, 9, 10, 11, 12, 15 ], [ 1, 3, 4, 6, 7, 8, 9, 10, 11, 12, 16 ], [ 1, 3, 4, 6, 7, 8, 10, 13, 14, 15, 16 ], [ 1, 3, 4, 6, 7, 8, 11, 13, 14, 15, 16 ], [ 1, 3, 4, 6, 7, 8, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 6, 7, 9, 10, 11, 12, 13, 14 ], [ 1, 3, 4, 6, 7, 9, 10, 11, 12, 13, 15 ], [ 1, 3, 4, 6, 7, 9, 10, 11, 12, 14, 16 ], [ 1, 3, 4, 6, 7, 9, 10, 11, 12, 15, 16 ], [ 1, 3, 4, 6, 7, 11, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 6, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 3, 4, 6, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 3, 4, 6, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 3, 4, 6, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 3, 4, 6, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 3, 4, 6, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 3, 4, 6, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 7, 8, 9, 10, 11, 12, 13, 16 ], [ 1, 3, 4, 7, 8, 9, 10, 11, 12, 14, 15 ], [ 1, 3, 4, 7, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 3, 4, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 3, 4, 7, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 3, 4, 7, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 3, 4, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 3, 4, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 3, 4, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 3, 4, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 3, 5, 6, 7, 8, 9, 12, 13, 14, 15 ], [ 1, 3, 5, 6, 7, 8, 9, 12, 13, 14, 16 ], [ 1, 3, 5, 6, 7, 8, 9, 12, 13, 15, 16 ], [ 1, 3, 5, 6, 7, 8, 9, 12, 14, 15, 16 ], [ 1, 3, 5, 6, 7, 8, 10, 11, 13, 14, 15 ], [ 1, 3, 5, 6, 7, 8, 10, 11, 13, 14, 16 ], [ 1, 3, 5, 6, 7, 8, 10, 11, 13, 15, 16 ], [ 1, 3, 5, 6, 7, 8, 10, 11, 14, 15, 16 ], [ 1, 3, 5, 6, 7, 9, 12, 13, 14, 15, 16 ], [ 1, 3, 5, 6, 7, 10, 11, 13, 14, 15, 16 ], [ 1, 3, 5, 6, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 3, 5, 6, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 3, 5, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 3, 5, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 3, 6, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 1, 3, 6, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 13, 14, 15 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 13, 14, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 13, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 10, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 11, 13, 14, 15 ], [ 1, 4, 5, 6, 7, 8, 9, 11, 13, 14, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 11, 13, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 9, 11, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14 ], [ 1, 4, 5, 6, 7, 8, 10, 11, 12, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 10, 12, 13, 14, 15 ], [ 1, 4, 5, 6, 7, 8, 10, 12, 13, 14, 16 ], [ 1, 4, 5, 6, 7, 8, 10, 12, 13, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 10, 12, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 11, 12, 13, 14, 15 ], [ 1, 4, 5, 6, 7, 8, 11, 12, 13, 14, 16 ], [ 1, 4, 5, 6, 7, 8, 11, 12, 13, 15, 16 ], [ 1, 4, 5, 6, 7, 8, 11, 12, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14 ], [ 1, 4, 5, 6, 7, 9, 10, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 9, 11, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 10, 12, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 7, 11, 12, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 8, 9, 10, 11, 12, 15, 16 ], [ 1, 4, 5, 6, 8, 9, 10, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 8, 9, 11, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 8, 10, 12, 13, 14, 15, 16 ], [ 1, 4, 5, 6, 8, 11, 12, 13, 14, 15, 16 ], [ 1, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14 ], [ 1, 4, 5, 7, 8, 9, 10, 13, 14, 15, 16 ], [ 1, 4, 5, 7, 8, 9, 11, 13, 14, 15, 16 ], [ 1, 4, 5, 7, 8, 10, 12, 13, 14, 15, 16 ], [ 1, 4, 5, 7, 8, 11, 12, 13, 14, 15, 16 ], [ 1, 4, 5, 7, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 4, 5, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 4, 5, 7, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 4, 5, 7, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 4, 6, 7, 8, 9, 10, 11, 12, 15, 16 ], [ 1, 4, 6, 7, 8, 9, 10, 13, 14, 15, 16 ], [ 1, 4, 6, 7, 8, 9, 11, 13, 14, 15, 16 ], [ 1, 4, 6, 7, 8, 10, 12, 13, 14, 15, 16 ], [ 1, 4, 6, 7, 8, 11, 12, 13, 14, 15, 16 ], [ 1, 4, 6, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 4, 6, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 4, 6, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 4, 6, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15 ], [ 1, 5, 6, 7, 8, 9, 10, 11, 13, 14, 16 ], [ 1, 5, 6, 7, 8, 9, 10, 11, 13, 15, 16 ], [ 1, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16 ], [ 1, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15 ], [ 1, 5, 6, 7, 8, 9, 10, 12, 13, 14, 16 ], [ 1, 5, 6, 7, 8, 9, 10, 12, 13, 15, 16 ], [ 1, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16 ], [ 1, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15 ], [ 1, 5, 6, 7, 8, 10, 11, 12, 13, 14, 16 ], [ 1, 5, 6, 7, 8, 10, 11, 12, 13, 15, 16 ], [ 1, 5, 6, 7, 8, 10, 11, 12, 14, 15, 16 ], [ 1, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 1, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 5, 6, 7, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 5, 6, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 1, 5, 6, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 5, 6, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 1, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 5, 7, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 1, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 1, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 1, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 1, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 14 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 12, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 13, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 9, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 11, 12, 13, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 11, 12, 14, 15 ], [ 2, 3, 4, 5, 6, 7, 8, 11, 13, 14, 15 ], [ 2, 3, 4, 5, 6, 7, 8, 11, 13, 14, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 11, 13, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 11, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 12, 13, 14, 15 ], [ 2, 3, 4, 5, 6, 7, 8, 12, 13, 14, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 12, 13, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 8, 12, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14 ], [ 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 16 ], [ 2, 3, 4, 5, 6, 7, 9, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 11, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 14 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 15 ], [ 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 16 ], [ 2, 3, 4, 5, 6, 8, 9, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 8, 11, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 8, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 16 ], [ 2, 3, 4, 5, 6, 9, 10, 11, 12, 14, 15 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 14 ], [ 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 15 ], [ 2, 3, 4, 5, 7, 8, 9, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 7, 8, 11, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 7, 8, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 7, 9, 10, 11, 12, 13, 16 ], [ 2, 3, 4, 5, 7, 9, 10, 11, 12, 14, 15 ], [ 2, 3, 4, 5, 7, 9, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 14 ], [ 2, 3, 4, 5, 8, 9, 10, 11, 12, 13, 15 ], [ 2, 3, 4, 5, 8, 9, 10, 11, 12, 14, 16 ], [ 2, 3, 4, 5, 8, 9, 10, 11, 12, 15, 16 ], [ 2, 3, 4, 5, 8, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15 ], [ 2, 3, 4, 5, 9, 10, 11, 12, 13, 14, 16 ], [ 2, 3, 4, 5, 9, 10, 11, 12, 14, 15, 16 ], [ 2, 3, 4, 5, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 15 ], [ 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 16 ], [ 2, 3, 4, 6, 7, 8, 9, 13, 14, 15, 16 ], [ 2, 3, 4, 6, 7, 8, 11, 13, 14, 15, 16 ], [ 2, 3, 4, 6, 7, 8, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 6, 7, 9, 10, 11, 12, 13, 14 ], [ 2, 3, 4, 6, 7, 9, 10, 11, 12, 13, 15 ], [ 2, 3, 4, 6, 7, 9, 10, 11, 12, 14, 16 ], [ 2, 3, 4, 6, 7, 9, 10, 11, 12, 15, 16 ], [ 2, 3, 4, 6, 7, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 6, 8, 9, 10, 11, 12, 13, 16 ], [ 2, 3, 4, 6, 8, 9, 10, 11, 12, 14, 15 ], [ 2, 3, 4, 6, 8, 9, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 6, 9, 10, 11, 12, 13, 14, 16 ], [ 2, 3, 4, 6, 9, 10, 11, 12, 13, 15, 16 ], [ 2, 3, 4, 6, 9, 10, 11, 12, 14, 15, 16 ], [ 2, 3, 4, 6, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 7, 8, 9, 10, 11, 12, 13, 16 ], [ 2, 3, 4, 7, 8, 9, 10, 11, 12, 14, 15 ], [ 2, 3, 4, 7, 9, 10, 11, 12, 13, 14, 15 ], [ 2, 3, 4, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 2, 3, 4, 7, 9, 10, 11, 12, 13, 15, 16 ], [ 2, 3, 4, 7, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 4, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 2, 3, 4, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 2, 3, 4, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 2, 3, 4, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 12, 13, 14 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 12, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 13, 14, 15 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 13, 14, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 13, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 10, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 12, 13, 14 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 12, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 13, 14, 15 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 13, 14, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 13, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 9, 11, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 10, 12, 13, 14, 15 ], [ 2, 3, 5, 6, 7, 8, 10, 12, 13, 14, 16 ], [ 2, 3, 5, 6, 7, 8, 10, 12, 13, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 10, 12, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 11, 12, 13, 14, 15 ], [ 2, 3, 5, 6, 7, 8, 11, 12, 13, 14, 16 ], [ 2, 3, 5, 6, 7, 8, 11, 12, 13, 15, 16 ], [ 2, 3, 5, 6, 7, 8, 11, 12, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14 ], [ 2, 3, 5, 6, 7, 9, 10, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 9, 11, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 10, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 7, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 8, 9, 10, 11, 12, 15, 16 ], [ 2, 3, 5, 6, 8, 9, 10, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 8, 9, 11, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 8, 10, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 6, 8, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 7, 8, 9, 10, 11, 12, 13, 14 ], [ 2, 3, 5, 7, 8, 9, 10, 13, 14, 15, 16 ], [ 2, 3, 5, 7, 8, 9, 11, 13, 14, 15, 16 ], [ 2, 3, 5, 7, 8, 10, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 7, 8, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 7, 9, 10, 11, 12, 13, 14, 15 ], [ 2, 3, 5, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 2, 3, 5, 7, 9, 10, 12, 13, 14, 15, 16 ], [ 2, 3, 5, 7, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 6, 7, 8, 9, 10, 11, 12, 15, 16 ], [ 2, 3, 6, 7, 8, 9, 10, 13, 14, 15, 16 ], [ 2, 3, 6, 7, 8, 9, 11, 13, 14, 15, 16 ], [ 2, 3, 6, 7, 8, 10, 12, 13, 14, 15, 16 ], [ 2, 3, 6, 7, 8, 11, 12, 13, 14, 15, 16 ], [ 2, 3, 6, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 2, 3, 6, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 2, 3, 6, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 2, 3, 6, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15 ], [ 2, 4, 5, 6, 7, 8, 9, 12, 13, 14, 16 ], [ 2, 4, 5, 6, 7, 8, 9, 12, 13, 15, 16 ], [ 2, 4, 5, 6, 7, 8, 9, 12, 14, 15, 16 ], [ 2, 4, 5, 6, 7, 8, 10, 11, 13, 14, 15 ], [ 2, 4, 5, 6, 7, 8, 10, 11, 13, 14, 16 ], [ 2, 4, 5, 6, 7, 8, 10, 11, 13, 15, 16 ], [ 2, 4, 5, 6, 7, 8, 10, 11, 14, 15, 16 ], [ 2, 4, 5, 6, 7, 9, 12, 13, 14, 15, 16 ], [ 2, 4, 5, 6, 7, 10, 11, 13, 14, 15, 16 ], [ 2, 4, 5, 6, 8, 9, 12, 13, 14, 15, 16 ], [ 2, 4, 5, 6, 8, 10, 11, 13, 14, 15, 16 ], [ 2, 4, 5, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 2, 4, 5, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 2, 4, 6, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 2, 4, 6, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 2, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15 ], [ 2, 5, 6, 7, 8, 9, 10, 11, 13, 14, 16 ], [ 2, 5, 6, 7, 8, 9, 10, 11, 13, 15, 16 ], [ 2, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16 ], [ 2, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15 ], [ 2, 5, 6, 7, 8, 9, 10, 12, 13, 14, 16 ], [ 2, 5, 6, 7, 8, 9, 10, 12, 13, 15, 16 ], [ 2, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16 ], [ 2, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15 ], [ 2, 5, 6, 7, 8, 9, 11, 12, 13, 14, 16 ], [ 2, 5, 6, 7, 8, 9, 11, 12, 13, 15, 16 ], [ 2, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16 ], [ 2, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 2, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16 ], [ 2, 5, 6, 7, 9, 10, 12, 13, 14, 15, 16 ], [ 2, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 5, 6, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 2, 5, 6, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 2, 5, 6, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 2, 5, 6, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 2, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 2, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 2, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 2, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 2, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 2, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 2, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 16 ], [ 3, 4, 5, 6, 7, 8, 9, 11, 12, 14, 15 ], [ 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15 ], [ 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 16 ], [ 3, 4, 5, 6, 7, 8, 9, 12, 13, 15, 16 ], [ 3, 4, 5, 6, 7, 8, 9, 12, 14, 15, 16 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 16 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 12, 14, 15 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 13, 14, 15 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 13, 14, 16 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 13, 15, 16 ], [ 3, 4, 5, 6, 7, 8, 10, 11, 14, 15, 16 ], [ 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 16 ], [ 3, 4, 5, 6, 7, 9, 12, 13, 14, 15, 16 ], [ 3, 4, 5, 6, 7, 10, 11, 13, 14, 15, 16 ], [ 3, 4, 5, 6, 8, 9, 10, 11, 12, 14, 15 ], [ 3, 4, 5, 6, 8, 9, 12, 13, 14, 15, 16 ], [ 3, 4, 5, 6, 8, 10, 11, 13, 14, 15, 16 ], [ 3, 4, 5, 7, 8, 9, 10, 11, 12, 14, 15 ], [ 3, 4, 5, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 3, 4, 5, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 3, 4, 5, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 3, 4, 5, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 3, 4, 5, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 4, 5, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 16 ], [ 3, 4, 6, 7, 8, 9, 12, 13, 14, 15, 16 ], [ 3, 4, 6, 7, 8, 10, 11, 13, 14, 15, 16 ], [ 3, 4, 6, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 3, 4, 6, 7, 9, 10, 11, 12, 13, 15, 16 ], [ 3, 4, 6, 7, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 4, 6, 7, 10, 11, 12, 13, 14, 15, 16 ], [ 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15 ], [ 3, 5, 6, 7, 8, 9, 10, 12, 13, 14, 16 ], [ 3, 5, 6, 7, 8, 9, 10, 12, 13, 15, 16 ], [ 3, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16 ], [ 3, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15 ], [ 3, 5, 6, 7, 8, 9, 11, 12, 13, 14, 16 ], [ 3, 5, 6, 7, 8, 9, 11, 12, 13, 15, 16 ], [ 3, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16 ], [ 3, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15 ], [ 3, 5, 6, 7, 8, 10, 11, 12, 13, 14, 16 ], [ 3, 5, 6, 7, 8, 10, 11, 12, 13, 15, 16 ], [ 3, 5, 6, 7, 8, 10, 11, 12, 14, 15, 16 ], [ 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 3, 5, 6, 7, 9, 10, 12, 13, 14, 15, 16 ], [ 3, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16 ], [ 3, 5, 6, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 3, 5, 6, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 3, 5, 6, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 3, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 3, 5, 7, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 3, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 5, 7, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 3, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 3, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16 ], [ 3, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 3, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15 ], [ 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 16 ], [ 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 16 ], [ 4, 5, 6, 7, 8, 9, 10, 11, 14, 15, 16 ], [ 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15 ], [ 4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 16 ], [ 4, 5, 6, 7, 8, 9, 11, 12, 13, 15, 16 ], [ 4, 5, 6, 7, 8, 9, 11, 12, 14, 15, 16 ], [ 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15 ], [ 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 16 ], [ 4, 5, 6, 7, 8, 10, 11, 12, 13, 15, 16 ], [ 4, 5, 6, 7, 8, 10, 11, 12, 14, 15, 16 ], [ 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16 ], [ 4, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16 ], [ 4, 5, 6, 7, 9, 11, 12, 13, 14, 15, 16 ], [ 4, 5, 6, 7, 10, 11, 12, 13, 14, 15, 16 ], [ 4, 5, 6, 8, 9, 10, 11, 12, 14, 15, 16 ], [ 4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 4, 5, 6, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 4, 5, 6, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15 ], [ 4, 5, 7, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 4, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 4, 5, 7, 8, 10, 11, 12, 13, 14, 15, 16 ], [ 4, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16 ], [ 4, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16 ], [ 4, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16 ], [ 4, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16 ] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := true;
expectedInformationSpace := VectorSpace(GF(2), 11);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;

/****************************************************************/
print "test 12: q=2, n=22, kerDim=0, #C=10, #rep=10, nonlinear"; 
V := VectorSpace(GF(2), 22);
C := QaryCode([
    V![0,1,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],
    V![1,0,0,1,1,0,0,0,0,1,1,0,0,1,1,0,1,1,1,1,0,0],
    V![1,0,0,0,0,0,1,1,1,0,1,0,0,1,0,1,1,1,1,1,0,0],
    V![1,0,1,0,1,0,0,1,0,0,0,1,1,0,0,0,0,1,0,1,0,0],
    V![1,0,0,0,1,0,0,1,0,0,1,1,0,0,1,1,0,1,1,1,0,0],
    V![1,0,0,0,1,1,1,0,0,1,1,0,0,1,1,0,0,1,0,0,0,0],
    V![1,0,0,0,0,1,0,0,1,1,0,0,0,0,0,0,1,1,1,1,0,0],
    V![1,1,1,0,0,1,1,0,0,1,1,0,0,1,1,1,0,1,1,1,0,0],
    V![0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    V![1,1,0,1,1,1,1,0,0,0,0,0,0,1,1,0,1,0,1,1,0,0]]);


I1 := [1..5];
I2 := [1,3,5,7,9];
I3 := [1..Length(C)];

expectedOutputIsSystematic := false;
expectedOutputIsInformationSet1 := false;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := false;

OutputIsSystematic := IsSystematic(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;
   
/****************************************************************/
print "test 13: q=2, n=10, kerDim=10, #C=1024, #rep=0, linear"; 
C := QaryCode(CyclicCode(VectorSpace(GF(2), 10)![1,0,1,1,0,0,0,0,0,0]));

I1 := [1..10];
I2 := [1,3,5,7,9];
I3 := [2,4,6,8,10];

expectedOutputAllInformationSets := [ [1..10] ];

expectedOutputIsSystematic := true;
expectedOutputIsInformationSet1 := true;
expectedOutputIsInformationSet2 := false;
expectedOutputIsInformationSet3 := false;
expectedInformationSpace := VectorSpace(GF(2), 10);

OutputAllInformationSets := AllInformationSets(C);
OutputIsSystematic, OutputI, OutputTup := IsSystematic(C);
OutputInformationSet, OutputInformationSetTup := InformationSet(C);
OutputIsInformationSet1 := IsInformationSet(C, I1);
OutputIsInformationSet2 := IsInformationSet(C, I2);
OutputIsInformationSet3 := IsInformationSet(C, I3);

assert expectedOutputIsSystematic eq OutputIsSystematic;
assert IsInformationSet(C, OutputI);
assert IsInformationSet(C, OutputTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputTup[1]);
assert OutputI eq Sort(OutputTup[1] cat OutputTup[2]);   
assert IsInformationSet(C, OutputInformationSet);
assert IsInformationSet(C, OutputInformationSetTup);
assert IsInformationSet(QaryCode(C`Kernel), OutputInformationSetTup[1]);
assert OutputInformationSet eq Sort(OutputTup[1] cat OutputTup[2]);
assert #expectedOutputAllInformationSets eq #OutputAllInformationSets;
assert Set(expectedOutputAllInformationSets) eq Set(OutputAllInformationSets);
assert expectedInformationSpace eq InformationSpace(C);
assert expectedOutputIsInformationSet1 eq OutputIsInformationSet1;
assert expectedOutputIsInformationSet2 eq OutputIsInformationSet2;
assert expectedOutputIsInformationSet3 eq OutputIsInformationSet3;



