# Read a csv of word list
word_list<-read.csv("/replace_it_with_your_path/word_list.csv")

### SET THE WORD & INITIAL ENVIRONMENT
set_word()

### GAME ON
check_char(s, list_tf)

### FUNCTIONS
# Create a function to check if char is correct
check_char<-function(s, list_tf){
  
  # Prompt the user to input a char
  c <-readline(prompt = "Input your character: ")
  
  # Set n as the current location 0
  n <- 0
  # Used to validate ans later
  ans <- FALSE
  
  for (i in s[1:length(s)]){
    # Increment n by 1 to indicate a +1 change in current location
    n <- n + 1
    if (c == i) {
      # Set the value to TRUE when guessed correctly
      list_tf[n] <- TRUE
      assign("list_tf", list_tf, envir = .GlobalEnv)
      # set the value to TRUE when guessed correctly
      ans <- TRUE
    }
  }
  
  # Validate the ans and provide feedback
  if (ans){
    print("You make a correct guess!")
  } else {
    print("Wrong guess! Try again.")
    point <- point - 1
    assign("point", point, envir = .GlobalEnv)
  }
  
  # Reset all variables
  n <- 0
  ans <- FALSE
  
  cat("Your current point(s):", point, "\n")
  
  output()
  
  validate_win_lose()
}

validate_win_lose<-function(){
  
  if (point <= 0){
    print("GAME OVER")
    cat("The correct answer is ", hidden_word, sep = "", ".")
    again <- readline("Do you wanna start a new game? (yes or no) ")
    if (again == "yes"){
      set_word()
    }
  }
  
  if (sum(list_tf) == length(s)){
    print("YOU WON THE GAME!!!")
    again <- readline("Do you wanna start a new game? (yes or no) ")
    if (again == "yes"){
      set_word()
    }
  }
}

# Create a function for outputting the guessed char
output<-function(){
  
  # Output the current guessed words
  for (x in 1:length(s)){
    # if the list_tf[x] is TRUE
    if (list_tf[x]){
      current[x] <- s[x]
    } else {
      current[x] <- "_"
    }
  }
  
  print(noquote(current))
  assign("current", current, envir = .GlobalEnv)
}

# Set hidden word
set_word<-function(){
  hidden_word <<- word_list[sample(1:nrow(word_list), 1),1]
  s <<- unlist(strsplit(hidden_word, ""))

  ### INITIAL ENVIRONEMENT
  # Wet initial point to 10
  point <<- 10
  
  # Create a list for storing TRUE or FALSE
  list_tf <<- NULL
  
  # Set the initial value to FALSE
  list_tf[1:length(s)] <<- FALSE
  
  # Set user's current guess
  current <<- ""
}
