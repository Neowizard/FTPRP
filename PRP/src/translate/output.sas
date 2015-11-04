begin_version
3
end_version
begin_metric
0
end_metric
9
begin_variable
var0
-1
2
Atom clear(b1)
NegatedAtom clear(b1)
end_variable
begin_variable
var1
-1
2
Atom clear(b2)
NegatedAtom clear(b2)
end_variable
begin_variable
var2
-1
2
Atom clear(b3)
<none of those>
end_variable
begin_variable
var3
-1
2
Atom clear(b4)
<none of those>
end_variable
begin_variable
var4
-1
2
Atom clear(b5)
NegatedAtom clear(b5)
end_variable
begin_variable
var5
-1
2
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var6
-1
6
Atom holding(b1)
Atom on(b1, b2)
Atom on(b1, b3)
Atom on(b1, b4)
Atom on(b1, b5)
Atom on-table(b1)
end_variable
begin_variable
var7
-1
6
Atom holding(b2)
Atom on(b2, b1)
Atom on(b2, b3)
Atom on(b2, b4)
Atom on(b2, b5)
Atom on-table(b2)
end_variable
begin_variable
var8
-1
6
Atom holding(b5)
Atom on(b5, b1)
Atom on(b5, b2)
Atom on(b5, b3)
Atom on(b5, b4)
Atom on-table(b5)
end_variable
12
begin_mutex_group
4
0 0
6 0
7 1
8 1
end_mutex_group
begin_mutex_group
4
1 0
7 0
6 1
8 2
end_mutex_group
begin_mutex_group
4
2 0
6 2
7 2
8 3
end_mutex_group
begin_mutex_group
4
3 0
6 3
7 3
8 4
end_mutex_group
begin_mutex_group
4
4 0
8 0
6 4
7 4
end_mutex_group
begin_mutex_group
4
5 0
6 0
7 0
8 0
end_mutex_group
begin_mutex_group
5
6 0
6 1
6 2
6 3
6 4
end_mutex_group
begin_mutex_group
6
6 0
6 1
6 2
6 3
6 4
6 5
end_mutex_group
begin_mutex_group
5
7 0
7 1
7 2
7 3
7 4
end_mutex_group
begin_mutex_group
6
7 0
7 1
7 2
7 3
7 4
7 5
end_mutex_group
begin_mutex_group
5
8 0
8 1
8 2
8 3
8 4
end_mutex_group
begin_mutex_group
6
8 0
8 1
8 2
8 3
8 4
8 5
end_mutex_group
begin_state
1
0
1
1
0
0
2
1
4
end_state
begin_goal
7
0 0
2 0
3 0
5 0
6 1
7 4
8 5
end_goal
27
begin_operator
pick-up b1 b2
0
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-up b1 b3
0
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-up b1 b4
0
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-up b1 b5
0
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-up b2 b1
0
4
0 0 -1 0
0 1 0 1
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-up b2 b3
0
4
0 1 0 1
0 2 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-up b2 b4
0
4
0 1 0 1
0 3 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-up b2 b5
0
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-up b5 b1
0
4
0 0 -1 0
0 4 0 1
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-up b5 b2
0
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-up b5 b3
0
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-up b5 b4
0
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
put-down b1
0
3
0 0 -1 0
0 5 -1 0
0 6 0 5
0
end_operator
begin_operator
put-down b2
0
3
0 1 -1 0
0 5 -1 0
0 7 0 5
0
end_operator
begin_operator
put-down b5
0
3
0 4 -1 0
0 5 -1 0
0 8 0 5
0
end_operator
begin_operator
put-on-block b1 b2
0
4
0 0 -1 0
0 1 0 1
0 5 -1 0
0 6 0 1
0
end_operator
begin_operator
put-on-block b1 b3
0
4
0 0 -1 0
0 2 0 1
0 5 -1 0
0 6 0 2
0
end_operator
begin_operator
put-on-block b1 b4
0
4
0 0 -1 0
0 3 0 1
0 5 -1 0
0 6 0 3
0
end_operator
begin_operator
put-on-block b1 b5
0
4
0 0 -1 0
0 4 0 1
0 5 -1 0
0 6 0 4
0
end_operator
begin_operator
put-on-block b2 b1
0
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 7 0 1
0
end_operator
begin_operator
put-on-block b2 b3
0
4
0 1 -1 0
0 2 0 1
0 5 -1 0
0 7 0 2
0
end_operator
begin_operator
put-on-block b2 b4
0
4
0 1 -1 0
0 3 0 1
0 5 -1 0
0 7 0 3
0
end_operator
begin_operator
put-on-block b2 b5
0
4
0 1 -1 0
0 4 0 1
0 5 -1 0
0 7 0 4
0
end_operator
begin_operator
put-on-block b5 b1
0
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 8 0 1
0
end_operator
begin_operator
put-on-block b5 b2
0
4
0 1 0 1
0 4 -1 0
0 5 -1 0
0 8 0 2
0
end_operator
begin_operator
put-on-block b5 b3
0
4
0 2 0 1
0 4 -1 0
0 5 -1 0
0 8 0 3
0
end_operator
begin_operator
put-on-block b5 b4
0
4
0 3 0 1
0 4 -1 0
0 5 -1 0
0 8 0 4
0
end_operator
0
