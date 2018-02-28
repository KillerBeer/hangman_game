defmodule Drawing do
  def drawing(7) do
  """
  HANGMAN: Moves left 7
     ____
    |
    |
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  def drawing(6) do
  """
  HANGMAN: Moves left 6
     ____
    |    |
    |
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  def drawing(5) do
  """
  HANGMAN: Moves left 5
     ____
    |    |
    |    o
    |
    |
   _|_
  |   |______
  |__________|
  """
  end

  def drawing(4) do
  """
  HANGMAN: Moves left 4
     ____
    |    |
    |    o
    |    |
    |    |
   _|_
  |   |______
  |__________|
  """
  end

  def drawing(3) do
  """
  HANGMAN: Moves left 3
     ____
    |    |
    |    o
    |   /|
    |    |
   _|_
  |   |______
  |__________|
  """
  end

  def drawing(2) do
  """
  HANGMAN: Moves left 2
     ____
    |    |
    |    o
    |   /|\\
    |    |
   _|_
  |   |______
  |__________|
  """
  end

  def drawing(1) do
  """
  HANGMAN: Moves left 1
     ____
    |    |
    |    o
    |   /|\\
    |    |
   _|_  /
  |   |______
  |__________|
  """
  end

  def drawing(0) do
  """
  HANGMAN   :(
     ____
    |    |
    |    o
    |   /|\\
    |    |
   _|_  / \\
  | * |______
  |__________|
  """
  end
end