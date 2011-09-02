==Audios de lectura de la hora en español==

==Licencia==
Audios grabados, editados y contribuidos al dominio publico
 por Radio Comunitaria Yaxhil: http://yaxhil.flujos.org. 

Estos Audios se encuentra bajo una Licencia Creative Commons Atribución 2.5 Mexico.
Basada en una obra en yaxhil.flujos.org.

==Produccion==

Primer corte en Audacity exportado a ogg/vorbis. luego del ogg/vorbis a speex[1] con:

find . -name \*.ogg -exec gst-launch-0.10 filesrc location={} ! oggdemux ! vorbisdec ! audioconvert ! speexenc ! oggmux ! filesink location={}.spx  \;

luego los renombramos con:
rename 's/ogg/spx/' *.ogg


Claro que si puede combinar ambos pasos con un script. 

Anotamos aqui para posteriordad que en realidad las grabaciones especificas de la hora (Es las x ) son la mitad de los ficheros que si ve acompañando a este documento. eso porque HRS12.spx es un enlace HRS00.spx, asi como HRS13.spx es un enlace a HRS01.spx y asi y adelante. 
