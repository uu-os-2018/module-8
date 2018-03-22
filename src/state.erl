%% @doc An example of a stateful Erlang process.

-module(state).
-export([start/0]).

%% @doc In Erlang systems it is common for a module to provide a start functions that
%% initializes the system, for example by spawning a new process.
start() ->
    spawn(fun() -> loop(0) end).

%% The recursive receive function for the  main process is often named loop.
%%
%% The state of a process is defined by the values of the arguments to the
%% process receive loop.
%%
%% The state of the process executing the loop/1 function is defined by the
%% current value of the argument N.
%%
%% When receiving a message, the process can change state by using a different
%% value for the argument N in the recursive call.
loop(N) when is_integer(N) ->
    receive
        inc ->
            %% Update the process state by using a new value for the argument
            %% to the process loop.
            loop(N+1);
        dec ->
            %% Update the process state by using a new value for the argument
            %% to the process loop.
            loop(N-1);
        show ->
            io:format("N = ~w~n", [N]),
            %% Don't update the process state.
            loop(N)
    end.
