defmodule MCentral.ServerController do
	def startServer do #todo: add context support here
		case HTTPoison.post("localhost:25564/monitor", "command:startserver") do
		{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
			IO.puts body
		{:error, %HTTPoison.Error{reason: reason}} ->
    		IO.inspect reason
    	end
	end

	def stopServer do #todo: add context support here
		case HTTPoison.post("localhost:25564/monitor", "command:stopserver") do
		{:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
			IO.puts body
		{:error, %HTTPoison.Error{reason: reason}} ->
    		IO.inspect reason
    	end
	end
end