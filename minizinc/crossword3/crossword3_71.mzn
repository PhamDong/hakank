%
% Crossword problem 'puzzle22, 13 x 13' in MiniZinc.
%
% (generated Sat Sep 24 08:54:24 2011 by `make_crossword.pl 71 1` ).
%
% This crossword model was 
%
% This is problem 'puzzle22, 13 x 13' from the Gecode crossword example:
%   http://www.gecode.org/doc-latest/reference/crossword_8cpp_source.html
% 
% 
% This MiniZinc model was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also my MiniZinc page: http://www.hakank.org/minizinc
%

%
% Gecode problem to solve (71): puzzle22, 13 x 13
% 
%   _ _ _ _ * _ _ _ * _ _ _ _
%   _ _ _ _ * _ _ _ * _ _ _ _
%   _ _ _ _ * _ _ _ * _ _ _ _
%   _ _ _ _ _ _ _ _ _ _ _ _ _
%   * * * _ _ _ * _ _ _ * * *
%   _ _ _ _ _ * * * _ _ _ _ _
%   _ _ _ _ * * * * * _ _ _ _
%   _ _ _ _ _ * * * _ _ _ _ _
%   * * * _ _ _ * _ _ _ * * *
%   _ _ _ _ _ _ _ _ _ _ _ _ _
%   _ _ _ _ * _ _ _ * _ _ _ _
%   _ _ _ _ * _ _ _ * _ _ _ _
%   _ _ _ _ * _ _ _ * _ _ _ _

include "crossword3.mzn"; 

problem_name = "puzzle22, 13 x 13";


% number of letters to assign
N = 132;


% distinct words
require_distinct_words = 1;

constraint
  table([L[1], L[2], L[3], L[4]], words4) 
/\ table([L[5], L[6], L[7]], words3) 
/\ table([L[8], L[9], L[10], L[11]], words4) 
/\ table([L[12], L[13], L[14], L[15]], words4) 
/\ table([L[16], L[17], L[18]], words3) 
/\ table([L[19], L[20], L[21], L[22]], words4) 
/\ table([L[23], L[24], L[25], L[26]], words4) 
/\ table([L[27], L[28], L[29]], words3) 
/\ table([L[30], L[31], L[32], L[33]], words4) 
/\ table([L[34], L[35], L[36], L[37], L[38], L[39], L[40], L[41], L[42], L[43], L[44], L[45], L[46]], words13) 
/\ table([L[47], L[48], L[49]], words3) 
/\ table([L[50], L[51], L[52]], words3) 
/\ table([L[53], L[54], L[55], L[56], L[57]], words5) 
/\ table([L[58], L[59], L[60], L[61], L[62]], words5) 
/\ table([L[63], L[64], L[65], L[66]], words4) 
/\ table([L[67], L[68], L[69], L[70]], words4) 
/\ table([L[71], L[72], L[73], L[74], L[75]], words5) 
/\ table([L[76], L[77], L[78], L[79], L[80]], words5) 
/\ table([L[81], L[82], L[83]], words3) 
/\ table([L[84], L[85], L[86]], words3) 
/\ table([L[87], L[88], L[89], L[90], L[91], L[92], L[93], L[94], L[95], L[96], L[97], L[98], L[99]], words13) 
/\ table([L[100], L[101], L[102], L[103]], words4) 
/\ table([L[104], L[105], L[106]], words3) 
/\ table([L[107], L[108], L[109], L[110]], words4) 
/\ table([L[111], L[112], L[113], L[114]], words4) 
/\ table([L[115], L[116], L[117]], words3) 
/\ table([L[118], L[119], L[120], L[121]], words4) 
/\ table([L[122], L[123], L[124], L[125]], words4) 
/\ table([L[126], L[127], L[128]], words3) 
/\ table([L[129], L[130], L[131], L[132]], words4) 
/\ table([L[1], L[12], L[23], L[34]], words4) 
/\ table([L[53], L[63], L[71]], words3) 
/\ table([L[87], L[100], L[111], L[122]], words4) 
/\ table([L[2], L[13], L[24], L[35]], words4) 
/\ table([L[54], L[64], L[72]], words3) 
/\ table([L[88], L[101], L[112], L[123]], words4) 
/\ table([L[3], L[14], L[25], L[36]], words4) 
/\ table([L[55], L[65], L[73]], words3) 
/\ table([L[89], L[102], L[113], L[124]], words4) 
/\ table([L[4], L[15], L[26], L[37], L[47], L[56], L[66], L[74], L[81], L[90], L[103], L[114], L[125]], words13) 
/\ table([L[38], L[48], L[57]], words3) 
/\ table([L[75], L[82], L[91]], words3) 
/\ table([L[5], L[16], L[27], L[39], L[49]], words5) 
/\ table([L[83], L[92], L[104], L[115], L[126]], words5) 
/\ table([L[6], L[17], L[28], L[40]], words4) 
/\ table([L[93], L[105], L[116], L[127]], words4) 
/\ table([L[7], L[18], L[29], L[41], L[50]], words5) 
/\ table([L[84], L[94], L[106], L[117], L[128]], words5) 
/\ table([L[42], L[51], L[58]], words3) 
/\ table([L[76], L[85], L[95]], words3) 
/\ table([L[8], L[19], L[30], L[43], L[52], L[59], L[67], L[77], L[86], L[96], L[107], L[118], L[129]], words13) 
/\ table([L[9], L[20], L[31], L[44]], words4) 
/\ table([L[60], L[68], L[78]], words3) 
/\ table([L[97], L[108], L[119], L[130]], words4) 
/\ table([L[10], L[21], L[32], L[45]], words4) 
/\ table([L[61], L[69], L[79]], words3) 
/\ table([L[98], L[109], L[120], L[131]], words4) 
/\ table([L[11], L[22], L[33], L[46]], words4) 
/\ table([L[62], L[70], L[80]], words3) 
/\ table([L[99], L[110], L[121], L[132]], words4)
;

