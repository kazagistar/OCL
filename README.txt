Copyright (C) 2012 Toxic Wolf <toxic.wolf@hotmail.co.uk>.

THIS DOCUMENT WAS WRITTEN IN NOTEPAD++ WITH WORD WRAP ON, IT IS SUGGESTED TO TURN IT ON WHEN READING THE DOCUMENT TOO!

README - OCL 0.4

<INSTALLATION INSTRUCTIONS>
Included in this OCL.zip archive is a folder called 'mods'. Drag and drop this folder into your .minecraft folder, and allow your computer to merge folders and overwrite files.
This is the only step required for end-users to install the OCL for the ComputerCraft mod.

If you have any questions or problems contact any of the developers at their email addresses above, or post a comment on the OCL thread at the ComputerCraft Forums.
</INSTALLATION INSTRUCTIONS>

<EXPLANATION>
The OCL (Operating system Compatibility Layer) is an API that allows a program to be portable across the multitude of alternative Operating Systems available for ComputerCraft, provided that they support it. 
The API provides a library of functions that are generally accepted as OS-specific, and in order for the developers of a certain OS to support this, they need to edit the template API (which should have been provided along with this archive), and edit these specific functions to suit their OS.
This ensures portability, as the programmer can just make one function call, and depending on what platform the OCL API is for will determine how the function is handled.
The OCL API template is included to set the standard for how the structure of OCL should be laid out, so if you want to support it in your OS, not too much editing should be required.
In order to be OCL-compliant, no functions should be added or removed else this will limit the level of compatibility and possibly introduce errors caused by calls to non-existent functions. No arguments to functions should be added, removed or re-ordered either, as the same applies.
</EXPLANATION>

<EXTRA NOTES>
As of OCL 0.4, I have added support for custom shells in Operating Systems. It allows small-footprint OSs (OSs that try to or do not overwrite any ComputerCraft files, allowing other computers to run normally [such as my own WolfOS]) to still have their own shells to overwrite default behaviour (such as preventing disk-booting) without affecting computers on a global scale.
The custom shell can be saved anywhere, which is also good for OSs that are installed in-game, as the ROM folder cannot be written to in-game.
The OCL shell must be installed to make use of this functionality however, but it will simulate default ComputerCraft shell behaviour if a custom shell is not loaded.

My goal with my input to OCL is to give as much power to so called small-footprint Operating Systems (or "Micro OSs") while still allowing as much compatibility as possible.
I also am trying to allow OSs to have functionality that they would only have by being installed globally (overwriting ComputerCraft files, and being on every computer by default) without the OCL.
The OCL is also designed with independant program writers in mind. Using the functions available in the OCL API, the programmer only needs to write his/her program once, and it should work fine on every OCL compatible OS that it is run on.
</EXTRA NOTES>