## CLI Shortcuts

**Navigation:**

- **Ctrl + a** : Move to the beginning of the line.
- **Ctrl + e** : Move to the end of the line.
- **Alt + b** : Move cursor back one word.
- **Alt + f** : Move cursor forward one word.
- **Ctrl + l** : Clear the screen.
- **Alt + <** : Move to the first line of the history.
- **Alt + >** : Move to the last line of the history.
- **Esc + t** : Switch between last two words before cursor.
- **Alt + t** : Switch current word with the previous one. 


**Editing:**

- **Ctrl + w** : Delete the last word.
- **Ctrl + k** : Delete from cursor to the end of the line.
- **Ctrl + u** : Delete from cursor to the beginning of the line.
- **Ctrl + y** : Paste the last item deleted or cut.
- **Alt + del** : Delete word before the cursor.
- **Alt + d** : Delete word after the cursor.
- **Ctrl + _** : Undo the last command.
- **Ctrl + x** : List possible completions of the current word.
- **Ctrl + xx** :  move between start of command line and current cursor position (and back again).


**Process Control:**

- **Ctrl + c** : Terminate the current command.
- **Ctrl + z** : Suspend the current command.
- **fg** : Resume a suspended process in the foreground.
- **bg** : Resume a suspended process in the background.
- **Ctrl + s** : Pause the output to the screen.
- **Ctrl + q** : Resume the output to the screen.
- **Alt + .** :  use the last word of the previous command.


**History:**

- **Ctrl + r** : Search backward through history.
- **Ctrl + s** : Search forward through history.
- **Ctrl + p** : Retrieve the previous command in history.
- **Ctrl + n** : Retrieve the next command in history.
- **Ctrl + g** :  escape from history searching mode.


**Other:**

- **Ctrl + c** :  terminate the command.
- **Ctrl + z** :  suspend/stop the command.
- **Ctrl + l** : Clear the screen (same as the clear command).
- **Ctrl + d** : Quit the Bash shell.
- **Ctrl + s** :  stops the output to the screen (for long running verbose command).
- **Ctrl + q** :  allow output to the screen (if previously stopped using command above).
- **!!** : Repeat the last command.
- **!blah** :  run the most recent command that starts with ‘blah’ (e.g. !ls).
- **!blah** :p** :  print out the command that !blah would run (also adds it as the latest command in the command history).
- **!$** :  the last word of the previous command (same as Alt + .).
- **!$** :p** :  print out the word that !$ would substitute.
- **!** :  the previous command except for the last word (e.g. if you type ‘find some_file.txt /‘, then !- **would give you ‘find some_file.txt‘).
- **!:p** :  print out what !* would substitute.
- If you type a command and run it, you can re-run the same command but substitute a piece of text for another piece of text using ^^.

