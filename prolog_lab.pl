% Cole Sluggett
% CSCI 305 Prolog Lab 2

mother(M,C):- parent(M,C),female(M). %finds the mother of C
father(F,C):- parent(F,C),male(F).   %finds the father of C
spouse(X,Y):- married(X,Y).          %finds the spouse of Y
spouse(X,Y):- married(Y,X).          %finds the spouse of X
child(X,Y):- parent(Y,X).            %finds the child/childer of Y
son(X,Y):- parent(Y,X),male(X).      %finds the son(s) of Y
daughter(X,Y):- parent(Y,X),female(X).    %finds the daughter(s) of Y
sibling(X,Y):- parent(Z,X),parent(Z,Y), X \= Y.     %finds the siblings of Y
brother(X,Y):- male(X),parent(P,X),parent(P,Y), X \= Y.  %finds the brothers of Y
sister(X,Y):- female(X),parent(P,X),parent(P,Y), X \= Y.    %finds the sisters of Y
aunt(X,Y):- sister(X,P),parent(P,Y).               %finds the blood aunts of Y
aunt(X,Y):- sister(X,P), parent(P,S), spouse(S,Y). %finds the marriage aunts of Y
%aunt(X,Y):- sister(X,S),spouse(S,P),parent(P,Y).
uncle(X,Y):- brother(X,P),parent(P,Y).               %finds the blood uncles of Y
uncle(X,Y):- brother(X,P), parent(P,S), spouse(S,Y). %finds the marriage uncles of Y
%uncle(X,Y):- brother(X,S),spouse(S,P),parent(P,Y).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).           %finds the grandparents of Y
grandfather(X,Y):- male(X),parent(X,Z),parent(Z,Y).   %finds the grandfathers of Y
grandmother(X,Y):- female(X),parent(X,Z),parent(Z,Y). %finds the grandmothers of Y
grandchild(X,Y):- parent(Y,Z),parent(Z,X).            %finds the grandchildren of Y
ancestor(X,Y):- parent(X,Y).                    %finds the ancestors of Y
ancestor(X,Y):- parent(X,Z),ancestor(Z,Y).
descendant(X,Y):- child(X,Y).                   %finds the descendants of Y
descendant(X,Y):- child(X,Z),descendant(Z,Y).
older(X,Y):- born(X,Ax),born(Y,Ay), Ay>Ax.      %returns true if X is older than Y
younger(X,Y):- born(X,Ax),born(Y,Ay), Ax>Ay.    %returns true if X is younger than Y
regentWhenBorn(X,Y):- born(Y,Ay),reigned(X,B,C), B =< Ay, C >= Ay.   %states who was in power when Y was born
cousin(X,Y) :- uncle(U,X),father(U,Y).   %finds the cousins of Y
cousin(X,Y) :- aunt(A,X),mother(A,Y).


