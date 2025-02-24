RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color (resets to default)

BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_PURPLE='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

basichelp() {
echo "~~~~~~~~~~~Basic help~~~~~~~~"
clear
echo "exit		e	: exit"
echo "clear		c	: clear"
echo "help		h	: help"
echo "hconfig			: edit help file"
echo "htop			: Advanced Task manager"
echo "specs			: See Computer specs"
echo ""
echo "~~~Exra help~"
echo "terminal		: terminal"
echo "vim/nvim		: vim"
echo "tmux			: tmux"
}

echo "$CYAN			$NC "

terminalhelp() {
clear
echo "$BOLD_GREEN~~~~~~~~~~~Terminal help~~~~~~~~$NC"
echo "$BOLD_GREEN***Terminal managment***$NC"
echo "$CYAN clear				$NC cleans terminal"
echo "$CYAN echo "Hello"			$NC prints hello"
echo "$CYAN e				$NC  exits terminal"
echo ""
echo "$BOLD_GREEN***Directory management***$NC"
echo "$CYAN ls				$NC list contents of the current directory"
echo "$CYAN pwd				$NC Print current Direcory"
echo "$CYAN mkdir				$NC make directory"
echo "$CYAN cd				$NC go to home directory"
echo "$CYAN cd <directory>			$NC go to directory"
echo "$CYAN cd ../				$NC go to parant directory (go up one level)"

echo ""
echo "$BOLD_GREEN***File management***$NC"
echo "$CYAN cat <text file>			$NC prints contents of file"
echo "$CYAN wc <f1>			$NC shows # of lines, words, bytes in file"
echo "		$NC -a -> include hidden	-l -> long format	$NC -F -> Formatted disply"
echo ""
echo "$CYAN mv <dir1>/<f1> <dir2>/<f2>	$NC moves file to new dir, can also rename file"
echo "$CYAN cp <dir1>/<f1> <dir2>/<f2>	$NC copies file to new dir, can also rename file"
echo "$CYAN rm <f1>				$NC deletes file"
echo "$CYAN rm -r <dir>			$NC recursuvely deletes dir"
echo "$CYAN chmod +rwx <f1>			$NC adds premitions to file"


echo "$BOLD_GREEN***Compression management***$NC"
echo "$CYAN tar -cvzf <t1>.tgz <dir>	$NC compresses dir"
echo "$CYAN tar -xvzf <t1>.tgz		$NC uncompress tar"

echo "$BOLD_GREEN***Search management***$NC"
echo "$CYAN grep <text> <f1>		$NC prints all lines that contain <text>"
echo "$CYAN grep –H <text> <dir>		$NC prints file names containing <text>"
echo "$CYAN grep –r <text> <dir>		$NC reqursufly searches for <text> in dir"
echo "$CYAN man <command>			$NC displays manual for <command>"
}


vimhelp() {
    echo "\n$BOLD_GREEN~~~~~~~~~~~~~ Vim help ~~~~~~~~~~~~~$NC\n"
    echo "\n$GREEN*** Editing ***$NC\n"
    echo "$CYAN r$NC			|Replace singel character"
    echo "$CYAN R$NC			|Enter Replace mode"
    echo "$CYAN<< $NC/ $CYAN>>$NC			|Indent the current line"
    echo "$CYAN cc$NC			|Clear line and enter insert mode"
    echo "$CYAN C$NC			|Clear till end of line and enter insert mode"
    echo "$CYAN i$NC			|Enter insert mode before character"
    echo "$CYAN I$NC			|Enter insert mode at start of Line"
    echo "$CYAN a$NC			|Enter insert mode after character"
    echo "$CYAN A$NC			|Enter insert mode at end of Line"
    echo ""
    echo "$CYAN :reg$NC			|Sees previous copied items"
    echo "$CYAN \"1p$NC			|Pastes the (1)th item in memory"

    echo "\n$GREEN*** Visual mode ***$NC\n"
    echo "$CYAN v$NC			|Enter visual mode"
    echo "$CYAN V$NC			|Enter Visual-Line mode"
    echo "$CYAN <cntr>v$NC		|Enter Visual-Block mode"
    echo "$CYAN u$NC			|Change to Lower case"
    echo "$CYAN U$NC			|Change to Upper case"
    echo "$CYAN ~$NC			|Toggle to case"

    echo "\n$GREEN*** Movement ***$NC\n"
    echo "$CYAN hjkl$NC			|Left, Up, Down, Right$NC"
    echo "$CYAN<Ctrl> + hjkl$NC		|Move Screen Left, Up, Down, Right$NC"
    echo "$CYAN<num>gg$NC			|Go to line <number>$NC"
    echo "$CYAN 0 $NC/$CYAN $ $NC			|Start/End of line$NC"
    echo "$CYAN^$NC			|First Non-blank character of line$NC"
    echo "$CYAN gg $NC/$CYAN G$NC			|Start/End of file$NC"
    echo "$CYAN gd$NC			|Go-to definition$NC"
    echo "$CYAN[[ / ]]$NC			|Start/End of function$NC"

    echo "\n$GREEN*** Marks ***$NC\n"
    echo "$CYAN\`0$NC			|In last edited file$NC"
    echo "$CYAN\`\`$NC			|Jump to previous position before jump$NC"
    echo "$CYAN\`[$NC / $CYAN\`]$NC			|Jump to start/end of section changed or yanked$NC"
    echo "$CYAN m<key>$NC			|Create mark called <key>$NC"
    echo "$CYAN'<key>$NC			|Jump to mark called <key>$NC"
    echo "$CYAN:marks$NC			|Shows all marks$NC"
    echo "$CYAN:delm <key>$NC		|Deletes mark <key>$NC"
    #echo ""

}

tmuxhelp() {
clear
echo "~~~~~~~~~~~tmux help~~~~~~~~"
echo "Prefix(Prfx):		Cntr-a"
echo "Save setup		Prfx + Cntr-s"
echo "Relaod setup		Prfx + Cntr-r"
echo "Close session		Prfx:q"
echo ""
echo "Split Horisontal	Prfx + | "
echo "Split Vertical		Prfx + - "
echo "Move between Splits	Prfx + <h,j,k,l>"
echo "Full screen split		Prfx + z"
echo ""
echo "New Session		Prfx + :new-session"
echo "Rename Session		Prfx + $"
echo "Go To session		Prfx + w"
echo ""
echo "New window		Prfx + c"
echo "Rename window		Prfx + ,"
echo "GoTo window		Prfx + <Num>"

}


i=1;
if [ "$#" -eq 0 ]; then
	echo "test1"
	basichelp	
fi


for a in "$@"
do
	if [ "$a" = "vim" ]; then
		vimhelp | less
	fi
	if [ "$a" = "tmux" ]; then
		tmuxhelp | less
	fi
	if [ "$a" = "terminal" ]; then
		terminalhelp | less
	fi
done


exit;
echo ""

echo ""

echo "touch [file]     : makes [file]"
echo "mkdir [folder]   : makes [folder]"
echo "nvim [file_path] : opens [file]"

echo ""

echo "pj: Open project folder"
echo "tu: Open tutorial folder"
echo "cbg: Change background"
echo "oneko: summons cat"
echo "funcode: funcode"
echo "kc: kills all cat"
echo ""

