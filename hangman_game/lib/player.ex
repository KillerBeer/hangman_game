defmodule Player do
   import Hangman
   def start do
   	  start(Hangman.new_game)
   end

   def start(game) do
      get_next_word({game,Hangman.verify(game)})
   end

   def get_next_word({game, %{ letters: letters, game_state: :won }}) do
   		IO.puts "YOU WIN!!\n"
   		IO.puts "The actual word is: '#{game.letters}' "
   		Player.start()
   end

   def get_next_word({game, %{ letters: letters, game_state: :lost }}) do
        IO.puts drawing(0)
   		IO.puts "YOU LOSE!!\n"
   		IO.puts "The actual word was: '#{game.letters}' "
   		Player.start()
   end

   def get_next_word({game, state}) do
   	    draw_status(state)
        current_status(state)
        guess = get_guess(state) 
        Hangman.make_move(game, guess)
        |>get_next_word
   end

   def current_status(%{ game_state: :starting}) do
   end

   def current_status(%{ game_state: :good_guess, last_guess: alpha}) do
        IO.puts "#{alpha} is the right guess!!\n"
   end

   def current_status(%{ game_state: :bad_guess, last_guess: alpha}) do
        IO.puts "#{alpha} is the wrong guess!!\n"
   end


   def get_guess(state) do
   	    if length(state.used) > 0 do
   		   IO.puts "Letters used so far : #{ Enum.map(state.used,fn x -> Tuple.to_list(x) |> List.first end) |> Enum.join(", ")} "
     	end 
        guess_word_until_valid(state)
   end

   def guess_word_until_valid(state) do
   	    guess = IO.gets "Enter Letter: "
   	    guess = guess
   	            |>String.downcase
   	            |>String.trim
   	    checking_valid_character(state,guess)
   end

   def checking_valid_character(state,guess) do
   	   list = Enum.map(state.used,fn x -> Tuple.to_list(x) |> List.first end)
   	    count = list |> Enum.count(fn x -> x == guess end)
   	    cond do
   	    	String.length(guess) !=1 ->
   	    	    IO.puts "pls enter a valid single character\n"
   	            guess_word_until_valid(state)

   	    	count > 0 ->
   	    	    IO.puts "you already tried #{guess} "
   	    	    guess_word_until_valid(state)

   	    	true -> guess	
   	    end        
   end

   def draw_status(state) do
    IO.puts Drawing.drawing(state.turns_left)
    IO.puts "Word to guess: #{state.letters |> Enum.join(" ")}\n"
  end

end