# Hangman Game

### Introduction
This hangman game adopted on R, like the conventional one, challenges players to guess a hidden word by inputting characters one at a time. With each correct guess, the word is gradually revealed. However, players must be strategic, as incorrect guesses will decrease their remaining points. The game ends when players either successfully guess the word or run out of points.

### Game Description

1. **Set Up:** 
   - The game begins by selecting a random word from a predefined word list stored in the `word_list.csv` file. 
   - Players start with 10 points, represented by their remaining attempts.

2. **Guessing Characters:**
   - Players are prompted to input a character to guess.
   - If the character matches any letters in the hidden word, those letters are revealed.
   - Incorrect guesses result in a deduction of one point.

3. **Feedback:**
   - After each guess, players receive feedback on whether their guess was correct or incorrect.
   - The current status of the word, including revealed letters and placeholders for unrevealed letters, is displayed.

4. **Winning and Losing:**
   - The game continues until players either successfully guess the entire word or run out of points.
   - If players correctly guess the word, they win the game and have the option to start a new game.
   - If players run out of points before guessing the word, they lose the game. The correct word is revealed, and players have the option to start a new game.

5. **Game Reset:**
   - After each game, players have the option to start a new game if they wish to continue playing.
