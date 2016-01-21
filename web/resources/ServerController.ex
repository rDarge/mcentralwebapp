defmodule MCentral.ServerController do
	use MCentral.Web, :controller

	def startServer(conn, _params) do #todo: add context support here
	returnVal = ""
		case HTTPoison.post("localhost:25564/monitor", "command:startserver") do
		{:ok, %HTTPoison.Response{status_code: 200, body: respbody}} ->
			IO.puts respbody
    		MCentral.Endpoint.broadcast! "status:server", "new_msg", %{body: respbody}
		{:error, %HTTPoison.Error{reason: reason}} ->
			IO.puts "Error: Server Start Failed"
    		MCentral.Endpoint.broadcast! "status:server", "new_msg", %{body: "Server Start Failed"}
    	end

    	conn
   end

	def stopServer(conn, _params) do #todo: add context support here
		case HTTPoison.post("localhost:25564/monitor", "command:stopserver") do
		{:ok, %HTTPoison.Response{status_code: 200, body: respbody}} ->
			IO.puts respbody
			MCentral.Endpoint.broadcast! "status:server", "new_msg", %{body: respbody}
		{:error, %HTTPoison.Error{reason: reason}} ->
    		IO.puts "Error"
    		MCentral.Endpoint.broadcast! "status:server", "new_msg", %{body: "Server Stop Failed"}
    	end

    	conn
	end
end