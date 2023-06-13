# Syntax-Analysis-of-C-Right-shift-and-Left-Shift-Operators-Pre-increment-and-Post-Increment-
checks whether the given the Syntax is correct or not  for C++:Right-shift-and-Left-Shift-Operators,Pre-increment-and-Post-Increment
ALL COMMANDS SHOULD BE RUN ON TERMINAL


Install Lex and Yacc:
Lex: Lex is usually bundled with the Unix operating system. If you are using a Unix-like system, it should already be installed. 
      Otherwise, you can install it separately.
Yacc: Yacc is also commonly available on Unix-like systems. If not, you can install the GNU Bison package, which is a Yacc replacement.

Create a file with a.l extension (e.g., lexer.l) to define the Lex specifications.

Generate the Lex C code:
Use the Lex command to generate the C code from your Lex specification file. The command is typically lex <input_file.l>.
This will generate a C file with the same name as your Lex specification file but with a .c extension (e.g., lexer.c).
for here Example command: flex project2.l (for windows)
                          lex project2.l (for Unix)
 
Generate the Yacc C code:
Use the Yacc command to generate the C code from your Yacc specification file. The command is typically yacc -d <input_file.y>.
This will generate a C file with the same name as your Yacc specification file but with a .tab.c extension (e.g., parser.tab.c).
It will also generate a header file with the same name but with a .tab.h extension (e.g., parser.tab.h).
for here Example command: bison -d project2.y  (for windows)
                          yacc -d parser.y     (for unix)
  
all commands together
    bison -d project2.y
    flex project2.l
    gcc lex.yy.c project2.tab.c
     
    this will create a.exe file 
    a.exe
