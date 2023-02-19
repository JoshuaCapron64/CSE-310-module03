% INTRODUCTION:
% Welcome to my Erlang tutorial. Here, I will be demonstrating various
% functional properties, and how they are executed within the Erlang
% programming language, including Pattern Matching, Recursion, Guards,
% Lists, basic outputs through io:format, and list functions executed
% in the terminal.

%#this declares the file name as a module, so that the compiler may
%#recognize it
-module(module03).
%#we also have to export every function created in the code, also for
%#compiler use
-export([display/0, userinput/0, first/1, second/1, third/1, equal/2, rec/1, begin1/0, begin2/0, clone/2, begin3/0]).
%#its not recommended to use the following line of code, but I'm doing
%#so here to account for functions that don't seem to want to export
%#normally. It's basically a simple "cheat" for getting all function
%#to export without litsing each one individually, however it is prone
%#to bugs and other problems, hence why its not recommended.

% "-compile(export_all)."


% BASIC DISPLAY OUTPUT
% Erlang works differently from other languages in that you can't just
% run the whole code and output everything all at once. Instead, you
% still run the code, but then manually call the functions, and set the
% values for their parameters yourself in the terminal. Only then will
% you see the outputs for the functions displayed.

%#this will output a basic statement once called. No parameters needed.
display() ->
    io:format("If you can read me, then the function is working ~n").
%#in the terminal, after loading the code, type the name of the file
%#followed by a semicolon, then the function you're calling. There are
%#no parameters here, so leave it blank. Ex: module03:display().

%#this one will ask for user input specifically. Make sure to include
%#a period after you type your input before hitting Enter.
userinput() ->
    {ok, Age} = io:read("Enter your age: "),
    io:format("In 20 years, you will be ~w years old.~n", [Age + 20])
.


% PATTERN MATCHING:
% Erlang binds variables to values through a mechanism called Pattern
% Matching. The syntax is very similar to declaring variables in other
% languages like Python or C++, but once a value is bound to a variable,
% that variable remains static for the entire code.

%#here, we will create functions that will declare lists, and specify
%#which value each will be outputted
first([X,_,_|_]) ->
    X.
second([_,X,_|_]) ->
    X.
third([_,_,X|_]) ->
    X.
%#the user will have to assign something to fill the parameters when
%#calling the function. Then it will be added to the output.

%#now we will create a different new function that will judge whether
%#or not the two inputted values are identical.
equal(X,X) ->
    true;
equal(_,_) ->
    false.
%#like the others, the format is "filename:function(value,value)


% RECURSION:
% Just like other languages, recursion refers to the act of a function
% calling itself over and over until specified conditions are met. I
% will demonstrate below examples of recursive functions as they work
% in Erlang.

%#here is a recursive function that will return how many units a list
%#contains, more commonly known as the list's length.
rec([]) ->
    0;
rec([_|B]) ->
    1 + rec(B).
begin1() ->
    C = [1,2,3,4],
    io:fwrite("~w~n", [rec(C)]).
begin2() ->
    C = [2,4,6,8,10],
    io:fwrite("~w~n", [rec(C)])
.

%#here is one where we will duplicate the first parameter a number of
%#times equal to the second parameter.
clone(_,0) ->
    [];
%#notice my use of a Guard here, or what Erlang refers to as conditions
%#that will determine when the function should stop executing. Many
%#recursive funcitons will require the use of guards so that they don't
%#endlessly recall themselves and crash your machine.
clone(Integer, B) when B > 0 ->
    io:fwrite("~w~n", [Integer]),
    [Integer|clone(Integer, B - 1)].
begin3() ->
    clone(6, 3)
.


% TERMINAL FUNCTIONS; LISTS:FILTER:
% Within the Erl terminal, one doesn't necessarily need to have a code
% typed up in order to execute prebuilt functions in Erlang. I will
% be demonstrating just one such function here; the use of lists:filter.
% In the terminal, simply type the following command:

% "lists:filter(fun(X) -> X rem 3 /= 0 end, lists:seq(0,30))."

% The first portion calls the "lists:filter" function. "fun(x)" refers
% to an unknown function that will determine how filter is going to work
% this time around. "X rem 3/= 0 end" are the parameters that tells the
% filter to remove all numbers that are divisible by 3. Finally, the
% final portion is the list that "lists:filter" will be manipulating; a
% sequence of all positive numbers from 0 to 30. This will return that
% list back, but will all numbers that meet those requirements filtered
% out. Try it with other inputs too!