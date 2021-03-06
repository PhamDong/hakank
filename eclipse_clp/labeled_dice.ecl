/*

  Labeled dice in ECLiPSe.

  From Jim Orlin "Colored letters, labeled dice: a logic puzzle"
  http://jimorlin.wordpress.com/2009/02/17/colored-letters-labeled-dice-a-logic-puzzle/
  """
  My daughter Jenn bough a puzzle book, and showed me a cute puzzle.  There 
  are 13 words as follows:  BUOY, CAVE, CELT, FLUB, FORK, HEMP, JUDY, 
  JUNK, LIMN, QUIP, SWAG, VISA, WISH.

  There are 24 different letters that appear in the 13 words.  The question 
  is:  can one assign the 24 letters to 4 different cubes so that the 
  four letters of each word appears on different cubes.  (There is one 
  letter from each word on each cube.)  It might be fun for you to try 
  it.  I'll give a small hint at the end of this post. The puzzle was 
  created by Humphrey Dudley.
  """

  Compare with the following models: 
  * ECLiPSe:  http://www.hakank.org/eclipse/building_blocks.co
    (Building Blocks puzzle)
  * Comet  : http://www.hakank.org/comet/labeled_dice.co


  Note: This is a somewhat generalized model for solving both 
        Building blocks and Labeled Dice problem. 


  Model created by Hakan Kjellerstrand, hakank@bonetmail.com
  See also my ECLiPSe page: http://www.hakank.org/eclipse/

*/

:-lib(ic).
:-lib(ic_global).
:-lib(ic_search).
:-lib(listut).


go :-
        setval(count,0), % set solution number
        findall(_, solve(labeling_dice, _Res1, _Backtracks1), _L1),
        getval(count, Count1),
        printf("It was %d solutions\n", [Count1]),

        setval(count,0),
        findall(_, solve(building_blocks, _Res2, _Backtracks2), _L2),
        getval(count, Count1),
        printf("It was %d solutions\n", [Count1]).



solve(Problem,Res,Backtracks) :-
        printf("\nProblem %w\n", [Problem]),


        problem(Problem, NumCubes, NumSides, Letters, Words),

        % create the integer array
        (foreach(_L, Letters),
         count(I,1,_), 
         fromto(LettersInt,[I|In],In,[]) do
             true
        ),

        length(Words, NumWords),

        % Convert the letters to integers so we can use ic
        length(WordsIC, NumWords),
        convert_words(Words,WordsIC,Letters,LettersInt),
  
        CubeLen is NumCubes * NumSides,
        length(Cube,CubeLen),
        Cube :: 1..NumCubes,

        % each letters in a word must be on a different die
        ( for(I,1,NumWords), param(WordsIC,Cube) do
              nth1(I,WordsIC,Word),
              ( foreach(W,Word), 
                foreach(D,ThisDie),
                param(Cube) do
                    nth1(W,Cube,D)
              ),
              ic_global:alldifferent(ThisDie)
        ),

        % there must be exactly NumSides (6) letters of each die
        ( for(I,1,NumCubes), 
          param(Cube,CubeLen,NumSides) do
              ( for(J,1,CubeLen), 
                foreach(Reif,Sum),
                param(I,Cube) do
                    Reif = (nth1(J,Cube) #= I)
              ),
              sum(Sum) #= NumSides
        ),

        % simple symmetry breaking: place first letter on cube 1
        nth1(1,Cube,1),

        %
        % search
        %
        term_variables(Cube, Vars),
        search(Vars,0,occurrence,indomain_min,complete,[backtrack(Backtracks)]),
        (for(I,1,CubeLen), foreach(R, Res), param(Cube,Letters) do 
             double_index(Cube,Letters, I,D,L),
             R = [L,D]
        ),

        writeln(cube:Cube),

        % print this solution
        getval(count,Count),
        printf("\nSolution: %w\n",[Count]),
        printf("Letters placed: %w\n", [Res]),
        writeln("\nWords:"),
        (foreach(Word,Words), param(Cube,Letters) do 
             (foreach(W,Word), param(Cube,Letters) do
                  double_index(Cube,Letters,_Ix, C,W),
                  printf("%w:%w ",[W,C])
             ),
             nl
        ),
        % print the cubes
        writeln("\nCubes:"),
        ( for(C,1,NumCubes), 
          param(Cube,CubeLen,Letters) do
              printf("Cube %w: ",[C]),
              ( for(J,1,CubeLen), 
                fromto(ThisCube,Out,In,[]),
                param(C,Cube,Letters) do
                    % is this letter on the C'th cube?
                    double_index(Cube,Letters, J, Val,L),
                    Val == C -> Out = [L|In] ; Out = In
              ),
              writeln(ThisCube)

        ),
        writeln(backtracks:Backtracks),
        nl,
        incval(count) % increment solution number
        .

%
% Lookup a value given an index and/or some value Val1 or Val2
%
double_index(List1,List2,Ix,Val1,Val2) :-
        nth1(Ix, List1, Val1),
        nth1(Ix, List2, Val2).
        

    
% convert the matrix of letters (Words) to
% a matrix of integers.
convert_words(Words,WordsIC,Letters,LettersInt) :-
        ( foreach(Word,Words), 
          fromto(WordsIC, [ThisWord|In],In, []),
          param(Letters,LettersInt) do 
              ( foreach(W,Word),
                foreach(WI,ThisWord),
                param(Letters,LettersInt)
              do  
                double_index(Letters,LettersInt,_Ix,W,WI)
              )
        ).


%
% Labeling Dice
% 
problem(labeling_dice, 
        % number of cubes
        4,  
        % number of sides of of a cube
        6,  
        % the letters to use
        [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,y], 
        % the words to place
        [[b,u,o,y],                                        
         [c,a,v,e], 
         [c,e,l,t], 
         [f,l,u,b], 
         [f,o,r,k], 
         [h,e,m,p], 
         [j,u,d,y], 
         [j,u,n,k], 
         [l,i,m,n], 
         [q,u,i,p], 
         [s,w,a,g], 
         [v,i,s,a], 
         [w,i,s,h]]).


%
% Building Blocks
%   From http://brownbuffalo.sourceforge.net/BuildingBlocksClues.html
%   """
%   Each of four alphabet blocks has a single letter of the alphabet on each 
%   of its six sides. In all, the four blocks contain every letter but 
%   Q and Z. By arranging the blocks in various ways, you can spell all of 
%   the words listed below. Can you figure out how the letters are arranged 
%   on the four blocks?
%
%   BAKE ONYX ECHO OVAL
%   GIRD SMUG JUMP TORN 
%   LUCK VINY LUSH WRAP
%   """
problem(building_blocks,
        4,
        6,
        [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u,v,w,x,y],
        [[b,a,k,e],
         [o,n,y,x],
         [e,c,h,o],
         [o,v,a,l],
         [g,i,r,d],
         [s,m,u,g],
         [j,u,m,p],
         [t,o,r,n],
         [l,u,c,k],
         [v,i,n,y],
         [l,u,s,h],
         [w,r,a,p]]).
        

