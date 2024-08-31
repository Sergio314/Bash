System and Package Management
------------------------------
1. Update and Upgrade Packages:
   sudo apt update && sudo apt upgrade
2. Install a Package:
   sudo apt install <package_name>
3. Remove a Package:
   sudo apt remove <package_name>
4. Check System Resource Usage:
   top
   or
   htop  # More user-friendly, requires installation
5. View Disk Usage:
   df -h
6. View Directory Sizes:
   du -sh *
Version Control (Git)
----------------------
1. Clone a Repository:
   git clone <repo_url>
2. Check Branches:
   git branch
3. Create a New Branch:
   git checkout -b <branch_name>
4. Commit Changes:
   git commit -m "Your commit message"
5. Push to Remote:
   git push origin <branch_name>
Web Server Management (Nginx/Apache)
--------------------------------------
1. Restart Nginx:
   sudo systemctl restart nginx
2. Restart Apache:
   sudo systemctl restart apache2
3. Check Nginx/Apache Status:
   sudo systemctl status nginx
   or
   sudo systemctl status apache2
4. View Nginx/Apache Logs:
   tail -f /var/log/nginx/error.log
   or
   tail -f /var/log/apache2/error.log
Database Management (MySQL/PostgreSQL)
---------------------------------------
1. MySQL:
   - Login to MySQL:
     mysql -u root -p
   - Show Databases:
     SHOW DATABASES;
   - Select a Database:
     USE <database_name>;
   - Backup a Database:
     mysqldump -u root -p <database_name> > backup.sql
2. PostgreSQL:
   - Login to PostgreSQL:
     psql -U postgres
   - List Databases:
     \l
   - Connect to a Database:
     \c <database_name>
   - Backup a Database:
     pg_dump <database_name> > backup.sql
Development and Deployment
----------------------------
1. Install Node.js and npm:
   sudo apt install nodejs npm
2. Run a Node.js Application:
   node app.js
3. Install Python and pip:
   sudo apt install python3 python3-pip
4. Run a Python Application:
   python3 app.py
5. Install Virtual Environment:
   python3 -m venv venv
6. Activate Virtual Environment:
   source venv/bin/activate
Docker
-------
1. Install Docker:
   sudo apt install docker.io
2. Start/Stop Docker Service:
   sudo systemctl start docker
   sudo systemctl stop docker
3. List Running Containers:
   docker ps
4. Run a Container:
   docker run -d -p 80:80 <image_name>
File and Process Management
----------------------------
1. List Files and Directories:
   ls -la
2. Copy Files:
   cp <source> <destination>
3. Move/Rename Files:
   mv <source> <destination>
4. Kill a Process:
   kill <process_id>
5. Find a Process by Name:
   ps aux | grep <process_name>
6. PWD:
   The pwd command allows you to print the current working directory on your terminal.
7. RM:
   To delete a directory, you must add the -r argument to it. 
   Without the -r argument, the rm command won’t delete directories.
   rm -ri <folder/directory name> (-i is with prompt to delete & think)
8. touch:
   The touch command in Linux creates an empty file or updates the timestamp of an existing file.
   touch <filename>
9. ln:
   ln -s <source path> <link name>
   (symbolic link to that file, the link is only a pointer to the original file. If you delete the original file, the link will be broken, as it no longer has anything to point to.)
   ln <source path> <link name> 
   (
    WITHOUT -s it is a hard link, which:
    A hard link is a mirror copy of an original file with the exact same contents. Like symbolic links, if you edit the contents of the original file, those changes will be reflected in the hard link. If you delete the original file, though, the hard link will still work, and you can view and edit it as you would a normal copy of the original file.
   )
10. main text commands(cat, echo, less):
    cat <file name>
    echo <Text to print on terminal>
    less use only with the "pipe" | : cat /boot/grub/grub.cfg  | less
    The less command allows the user to break down the output and scroll through it with the use of the enter or space keys.

    Note: Use the -S flag with less to enable line wrapping. This will allow you to view long lines of text without scrolling horizontally.

    Use the -N flag with less to display line numbers. 
    This can be useful when you need to know the line number of a specific piece of text.

    You can use these useful flags in the following way:

    root@ubuntu:~# cat /boot/grub/grub.cfg | less -SN
    Using less with the pipe operator can be useful in many different situations. Here are a few examples:

    Viewing the output of a long-running command, such as top or htop.
    Searching for specific text in the output of a command, such as grep or cat.
11. uname & whoami:
    The uname command in Linux displays information about the system’s kernel, including the kernel name, hostname, kernel release, kernel version, and machine hardware name.
    The whoami command in Linux returns the current user’s username. It stands for “who am I?” and it’s often used to determine the current user’s identity in shell scripts or the terminal.    
    NOTE:
    The parameter -a with uname command stands for “all”. This prints out the complete information. If the parameter is not added, all you will get as the output is “Linux”.
    Note: Some important flags you can use with the uname command.
    Use uname -s to display the kernel name.
    Use uname -n to display the hostname.
    Use uname -r to display the kernel release.
    Use uname -v to display the kernel version.
    Use uname -m to display the machine hardware name.
