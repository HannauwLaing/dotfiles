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
echo "$BOLD_GREEN ~~~~~~~~~~Basic help~~~~~~~~$NC"
echo "$CYAN exit		e	$NC : close terminal"
echo "$CYAN eall			$NC : exit tmux"
echo "$CYAN clear		c	$NC : clear"
echo "$CYAN help		h	$NC : help"
echo "$CYAN zconfig		$NC : edit zsh config file"
echo "$CYAN hconfig		$NC : edit help config file"
echo "$CYAN tconfig		$NC : edit tmux config file"
echo "$CYAN nconfig		$NC : edit neovim config file"
echo "$CYAN htop			$NC : Advanced Task manager"
echo "$CYAN specs			$NC : See Computer specs"
echo "$CYAN cbg			$NC : Change BackGround"
echo "$CYAN rejbg			$NC : REJect BackGround"
echo ""
echo "$BOLD_GREEN ~~~~~~~~~~Exra help~~~~~~~~~$NC"
echo "$CYAN terminal		$NC : terminal help"
echo "$CYAN vim/nvim		$NC : vim help"
echo "$CYAN tmux			$NC : tmux help"
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
    echo "\n$GREEN*** Normal mode ***$NC\n"
    echo "$CYAN <space> o	           $NC|Opens NeoClip registers in telescope"
    echo "$CYAN	NeoClip: <Enter>   $NC|Adds selected entry to current register"
    echo "$CYAN	         <Ctrl + k>$NC|Pastes selected entry before cursor"
    
    echo "\n$GREEN*** InsertMode ***$NC\n"
    echo "$CYAN <C>r = <calculation>	$NC|Prints solution to math equation"

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
    echo "$CYAN <C>v$NC			|Enter Visual-Block mode"
    echo "$CYAN u$NC			|Change to Lower case"
    echo "$CYAN U$NC			|Change to Upper case"
    echo "$CYAN ~$NC			|Toggle to case"
    echo "$CYAN gc$NC			|Toggle Comments on highlighted lines"


    echo "\n$GREEN*** Movement ***$NC\n"
    echo "$CYAN hjkl$NC			|Left, Up, Down, Right$NC"
    echo "$CYAN<C> + hjkl$NC		|Move Screen Left, Up, Down, Right$NC"
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
echo "\n$GREEN*** Startup and Reload ***$NC\n"
echo "$CYAN Prefix (Prfx): $NC            Cntr-a                          $NC"
echo "$CYAN Prfx + Cntr-s $NC             Save setup                      $NC"
echo "$CYAN Prfx + Cntr-r $NC             Reload setup                    $NC"

echo "\n$GREEN*** Movement ***$NC\n"
echo "$CYAN Prfx + | $NC                  Split Horizontal                $NC"
echo "$CYAN Prfx + - $NC                  Split Vertical                  $NC"
echo "$CYAN Prfx + <h,j,k,l> $NC          Move between splits             $NC"
echo "$CYAN Prfx + z $NC                  Full screen split               $NC"

echo "\n$GREEN*** Sessions ***$NC\n"
echo "$CYAN Prfx + v $NC                  New Session                     $NC"
echo "$CYAN Prfx + \$ $NC                  Rename Session                  $NC"
echo "$CYAN Prfx + e $NC                  Show all Sessions               $NC"

echo "\n$GREEN*** Windows ***$NC\n"
echo "$CYAN Prfx + c $NC                  New Window                      $NC"
echo "$CYAN Prfx + , $NC                  Rename Window                   $NC"
echo "$CYAN Prfx + w $NC                  Show all Windows                $NC"
echo "$CYAN Prfx + <Num> $NC              Go to Window                    $NC"

}

extrahelp() {
echo "\n$BOLD_GREEN~~~~~~~~~~~~~ Extra help ~~~~~~~~~~~~~$NC\n"
echo "\n$GREEN*** Startup and Reload ***$NC\n"
echo "$CYAN oneko: $NC            Summons Cat                        $NC"
echo "$CYAN Prfx + Cntr-s $NC             Save setup                      $NC"
echo "\n$GREEN*** Windows ***$NC\n"

}


i=1;
if [ "$#" -eq 0 ]; then
	basichelp 	
fi


for a in "$@"
do
	if [ "$a" = "nvim" ]; then
		vimhelp | less
	fi
	if [ "$a" = "vim" ]; then
		vimhelp | less
	fi
	if [ "$a" = "tmux" ]; then
		tmuxhelp | less
	fi
	if [ "$a" = "terminal" ]; then
		terminalhelp | less
	fi
	if [ "$a" = "exstra" ]; then
		extrahelp | less
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

