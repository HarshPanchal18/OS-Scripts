#!/bin/bash     
while(true)                                       
do
    clear                                                      
echo "Choose from the following operations: \n"            
echo "
    [a]addition
    [b]Substraction
    [c]Multiplication
    [d]Division"
    echo "--------------------------------------------------------"
    read -p "Your choice : " choice
    case $choice in
      [aA])
          read -p "Enter First Integer : " int1                      
          read -p "Enter Second Integer : " int2                     
          res=$((int1+int2))
          ;;
      [bB])
          read -p "Enter First Integer : " int1
          read -p "Enter Second Integer : " int2
          res=$((int1-int2)) ;;                                   
      [cC])                                                         
          read -p "Enter First Integer : " int1
          read -p "Enter Second Integer : " int2
          res=$((int1*int2)) ;;
       [dD])
          read -p "Enter First Integer : " int1
          read -p "Enter Second Integer : " int2
          res=$((int1/int2)) ;;
     *)  res=0
         echo "Wrong Choice "
         exit ;;
     esac

     echo "The Result is : " $res
     read -p "Do you wish to continue? [y]es of [n]o :" ans
     if [ $ans == 'n' ]
        then
          echo "Exiting the script. Have a nice day!"
        break
     else
        continue
     fi
done
