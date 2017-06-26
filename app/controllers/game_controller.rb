class GameController < ApplicationController
  def try
    cookies[:username] = params[:username] unless params[:username].nil?
    # read the counter from the cookie
    @counter = cookies[:counter].to_i
    @counter ||= 0
    session[:number] = params[:number] unless params[:number].nil?
    @guess = params[:guess].to_i
    @guess ||= 0
      if @guess > session[:number].to_i
        @result = "You guessed too high"
        @counter += 1
      elsif @guess == 0
        @result = "Guess a number"
      elsif @guess < session[:number].to_i
        @result = "Your guess was too low"
        @counter +=  1
      elsif @guess == session[:number].to_i
        @result = "You guessed the number"
      end
# set the cookie from the counter
    cookies[:counter] = @counter
  end
  def reset
    session.delete(:number)
    cookies.delete(:username)
    cookies.delete(:counter)
    reset_session
    redirect_to action: :try
  end

end
