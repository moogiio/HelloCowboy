-module(hellocowboy_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
        {'_', [
			{"/", hello_handler, []},
			{"/basic", basic_auth_handler, []}
		]}
    ]),
	
    {ok, _} = cowboy:start_clear(
		http,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
	hellocowboy_sup:start_link().

stop(_State) ->
	ok = cowboy:stop_listener(http).