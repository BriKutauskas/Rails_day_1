Rails.application.routes.draw do
  get "/game" => "game#try"
  get "/try" => "game#try"
  get "/new_game" => "game#reset"
end
