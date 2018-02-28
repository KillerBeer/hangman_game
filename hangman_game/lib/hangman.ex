defmodule Hangman do
	import Hangman_game
	import Drawing
	defdelegate new_game(),                to: Hangman_game

	defdelegate verify(game),              to: Hangman_game

	defdelegate make_move(game,guess),     to: Hangman_game

	defdelegate drawing(value),            to: Drawing
end