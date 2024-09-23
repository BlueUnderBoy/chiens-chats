require "sinatra"
require "sinatra/reloader"
require "http"

get("/") do
  erb(:homepage)
end

get("/fight") do

  @ddata = HTTP.get("https://dog.ceo/api/breeds/image/random")
  @cdata = HTTP.get("https://api.thecatapi.com/v1/images/search?limit=1")

  @dstring = @ddata.to_s
  @cstring = @cdata.to_s

  @dparsed = JSON.parse(@dstring)
  @cparsed = JSON.parse(@cstring)

  $dfighter = @dparsed.fetch("message")
  $cfighter = @cparsed[0]["url"]

  erb(:match)

end

get("/dw") do

  @winner = $dfighter.to_s
  erb(:dogs)

end

get("/cw") do

  @winner = $cfighter.to_s
  erb(:cats)

end
