#!/usr/local/Cellar/bash/5.2.21/bin/bash

clear  # Clear the terminal screen

echo "Welcome to the Basic Calculator!"

while true; do
  echo "Enter your choice (1-5):"
  echo "1. Addition"
  echo "2. Subtraction"
  echo "3. Multiplication"
  echo "4. Division"
  echo "5. Exit"

  read -r choice

  case $choice in
    1)
      echo "Enter the first number:"
      read -r num1
      echo "Enter the second number:"
      read -r num2
      result=$((num1 + num2))
      echo "The sum is $result"
      ;;
    2)
      echo "Enter the first number:"
      read -r num1
      echo "Enter the second number:"
      read -r num2
      result=$((num1 - num2))
      echo "The difference is $result"
      ;;
    3)
      echo "Enter the first number:"
      read -r num1
      echo "Enter the second number:"
      read -r num2
      result=$((num1 * num2))
      echo "The product is $result"
      ;;
    4)
      echo "Enter the first number:"
      read -r num1
      echo "Enter the second number:"
      read -r num2
      if [[ $num2 -eq 0 ]]; then
        echo "Error: Division by zero is not allowed."
      else
        result=$((num1 / num2))
        echo "The quotient is $result"
      fi
      ;;
    5)
      echo "Exiting calculator..."
      exit 0
      ;;
    *)
      echo "Invalid choice. Please enter a number between 1 and 5."
      ;;
  esac
done
