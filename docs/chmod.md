Symbolic Notation
In symbolic notation, the permissions are specified using letters.

Entities:
`u: User (owner)`
`g: Group`
`o: Others`
`a: All (u, g, and o)`
Actions:
`+: Add permission`
`-: Remove permission`
`=: Set exact permission (removes others)`
Permissions:
`r: Read (4)`
`w: Write (2)`
`x: Execute (1)`
`X: Execute only if the file is a directory or already has execute permission for some user`
`s: Set UID/GID on execution (u+s or g+s)`
`t: Sticky bit (restricts deletion or modification of files in a directory)`
Examples:
`chmod u+r file: Adds read permission for the user.`
`chmod g-w file: Removes write permission for the group.`
`chmod o=x file: Sets execute permission for others and removes read/write.`
`chmod a+x file: Adds execute permission for all.`
`chmod u+s file: Sets the setuid bit for the user.`
`chmod g+s file: Sets the setgid bit for the group.`
`chmod o+t dir: Sets the sticky bit on a directory.`
Numeric (Octal) Notation
In octal notation, permissions are represented by three digits, each ranging from 0 to 7.

Digits:
`0: No permission (---)`
`1: Execute-only (--x)`
`2: Write-only (-w-)`
`3: Write and execute (-wx)`
`4: Read-only (r--)`
`5: Read and execute (r-x)`
`6: Read and write (rw-)`
`7: Read, write, and execute (rwx)`
Structure:
`The first digit represents the user's permissions.`
`The second digit represents the group's permissions.`
`The third digit represents others' permissions.`
Examples:
`chmod 755 file`: Read, write, and execute for the user; read and execute for group and others (rwxr-xr-x).
`chmod 644 file`: Read and write for the user; read-only for group and others (rw-r--r--).
`chmod 700 file`: Read, write, and execute for the user; no permissions for group and others (rwx------).
`chmod 777 file`: Full permissions for everyone (rwxrwxrwx).
Special Permissions (Using Fourth Digit):
`SetUID (4XXX): Allows a file to be executed with the permissions of the file owner (e.g., chmod 4755).`
`SetGID (2XXX): Allows a file to be executed with the permissions of the file's group (e.g., chmod 2755).`
`Sticky Bit (1XXX): Used mainly for directories; restricts file deletion (e.g., chmod 1755).`
Combined Examples:
`chmod 4755 file: SetUID, and read, write, execute for the user; read and execute for group and others.`
`chmod 2755 file: SetGID, and read, write, execute for the user; read and execute for group and others.`
`chmod 1777 dir: Sticky bit, and full permissions for everyone on a directory.`
This combination of symbolic and numeric notations allows precise control over file and directory permissions.