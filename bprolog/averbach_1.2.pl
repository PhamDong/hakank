/*

  Seating puzzle in B-Prolog.

  From Averbach & Chein "Problem Solving Through Recreational Mathematics", 
  page 2, problem 1.2
  
  """
  Ms X, Ms Y, and Ms Z - and American woman, and Englishwoman, and a 
  Frenchwoman, but not neccessarily in that order, were seated around a 
  circular table, playing a game of Hearts. 
  Each passed three cards to the person on her right.
  Ms Y passed three hearts to the American, 
  Ms X passed the queen of spades and two diamonds to the person who
  passed her cards to the Frenchwoman
  
  Who was the American? The Englishwoman? The Frenchwoman?
  """"

  This model gives the following solution
  Table:[1,2,3]
  Women:[1,3,2]
  Placing:[American,French,English]
 
          1                      American
                       
      3      2               English   French
   

  Model created by Hakan Kjellerstrand, hakank@gmail.com
  See also my B-Prolog page: http://www.hakank.org/bprolog/

*/


go :-
        Women = [American,_English,French],
        Women :: 1..3,

        Table = [X,Y,_Z],
        Table :: 1..3,

        alldifferent(Table),
        alldifferent(Women),

        rightTo(Y, American),
        leftTo(X, French),

        X #= 1, % symmetry breaking

        labeling([],Women),

        writeln('Table':Table),
        writeln('Women':Women),
        Str = ['American', 'English', 'French'],
        Placing @= [P : Place in Table, 
                    [WI,P],
                    (element(Place,Women,WI), 
                     nth1(WI,Str,P))
                   ],
        writeln('Placing':Placing),
        nl.



% x is right to y
rightTo(X, Y) :-
    X #= Y + 1 ;
    X #= Y - 2. % around the corner


leftTo(X, Y) :- 
    rightTo(Y,X).
