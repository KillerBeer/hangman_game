defmodule Hangman_game do
	
	defstruct(
    turns_left: 7,
    game_state: :starting,
    letters:    [],
    used:       %{},
    last_guess: ""
 	)

	def new_game() do
		new_game(Dictionary.random_word)
	end

	def new_game(word) do
	    %Hangman_game{
         letters: word |> String.codepoints
        }
	end

	def verify(game) do
	    %{
          game_state: game.game_state,
          turns_left: game.turns_left,
          letters:    game.letters |> reveal_guessed(game.used),
          used:       game.used    |> Map.to_list |> Enum.sort(),
          last_guess: game.last_guess,
        }
	end

	def make_move(game, guess) do
		
		game
		|>Map.put(:last_guess, guess)
		|>accept_move(guess)
		|>return
	end

	def accept_move(game, guess) do
        
		game=Map.put(game, :used, Map.update(game.used, guess, 1, fn x -> 1 end )) 
		#IO.inspect game.used
		count = game.letters
		        |> Enum.count(fn x -> x==guess end)        

		count_equal = game.letters
		              |> Enum.count(fn x -> MapSet.member?(MapSet.new(game.used),{x, 1}) end)

		cond do
			count > 0 and count_equal == length(game.letters) -> game = game |> Map.put(:game_state, :won)
			count > 0 -> game = game |> Map.put(:game_state, :good_guess)
            count == 0 and game.turns_left == 1 -> game = game |> Map.put(:game_state, :lost ) |> Map.put(:turns_left, game.turns_left-1)

			true -> game = game |> Map.put(:game_state, :bad_guess) |> Map.put(:turns_left, game.turns_left-1)
		end        
	end

	def reveal_guessed(letters, used) do
         letters
         |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(MapSet.new(used), {letter,1})) end)
    end

    def reveal_letter(letter, _in_word = true),  do: letter

    def reveal_letter(_letter, _not_in_word),    do: "_"

    def return(game), do: {game, verify(game)}
end
Hangman_game.new_game