defmodule Dictionary do
	@location "D:\\elixir\\hangman_game\\Dictionary.txt"
	def random_word do
		{state,word} = File.read(@location)
		case state do
			:error -> raise ArgumentError
			:ok	-> words=String.split(word, "\r\n", trim: true)
			Enum.random(words)
			|>String.downcase
		end
	end
end