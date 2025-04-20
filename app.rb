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

get("/payment/new") do
  erb(:payments)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_f
  @principal = params.fetch("user_pv").to_f

  @formatted_apr = format('%.4f%%', @apr)
  @formatted_years = @years.to_i
  @formatted_principal = @principal.to_fs(:currency)

  @r = @apr/(100*12)
  @n = @years * 12
  @numerator = @r * @principal
  @denominator = 1 - ((1 + @r) ** (-@n))
  @payment = @numerator/@denominator

  @formatted_payment = @payment.to_fs(:currency)
  erb(:payment_results)

end
