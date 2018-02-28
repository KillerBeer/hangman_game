defmodule XYZ do
	use Application
	def start(_type, _args) do
		Hangman_initialization.start_link
	end
end