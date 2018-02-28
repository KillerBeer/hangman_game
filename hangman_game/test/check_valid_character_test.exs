defmodule Valid_character do
	use ExUnit.Case

	test "testing valid character" do
		 assert Player.checking_valid_character(%{ game_state: :good_guess, last_guess: "s", letters: ["s", "_", "_", "_", "_", "_"], turns_left: 7, used: [{"s", 1}] },"k") == "k"
	end

	test "testing valid character more than one characters are used before" do
		 assert Player.checking_valid_character(%{ game_state: :good_guess, last_guess: "s", letters: ["s", "_", "_", "_", "_", "_"], turns_left: 7, used: [{"s", 1}, {"p", 1}] },"k") == "k"
	end
	
end