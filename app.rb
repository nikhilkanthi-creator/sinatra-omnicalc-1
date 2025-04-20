require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get ("/square/new") do
erb(:square)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_square = @the_num * @the_num
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_root = @the_num ** 0.5
  erb(:square_root_results)
end
