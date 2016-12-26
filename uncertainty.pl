problem :- solve(problem,_).

solve(A, V) :-
	abolish(fact,3),
	dynamic(fact/3),
	abolish(asked,1),
	dynamic(asked/1),
	findgoal(av(A, V), CF, [goal(A)]),
	how(av(A, V)),!,
	write('The answer is '),write(V),write(' with CF='),write(CF),nl,
	write('do you need recommendation for your state '),nl,
	read(Ans),
	evaluate(Ans,V).

evaluate(Ans,V):-
	 	 Ans == 'yes',!,
		 recomend(V),nl,fail.


recomend(V):-
	rule(_, lhs(G), rhs(av(V,yes), _)),
	write_recommend(G).


write_recommend([]):-write('here'),nl,fail.
write_recommend([H|T]):-
		pretty(H,R),
		write_line(R),!,
		write_recommend(T).

query_user(Attr, Prompt,Hist) :-
	repeat,
	write(Prompt),
	read(Val),
	process_ans(Val,Hist),
	read(CF),
	check(Val,NCFI,CF , NVal),
	asserta(fact(av(Attr, NVal), NCFI,[])).

	
check(Val,CF,Curf,NVal):- Val==yes,
			  CF is Curf,
			  NVal = Val;
			  CF is Curf * -1,
			  NVal = yes .

process_ans(Val,Hist):-
	Val == 'why',!,
	write_hist(Hist),nl,fail.

process_ans(_,_).

write_hist([]) :-write('in null'), nl.


write_hist([goal(X)|T]) :-
	write_line([goal, X]),!,
	write_hist(T).
write_hist([[N|T]]):-
	list_rule(N),
 	  write_hist(T).
write_hist([N|T]) :-
	list_rule(N),!,
   write_hist(T).

findgoal(not(Goal), NCF,Hist) :-
	findgoal(Goal, CF,Hist),
	NCF is - CF,
	!.

findgoal( av(Attr, Val), CF,_ ) :-
	fact( av(Attr, Val), CF,_),
	!.

findgoal(Goal,CF, Hist) :-
	can_ask(Goal,Hist),
	!,
	findgoal(Goal,CF, Hist).

findgoal(Goal, CurCF,Hist) :-
	fg(Goal, CurCF,Hist).

fg(Goal, CurCF,Hist) :-
	rule(N, lhs(IfList), rhs(Goal, CF)),	% Get goal's if list
	write('call rule '),write(N),nl,
	prove(N,IfList, Tally,Hist),
	write('exit rule '),write(N),nl,
	adjust(CF, Tally, NewCF),
	update(Goal, NewCF, CurCF, N),
	CurCF == 100,
	!.

fg(Goal, CF,_) :-
	fact(Goal, CF,_).

% can_ask shows how to query the user for various types of goal patterns

can_ask(av(Attr,_),Hist) :-
	not(asked(av(Attr,_))),
	askable(Attr,Prompt),
	query_user(Attr,Prompt,Hist),
	asserta( asked(av(Attr,_)) ).

% prove works through a LHS list of premises, calling findgoal on
% each one.  the total cf is computed as the minimum cf in the list

prove(N,IfList,Tally, Hist) :-
	prov(IfList,100,Tally,[N,Hist]),!.
prove(N,_,_,_):-
	write('fail rule '),write(N),nl,fail.
prov([],Tally,Tally,_).
prov([H|T],CurTal,Tally,Hist) :-
	findgoal(H,CF,Hist),
	minimum(CurTal,CF,Tal),
	Tal >= 20,
	prov(T,Tal,Tally,Hist).

% update - if its already known with a given cf, here is the formula
% for adding in the new cf.  this is used in those cases where multiple
% RHS reference the same attr :val

update(Goal, NewCF, CF, RuleN) :-
	fact(Goal, OldCF,_),
	combine(NewCF, OldCF, CF),
	retract( fact(Goal, OldCF,OldRules) ),
	asserta( fact(Goal, CF, [RuleN | OldRules]) ),
	%updat(Goal,RuleN),
	!.

update(Goal, CF, CF, RuleN) :-
	asserta( fact(Goal, CF, [RuleN]) ),
	updat(Goal,RuleN).

updat(Goal,RuleN):-
	rule(_,lhs(IfList), rhs(NewGoal,CF)),
	member(Goal,IfList),
	retract(fact(NewGoal , CF , OldRules)),
	assert(fact(NewGoal , CF , [RuleN | OldRules])),
	updat(NewGoal , RuleN).

updat(_,_).

member(Goal , [H|_]):-
	Goal == H.

member(Goal , [_|T]):-
	member(Goal , T).



how(Goal) :-
	fact(Goal, CF, Rules),
	CF > 20,
	pretty(Goal, PG),
	write_line([PG, was, derived, from, 'rules: '|Rules]),
	nl,
	list_rules(Rules),
	fail.

how(_).

how(not(Goal)) :-
	fact(Goal, CF, Rules),
	CF < -20,
	pretty(not(Goal), PG),
	write_line([PG, was, derived, from, 'rules: '|Rules]),
	nl,
	list_rules(Rules),
	fail.


adjust(CF1, CF2, CF) :-
	X is CF1 * CF2 / 100,
	int_round(X, CF).

combine(CF1, CF2, CF) :-
	CF1 >= 0,
	CF2 >= 0,
	X is CF1 + CF2*(100 - CF1)/100,
	int_round(X, CF).

combine(CF1, CF2, CF) :-
	CF1 < 0,
	CF2 < 0,
	X is - ( -CF1 -CF2 * (100 + CF1)/100),
	int_round(X, CF).

combine(CF1, CF2, CF) :-
	(CF1 < 0; CF2 < 0),
	(CF1 > 0; CF2 > 0),
	abs_minimum(CF1, CF2, MCF),
	X is 100 * (CF1 + CF2) / (100 - MCF),
	int_round(X, CF).

abs_minimum(A,B,X) :-
	absolute(A, AA),
	absolute(B, BB),
	minimum(AA,BB,X).

absolute(X, X) :- X >= 0.
absolute(X, Y) :- X < 0, Y is -X.

minimum(X,Y,X) :- X =< Y,!.
minimum(X,Y,Y) :- Y =< X.

int_round(X,I) :-
	X >= 0,
	I is integer(X + 0.5).
int_round(X,I) :-
	X < 0,
	I is integer(X - 0.5).



pretty(av(A, recomend), [A]) :- !.
pretty(av(A, yes), [A]) :- !.
pretty(not(av(A, yes)), [not, A]) :- !.
pretty(av(A, no), [not, A]) :- !.
pretty(not(av(A, V)), [not, A, is, V]).
pretty(av(A, V), [A, is, V]).



list_rules([]).
list_rules([R|X]) :-
	list_rule(R),
	list_rules(X).

list_rule(N) :-
	rule(N, lhs(Iflist), rhs(Goal, CF)),
	write_line(['rule ', N]),
	write_line(['If']),
	write_ifs(Iflist),
	write_line(['Then']),
	pretty(Goal, PG),
	write_line([' ', PG, CF]), nl.

write_ifs([]).

write_ifs([H|T]) :-
	pretty(H, HP),
	tab(5), write_line(HP),
	write_ifs(T).

write_line([]).
write_line([H|T]):-
	write_l(H),
	write_line(T).


write_l([H|T]):-
	write(H),
	write(' '),
	write_l(T),!.
write_l([]).
write_l(V):-
	write(V),write(' '),!.







