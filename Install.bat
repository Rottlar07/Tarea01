echo Instalador de la base de datos Universidad
echo Autor: Rodrigo Misicano Callañaupa
echo 09 de Agosto del 2022
sqlcmd -SROTTLAR -E -i BDUniversidad.sql
sqlcmd -SROTTLAR -E -i BDUniversidadPA.sql
echo se ejecuto correctamente la base de datos
pause