# LINUX TEXT EDITOR
A linux text editor is a software application specifically designed for creating, modifying, and managing text files on a linux-based operating system.

There are several text editor, however we will be taking a look at 

- `VIM Text editors`
- `Nano text editor`

## VIM text editor
vim text editor is a powerful and versatile text editing tool deeply ingrained in the unix and linux ecosystem. In working with vim, we will run the following command 

- creating a file exercise.txt ![creating a file](./img/8.1.linux.png)

- Enter insert mode i : ![](./img/8.2.linux.png)

- Deleting a character: To delet a character, exit the insert mode, position the cursor on `t` in this and press `x`![deleting a character](./img/8.8.deletinga-char.linux.png)

- Deleting a line : To delete a line, ensure you are not in the insert mode.place the cursor on a line and press d twice. ![deleting a line](./img/8.4.linux.png)

- Undoing changes: Make a change(deleting a line) in this case.press escape to enter normal mode and press u to undo the deleted line. ![undo a deleted line](./img/8.5.undoing_change.linux.png)

- Saving changes: to save changes, exit the insert mode by pressing esc, the type :wq  ![saving changes](./img/8.6.saving%20change.linux.png)

- Quitting without saving: To quit the vim command without saving, type the command :q!  ![quittng command](./img/8.7.quitting%20wit.changing.linux.png)

## NANO text editor

Nano text editor is a user friendly test editor and widely used. To start we create a file nano_file.txt

- open a file, to open a file type the command ![open a file](./img/8.9.nano.open.linux.png)

- Entering and editing text: type a random text in the editor ![writing a text](./img/8.10.editing.linux.png)

- Saving changes : Save the changes by pressing `ctrl + o` and pressing `Enter`. ![saving changes](./img/8.11.saving.changelinux.png)

- Open an existing file: to open an existing file type nano existing_file.txt ![open an existing file](./img/8.12.oen%20existinglinux.png)

This ends the linux editor project.