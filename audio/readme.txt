==Audios de lectura de la hora en español==

==Licencia==
Audios grabados y editados  por Radio Comunitaria Yaxhil:
http://yaxhil.flujos.org 

Audios se encuentra bajo una Licencia Creative Commons Atribución 2.5 Mexico.
==Produccion==

Primer corte en Audacity exportado a ogg/vorbis. luego del ogg/vorbis a speex[1] con:

find . -name \*.ogg -exec gst-launch-0.10 filesrc location={} ! oggdemux ! vorbisdec ! audioconvert ! speexenc ! oggmux ! filesink location={}.spx  \;

luego los renombramos con:
rename 's/ogg/spx/' *.ogg


Claro que si puede combinar ambos pasos con un script. 