12. grep:
    The grep command is a powerful and versatile text search tool in Linux and Unix-based operating systems. It can search for specific patterns or strings in one or more files and filter the output of other commands.
    The grep command stands for “global regular expression print,” which reflects its ability to search for regular expressions across multiple lines and files.
    root@ubuntu:~# <Any command with output> | grep "<string to find>"
    MORE HERE: [text](https://www.digitalocean.com/community/tutorials/grep-command-in-linux-unix)
13. head <filepath>: Displays the first 10 lines of a file.
    tail <filepath>: Displays the last 10 lines of a file.
14. diff <filepath1> <filepath2>: Compares two files and shows differences.
15. cmp <filepath1> <filepath2>: Compares two files byte by byte. display the first byte that is different between them.
16. comm <filepath1> <filepath2>: Compares two sorted files line by line. 
    The text that’s aligned to the left is only present in file 1. The centre-aligned text is present only in file 2. And the right-aligned text is present in both files.
17. sort <filepath>: Sorts the lines of a file.
    Sorts lines in ASCII collating sequence, which can lead to unexpected results when sorting numbers or special characters. To sort numbers in numerical order, you can use the -n option.
    The sort command can also be used to sort lines based on specific fields using the -k option.
    Here’s an example of using the -k option:
    `root@ubuntu:~# sort -k 2 file.txt` This command will sort the lines in file.txt based on the second field.
18. export <var>=<value>: Sets an environment variable.
    Without any arguments, the command will generate or display all exported variables. Below is an example of the expected output.
    view all exported variables on the current shell: `export -p`
     In this example, we are exporting the function name (). First, call the function
     name () { echo "Hello world"; }
     Then export it using the -f flag
     export -f name
     Next, invoke bash shell  $ bash
     Finally, call the function in bash
     $ name 
     Output - Hello World
     You can also assign a value before exporting a function as shown
     $ export name[=value]
     For example, $ student=Divya
     $ export student
     $ printenv students -> Divya(output)
19. ssh <user>@<server>: Connects to a remote server via SSH. `root@ubuntu:~ ssh username@remote-server`
    The ssh command supports a wide range of options and configurations, including:
    Configuring authentication methods (password, public key, etc.)
    Configuring encryption algorithms
    Configuring compression
    Configuring port forwarding
    Configuring X11 forwarding
    Configuring SSH keys
20. service <service> <action>: Manages system services (e.g., status, start, stop).
21. ps: Displays active processes.
      Display a list of all running processes: `ps -ef`
      Display a list of all processes for a specific process ID (PID): `ps -p PID`
      `With the use of the & symbol, we can pass a process into the background`
22. kill <PID>: Terminates a process by its PID.
      If the program is misbehaving and does not exit when given the TERM signal, you can escalate the signal by passing the KILL signal:    You can pass “-15” instead of “-TERM”, and “-9” instead of “-KILL”.
      `kill -KILL PID_of_target_process`
      You can list all of the signals that are possible to send with kill with the -l flag:
      `kill -l`
23. killall <name>: Terminates all processes by name.
24. df -h: Displays disk space usage in human-readable form.
25. mount <device> <dirpath>: Mounts a filesystem or device.
26. chmod <mode> <filepath>: Changes file permissions(MORE in chmod.md).
27. chown <user>:<group> <filepath>: Changes file ownership (MORE in chown.md).
28. ifconfig: Displays network interface information.
29. traceroute <destination>: Traces the route of network packets.
30. wget <URL>: Downloads files from the web.
31. ufw allow <port>: Allows traffic on a specified port.
32. iptables: Configures packet filtering rules.
33. cal: Displays a calendar.
34. alias <name>=<command>: Creates a shortcut for a command.
35. dd if=<input> of=<output>: Copies and converts files.
36. whereis <command>: Locates the binary, source, and manual page for a command.
37. whatis <command>: Provides a brief description of a command.
38. top: Displays real-time system processes and resource usage.
39. useradd <user>: Adds a new user.
40. usermod <user>: Modifies an existing user account.
41. passwd: Changes a user's password.
42. find . -type f -name "*.txt" Here’s an example of the find command that will give you all the files that end with .txt extension in the current directory.
43. nice & renice:
      When you ran `top` at the beginning of the article, there was a column marked “NI”. This is the nice value of the process:
      Nice values can range between -19/-20 (highest priority) and 19/20 (lowest priority) depending on the system.
      To run a program with a certain nice value, you can use the nice command:
      `nice -n 15 command_to_execute`
      This only works when beginning a new program.
      To alter the nice value of a program that is already executing, you use a tool called renice:
      `renice 0 PID_to_prioritize`

Networking
-----------
1. Check Open Ports:
   sudo netstat -tuln
2. Ping a Host:
   ping <hostname_or_ip>
3. Check Current Network Configuration:
   ifconfig
4. Download a File:
   wget <url>
   or
   curl -O <url>
Log Management
--------------
1. View System Logs:
   tail -f /var/log/syslog
2. Clear Log Files:
   sudo truncate -s 0 /var/log/syslog
Security
--------
1. Manage Firewall with UFW:
   - Enable Firewall:
     sudo ufw enable
   - Allow Specific Port:
     sudo ufw allow 80/tcp
   - Check UFW Status:
     sudo ufw status

