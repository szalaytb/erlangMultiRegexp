-module(erlang_parser).
-export([parser1/3,parser2/3,parser3/3,start/0]).

parser1(Expression, Target, Source) -> 
   {_, T} = file:read_file(Source),
   Result = re:run(T, Expression,[global,{capture,all,list}]),
   file:write_file(Target, io_lib:fwrite("~p.\n", [Result])).

parser2(Expression, Target, Source) -> 
   {_, T} = file:read_file(Source),
   Result = re:run(T, Expression,[global,{capture,all,list}]),
   file:write_file(Target, io_lib:fwrite("~p.\n", [Result])).

parser3(Expression, Target, Source) -> 
   {_, T} = file:read_file(Source),
   Result = re:run(T, Expression,[global,{capture,all,list}]),
   file:write_file(Target, io_lib:fwrite("~p.\n", [Result])).

start() ->
    spawn(erlang_parser, parser1, ["Tseitlin,.{1,}|.{1,} Tseitlin,.{1,}", "Tseitlin", "Najdorf Fg5pgn83.txt"]),
    spawn(erlang_parser, parser2, ["Horvath,.{1,}|.{1,} Horvath,.{1,}", "Horvath", "Najdorf Fg5pgn83.txt"]),
    spawn(erlang_parser, parser3, ["Horvat,.{1,}|.{1,} Horvat,.{1,}", "Horvat", "Najdorf Fg5pgn83.txt"]),
    "Processes have been started.".
