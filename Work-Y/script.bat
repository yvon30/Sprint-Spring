@echo off

rem Cemain ers la repertoire temp
set tempsrc="tempsrc"

rem Nom du FrameWork
set work=work
set controlleur="controlleur"

rem Supression des Framework précedent dans lib
if exist "lib/%work%.jar" (
    rd /S /Q "lib/%work%.jar"
    echo Le fichier %work%.jar a ete suprpimer avec succes.
)

mkdir "%tempsrc%"
echo le nouveau dossier %tempsrc% a ete creer avec succes

rem Copie les resources dans le tempsrc
for /r %controlleur% %%f in (*.java) do copy "%%f" "%tempmsrc%"

rem Compilation de tous les fichiers Java du tempsrc
javac -cp "lib/*" -d "." "%tempsrc%\*.java"

rem Decompresser en jar
jar -cf "%work%.jar" "%controleur"

rem Supression du dossier controlleur et tempsrc
if exist "%controlleur%" (
    rd /s /Q "%controlleur%"
    echo le dossier %controlleur% et son contenu ont ete suprpimer.
)

if exist "%tempsrc%" (
    rd /S /Q "%tempsrc%"
    echo le dossier %tempsrc% et son contenu ont ete suprpimer.
)

rem Déplacer le fichier .jar dans le lib
move "%work%.jar" "lib/"

pause
