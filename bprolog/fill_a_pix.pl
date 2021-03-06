/*

  Fill-a-Pix problem in B-Prolog.

  From http://www.conceptispuzzles.com/index.aspx?uri=puzzle/fill-a-pix/basiclogic
  """
  Each puzzle consists of a grid containing clues in various places. The 
  object is to reveal a hidden picture by painting the squares around each 
  clue so that the number of painted squares, including the square with 
  the clue, matches the value of the clue. 
  """
 
  Other names of this puzzle:
 
      * ぬり絵パズル
      * Nurie-Puzzle
      * Majipiku
      * Oekaki-Pix
      * Mosaic
      * Mosaik
      * Mozaïek
      * ArtMosaico
      * Count and Darken
      * Nampre puzzle
      * Komsu Karala!
      * Cuenta Y Sombrea
      * Mosaico
      * Voisimage
      * Magipic
      * Fill-In

 
  http://www.conceptispuzzles.com/index.aspx?uri=puzzle/fill-a-pix/rules
  """
  Fill-a-Pix is a Minesweeper-like puzzle based on a grid with a pixilated 
  picture hidden inside. Using logic alone, the solver determines which 
  squares are painted and which should remain empty until the hidden picture 
  is completely exposed.
  """
  
  Fill-a-pix History:
  http://www.conceptispuzzles.com/index.aspx?uri=puzzle/fill-a-pix/history

  Model created by Hakan Kjellerstrand, hakank@gmail.com
  See also my B-Prolog page: http://www.hakank.org/bprolog/

*/


go :-
        problem(1,Problem),
        fill_a_pix(Problem).

go2 :-
        foreach(P in 1..3,[Problem],
                (
                format("\nProblem ~w\n",[P]),
                problem(P,Problem),
                fill_a_pix(Problem)
                )
        ).


fill_a_pix(Problem) :-

        N @= Problem^length,

        new_array(X,[N,N]),
        array_to_list(X,XList),
        XList :: 0..1,

        foreach(I in 1..N, 
                foreach(J in 1..N, [ProblemIJ],
                        (ProblemIJ @= Problem[I,J],
                         ground(ProblemIJ)
                        ->                    
                         (
                             ProblemIJ #= sum([XIAJB :  A in -1..1, B in -1..1,
                                               [XIAJB],
                                               (
                                                   I+A #>  0, J+B #>  0,
                                                   I+A #=< N, J+B #=< N ->
                                                       XIAJB @= X[I+A,J+B]
                                               )
                                              ])                 
                         )
                        ;
                         true
                        ))
               ),

        % search
        labeling(XList),

        pretty_print(X),
        nl.



pretty_print(X) :-
        N @= X^length,
        foreach(I in 1..N,
                (foreach(J in 1..N,
                         (X[I,J] =:= 1  ->  write('#') ; write(' ') )),
                 nl
                )
        ).



% Puzzle 1 from 
% http://www.conceptispuzzles.com/index.aspx?uri=puzzle/fill-a-pix/rules
% 
problem(1,[[_,_,_,_,_,_,_,_,0,_],
           [_,8,8,_,2,_,0,_,_,_],
           [5,_,8,_,_,_,_,_,_,_],
           [_,_,_,_,_,2,_,_,_,2],
           [1,_,_,_,4,5,6,_,_,_],
           [_,0,_,_,_,7,9,_,_,6],
           [_,_,_,6,_,_,9,_,_,6],
           [_,_,6,6,8,7,8,7,_,5],
           [_,4,_,6,6,6,_,6,_,4],
           [_,_,_,_,_,_,3,_,_,_]]).





% Puzzle 2 from 
% http://www.conceptispuzzles.com/index.aspx?uri=puzzle/fill-a-pix/rules
% 
problem(2, [[0,_,_,_,_,_,3,4,_,3],
            [_,_,_,4,_,_,_,7,_,_],
            [_,_,5,_,2,2,_,4,_,3],
            [4,_,6,6,_,2,_,_,_,_],
            [_,_,_,_,3,3,_,_,3,_],
            [_,_,8,_,_,4,_,_,_,_],
            [_,9,_,7,_,_,_,_,5,_],
            [_,_,_,7,5,_,_,3,3,0],
            [_,_,_,_,_,_,_,_,_,_],
            [4,4,_,_,2,3,3,4,3,_]]).


% Puzzle from 
% http://www.conceptispuzzles.com/index.aspx?uri=puzzle/fill-a-pix/basiclogic
%
% Code: 030.15x15
% ID: 03090000000
% 
problem(3, [[_,5,_,6,_,_,_,_,_,_,6,_,_,_,_],
            [_,_,7,6,_,4,_,_,4,_,_,8,9,_,5],
            [5,_,_,5,_,5,_,3,_,6,_,7,_,_,6],
            [4,_,2,_,4,_,4,_,3,_,2,_,_,9,_],
            [_,_,_,5,_,4,_,3,_,4,_,4,5,_,6],
            [_,4,3,3,4,_,_,_,4,_,2,_,_,_,_],
            [_,_,_,_,_,_,_,_,_,5,_,_,_,4,_],
            [3,_,3,_,_,3,_,_,_,5,_,4,4,_,_],
            [_,_,_,4,3,_,3,3,_,_,5,7,6,_,_],
            [4,_,_,_,2,_,3,3,2,_,8,9,_,5,_],
            [_,_,3,_,_,_,_,5,_,_,7,_,8,_,_],
            [4,_,_,3,2,_,_,_,_,_,7,_,_,6,_],
            [_,_,4,_,5,4,4,_,_,9,6,_,_,_,_],
            [_,3,5,7,_,6,_,_,_,_,_,_,7,_,_],
            [_,_,4,6,6,_,_,_,6,5,_,_,_,4,_]]).