% The segments (words)
% (0 for fill outs)
int: max_length = 13;
int: num_segments = 60;
array[1..num_segments, 1..max_length] of int: segments = array2d(1..num_segments, 1..max_length, 
[
1,2,3,4,0,0,0,0,0,0,0,0,0,
5,6,7,0,0,0,0,0,0,0,0,0,0,
8,9,10,11,0,0,0,0,0,0,0,0,0,
12,13,14,15,0,0,0,0,0,0,0,0,0,
16,17,18,0,0,0,0,0,0,0,0,0,0,
19,20,21,22,0,0,0,0,0,0,0,0,0,
23,24,25,26,0,0,0,0,0,0,0,0,0,
27,28,29,0,0,0,0,0,0,0,0,0,0,
30,31,32,33,0,0,0,0,0,0,0,0,0,
34,35,36,37,38,39,40,41,42,43,44,45,46,
47,48,49,0,0,0,0,0,0,0,0,0,0,
50,51,52,0,0,0,0,0,0,0,0,0,0,
53,54,55,56,57,0,0,0,0,0,0,0,0,
58,59,60,61,62,0,0,0,0,0,0,0,0,
63,64,65,66,0,0,0,0,0,0,0,0,0,
67,68,69,70,0,0,0,0,0,0,0,0,0,
71,72,73,74,75,0,0,0,0,0,0,0,0,
76,77,78,79,80,0,0,0,0,0,0,0,0,
81,82,83,0,0,0,0,0,0,0,0,0,0,
84,85,86,0,0,0,0,0,0,0,0,0,0,
87,88,89,90,91,92,93,94,95,96,97,98,99,
100,101,102,103,0,0,0,0,0,0,0,0,0,
104,105,106,0,0,0,0,0,0,0,0,0,0,
107,108,109,110,0,0,0,0,0,0,0,0,0,
111,112,113,114,0,0,0,0,0,0,0,0,0,
115,116,117,0,0,0,0,0,0,0,0,0,0,
118,119,120,121,0,0,0,0,0,0,0,0,0,
122,123,124,125,0,0,0,0,0,0,0,0,0,
126,127,128,0,0,0,0,0,0,0,0,0,0,
129,130,131,132,0,0,0,0,0,0,0,0,0,
1,12,23,34,0,0,0,0,0,0,0,0,0,
53,63,71,0,0,0,0,0,0,0,0,0,0,
87,100,111,122,0,0,0,0,0,0,0,0,0,
2,13,24,35,0,0,0,0,0,0,0,0,0,
54,64,72,0,0,0,0,0,0,0,0,0,0,
88,101,112,123,0,0,0,0,0,0,0,0,0,
3,14,25,36,0,0,0,0,0,0,0,0,0,
55,65,73,0,0,0,0,0,0,0,0,0,0,
89,102,113,124,0,0,0,0,0,0,0,0,0,
4,15,26,37,47,56,66,74,81,90,103,114,125,
38,48,57,0,0,0,0,0,0,0,0,0,0,
75,82,91,0,0,0,0,0,0,0,0,0,0,
5,16,27,39,49,0,0,0,0,0,0,0,0,
83,92,104,115,126,0,0,0,0,0,0,0,0,
6,17,28,40,0,0,0,0,0,0,0,0,0,
93,105,116,127,0,0,0,0,0,0,0,0,0,
7,18,29,41,50,0,0,0,0,0,0,0,0,
84,94,106,117,128,0,0,0,0,0,0,0,0,
42,51,58,0,0,0,0,0,0,0,0,0,0,
76,85,95,0,0,0,0,0,0,0,0,0,0,
8,19,30,43,52,59,67,77,86,96,107,118,129,
9,20,31,44,0,0,0,0,0,0,0,0,0,
60,68,78,0,0,0,0,0,0,0,0,0,0,
97,108,119,130,0,0,0,0,0,0,0,0,0,
10,21,32,45,0,0,0,0,0,0,0,0,0,
61,69,79,0,0,0,0,0,0,0,0,0,0,
98,109,120,131,0,0,0,0,0,0,0,0,0,
11,22,33,46,0,0,0,0,0,0,0,0,0,
62,70,80,0,0,0,0,0,0,0,0,0,0,
99,110,121,132,0,0,0,0,0,0,0,0,0,

]);

