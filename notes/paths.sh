ln -s /Pfad_1/echte_Datei /Pfad_2/Symlink
file /home/wiki/nullink
ls -l /home/wiki/nullink
from Users aus: erstellt symlink named DH dir in Users, DH contains 21S
ln -s boxHKW/UNI/21S DH

ln -s UNI/21S 21S from boxHKW contains: UNI (parent of 21S) (in shell, in R is correct)

try GitHUB dir link
~/Documents/GIT

ln -s ~/Documents/GIT gith aus sym 21S/DH, erstellt sym GIT in sym 21S/DH/gith
rm GIT aus sym 21s/dh/git: entfernt wieder

ln -s ~/Documents/GIT GIT-EWA aus sym 21s/dh erstellt sym real doc/GIT in sym dh