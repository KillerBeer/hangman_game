defmodule Make_move_testing do
	use ExUnit.Case
	test "testing make_move" do
		assert Hangman_game.make_move( %{game_state: :starting, last_guess: "", letters: ["s", "a", "c", "h", "i", "n"], turns_left: 7, used: %{}},"s") == { %{game_state: :good_guess, last_guess: "s", letters: ["s", "a", "c", "h", "i", "n"], turns_left: 7, used: %{"s" => 1} }, %{ game_state: :good_guess, last_guess: "s", letters: ["s", "_", "_", "_", "_", "_"], turns_left: 7, used: [{"s", 1}] } }
	end

	test "testing make_move for more than one value matching" do
		assert Hangman_game.make_move( %{game_state: :starting, last_guess: "", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 7, used: %{}},"s") == { %{game_state: :good_guess, last_guess: "s", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 7, used: %{"s" => 1} }, %{ game_state: :good_guess, last_guess: "s", letters: ["s", "_", "_", "_", "_", "_", "s"], turns_left: 7, used: [{"s", 1}] } }
	end

	test "testing make_move when wrong guess is given" do
		assert Hangman_game.make_move( %{game_state: :starting, last_guess: "", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 7, used: %{}},"k") == { %{game_state: :bad_guess, last_guess: "k", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 6, used: %{"k" => 1} }, %{ game_state: :bad_guess, last_guess: "k", letters: ["_", "_", "_", "_", "_", "_", "_"], turns_left: 6, used: [{"k", 1}] } }
	end

	test "testing make_move when wrong guess and person lose" do
		assert Hangman_game.make_move( %{game_state: :bad_guess, last_guess: "p", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 1, used: %{"p" => 1, "l" =>1}},"k") == { %{game_state: :lost, last_guess: "k", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 0, used: %{"p" => 1, "l" =>1, "k" => 1} }, %{ game_state: :lost, last_guess: "k", letters: ["_", "_", "_", "_", "_", "_", "_"], turns_left: 0, used: [{"k", 1},{"l", 1},{"p", 1}] } }
	end

	test "testing make_move when wrong guess and person won" do
		assert Hangman_game.make_move( %{game_state: :won, last_guess: "n", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 7, used: %{"a" => 1, "c" =>1, "h" =>1, "i" =>1, "n" =>1}},"s") == { %{game_state: :won, last_guess: "s", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 7, used: %{"a" => 1, "c" =>1, "h" =>1, "i" =>1, "n" =>1, "s" => 1} }, %{ game_state: :won, last_guess: "s", letters: ["s", "a", "c", "h", "i", "n", "s"], turns_left: 7, used: [{"a", 1},{"c", 1},{"h", 1}, {"i", 1}, {"n", 1}, {"s", 1}] } }
	end

end