% Problem where each cell is assigned a unique index.
% (0 means blocked cell)
int: rows = 13;
int: cols = 13;
array[1..rows, 1..cols] of int: problem = array2d(1..rows, 1..cols,
[
1, 2, 3, 4, 0, 5, 6, 7, 0, 8, 9, 10, 11, 
12, 13, 14, 15, 0, 16, 17, 18, 0, 19, 20, 21, 22, 
23, 24, 25, 26, 0, 27, 28, 29, 0, 30, 31, 32, 33, 
34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 
0, 0, 0, 47, 48, 49, 0, 50, 51, 52, 0, 0, 0, 
53, 54, 55, 56, 57, 0, 0, 0, 58, 59, 60, 61, 62, 
63, 64, 65, 66, 0, 0, 0, 0, 0, 67, 68, 69, 70, 
71, 72, 73, 74, 75, 0, 0, 0, 76, 77, 78, 79, 80, 
0, 0, 0, 81, 82, 83, 0, 84, 85, 86, 0, 0, 0, 
87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 
100, 101, 102, 103, 0, 104, 105, 106, 0, 107, 108, 109, 110, 
111, 112, 113, 114, 0, 115, 116, 117, 0, 118, 119, 120, 121, 
122, 123, 124, 125, 0, 126, 127, 128, 0, 129, 130, 131, 132, 

]);


