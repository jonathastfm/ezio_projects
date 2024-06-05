
import random

def roulette():
    guess = random.randint(1, 6)

    input("Press Enter to SHoot the Roulette! ")

    if guess == 1:
        print("You Died!")
    else:
        print("You are still alive!")
        print("The bullet was in chamber", guess)


while(True):
    roulette()
    print("Do you want to play again?")
    answer = input("Yes or No: ")
    if answer == "No":
        break
    else:
        continue


