#!/bin/bash

# use echo   echo "What's your name?"   
# echo -e(basklash escape chars) "\nWelcome to bash tutorial" $entered_name

# use read -> read entered_name 
# read var_name -> it will store read value in it's own var same_country=$country
# use chmod u+x first.sh -> give permissions to exec the script
# use run other scripts? -> sh run_all.sh || bash run_all.sh || ./run_all.sh

# VARS: country=Poland(this format)
# Variable names should start with a letter or an underscore (_).
# Variable names can contain letters, numbers, and underscores (_).
# Variable names are case-sensitive.
# Variable names should not contain spaces or special characters.
# Use descriptive names that reflect the purpose of the variable.
# Avoid using reserved keywords, such as if, then, else, fi, and so on as variable names.
# To list all the environment variables, 
# use the command "env" (or "printenv"). 
# You could also use "set" to list all the variables, 
# including all local variables.
# --------
# To set an environment variable, use the command 
# "export varname=value", which sets the variable and exports it to the 
# global environment (available to other processes). 
# Enclosed the value with double quotes if it contains spaces.
# ---------
# To set a local variable, use the command 
# "varname=value" (or "set varname=value"). 
# Local variable is available within this process only.
# ---------
# To unset a local variable, use command "varname=", 
# i.e., set to empty string (or "unset varname").

# This code reads each line from a file named input.txt and prints it to the terminal. We'll study while loops later in this article.
# while read line
# do
#   echo $line
# done < input.txt

# Command line arguments
# In a bash script or function, $1 denotes the initial argument passed, $2 denotes the second argument passed, and so forth.
# We have supplied Zaira as our argument to the script when typing as ./first.sh Zaira for example.
# echo "Hello, $1!"


# Writing to a file:
# echo "This is some text." > output.txt
# This writes the text to a file named output.txt. Note that the >operator overwrites a file if it already has some content.
# Appending to a file:
# echo "More text." >> output.txt


# Basic Bash commands (echo, read, etc.)
# Here is a list of some of the most commonly used bash commands:
#     cd: Change the directory to a different location.
#     ls: List the contents of the current directory.
#     mkdir: Create a new directory.
#     touch: Create a new file.
#     rm: Remove a file or directory.
#     cp: Copy a file or directory.
#     mv: Move or rename a file or directory.
#     echo: Print text to the terminal.
#     cat: Concatenate and print the contents of a file.
#     grep: Search for a pattern in a file.
#     chmod: Change the permissions of a file or directory.
#     sudo: Run a command with administrative privileges.
#     df: Display the amount of disk space available.
#     history: Show a list of previously executed commands.
#     ps: Display information about running processes.


# Let's see an example of a Bash script that uses if, if-else, 
#     and if-elif-else statements to determine if a user-inputted number is positive, negative, or zero:
#     echo "Please enter a number: "
#     read num
# if [ $num -gt 0 ]; then
#   echo "$num is positive"
# elif [ $num -lt 0 ]; then
#   echo "$num is negative"
# else
#   echo "$num is zero"
# fi


# !!!!Looping and Branching in Bash
# WHILE LOOP:
#     i=1
#     while [[ $i -le 10 ]] ; do
#     echo "$i"
#     (( i += 1 ))
#     done
# FOR LOOP:
#     for i in {1..5}
#     do
#         echo $i
#     done
# CASE STATEMENT:
#     fruit="apple"
#     case $fruit in
#         "apple")
#             echo "This is a red fruit."
#             ;;
#         "banana")
#             echo "This is a yellow fruit."
#             ;;
#         "orange")
#             echo "This is an orange fruit."
#             ;;
#         *)
#             echo "Unknown fruit."
#             ;;
#     esac


# !!!!!!!! How to Schedule Scripts using cron:
# Syntax to schedule crons:
# Cron job example
#   * * * * * sh /path/to/script.sh
# Here, the *s represent minute(s) hour(s) day(s) month(s) weekday(s), respectively.
# Below are some examples of scheduling cron jobs.
# SCHEDULE	DESCRIPTION	                                                EXAMPLE
# 0 0	        Run a script at midnight every day	                    0 0 /path/to/script.sh
# /5	        Run a script every 5 minutes	                        /5 /path/to/script.sh
# 0 6 1-5	    Run a script at 6 am from Monday to Friday	            0 6 1-5 /path/to/script.sh
# 0 0 1-7	    Run a script on the first 7 days of every month	        0 0 1-7 /path/to/script.sh
# 0 12 1	    Run a script on the first day of every month at noon    0 12 1 /path/to/script.sh


# Using crontab
# The crontab utility is used to add and edit the cron jobs.
# crontab -l lists the already scheduled scripts for a particular user.
# You can add and edit the cron through crontab -e.
# MORE here -> https://www.freecodecamp.org/news/cron-jobs-in-linux/


#!!!!!!! How to Debug and Troubleshoot Bash Scripts:
# Set the set -x option:
#           #!/bin/bash
#           set -x
#           Your script goes here
# ----------------------------------------------------
# Check the exit code:
# When Bash encounters an error, it sets an exit code that indicates the nature of the error. 
# You can check the exit code of the most recent command using the $? variable. 
# A value of 0 indicates success, while any other value indicates an error.
#             #!/bin/bash
#             # Your script goes here
#             if [ $? -ne 0 ]; then
#                 echo "Error occurred."
#             fi
# -----------------------------------------------------
# Use "echo" statements
# -----------------------------------------------------
# Use the set -e option:
# This option will cause Bash to exit with an error if any command in the script fails, 
# making it easier to identify and fix errors in your script.
#         #!/bin/bash
#         set -e
#         # Your script goes here
# -----------------------------------------------------
# Troubleshooting crons by verifying logs:
# For Ubuntu/Debian, you can find cronlogs at: /var/log/syslog
# 
# Check if you're using gnome or KDE/else:
# in bash -> `env | grep -E "XDG_CURRENT_DESKTOP|GDMSESSION"`
# or equivalent -> `env | grep -e "XDG_CURRENT_DESKTOP" -e "GDMSESSION"`
# or `grep -f patterns.txt``: Use if you have a file with patterns.


