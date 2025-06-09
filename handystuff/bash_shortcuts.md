## CLI Shortcuts

**Navigation:**

- **Ctrl + a** : Move to the beginning of the line.
- **Ctrl + e** : Move to the end of the line.
- **Alt + b** : Move cursor back one word.
- **Alt + f** : Move cursor forward one word.
- **Alt + t** : Switch current word with the previous one.
- **Esc + t** : Switch between last two words before cursor.



**Editing:**

- **Alt + d** : Delete word after the cursor.
- **Alt + del** : Delete word before the cursor.
- **Ctrl + _ **: Undo the last command.
- **Ctrl + k** : Delete from cursor to the end of the line.
- **Ctrl + u** : Delete from cursor to the beginning of the line.
- **Ctrl + w** : Delete the last word.
- **Ctrl + x** : List possible completions of the current word.
- **Ctrl + xx** : Move between start of command line and current cursor position (and back again).
- **Ctrl + y** : Paste the last item deleted or cut.


**Process Control:**

- **Alt + .** : Use the last word of the previous command.
- **Ctrl + c** : Terminate the current command.
- **Ctrl + q** : Resume the output to the screen.
- **Ctrl + s** : Pause the output to the screen.
- **Ctrl + z** : Suspend the current command.
- **bg** : Resume a suspended process in the background.
- **fg** : Resume a suspended process in the foreground.


**History:**

- **Alt + <** : Move to the first line of the history.
- **Alt + >** : Move to the last line of the history.
- **Ctrl + g** : Escape from history searching mode.
- **Ctrl + n** : Retrieve the next command in history.
- **Ctrl + p** : Retrieve the previous command in history.
- **Ctrl + r** : Search backward through history.
- **Ctrl + s** : Search forward through history.


**Other:**

- **!!** : Repeat the last command.
- **!$** : Use the last word of the previous command (same as Alt + .).
- **!$:p** : Print out the word that !$ would substitute.
- **!** : Repeat the last command except for the last word (e.g. if you type ‘find some_file.txt /‘, then !- **would give you ‘find some_file.txt‘).
- **!:p** : Print out what !* would substitute.
- **!blah** : Run the most recent command that starts with ‘blah’ (e.g. !ls).
- **!blah:p** : Print out the command that !blah would run (also adds it as the latest command in the command history).
- **Ctrl + c** : Terminate the command.
- **Ctrl + d** : Quit the Bash shell.
- **Ctrl + l** : Clear the screen (same as the clear command).
- **Ctrl + q** : Allow output to the screen (if previously stopped using command above).
- **Ctrl + s** : Stops the output to the screen (for long running verbose command).
- **Ctrl + z** : Suspend/stop the command.
