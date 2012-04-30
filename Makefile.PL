use inc::Module::Install;
 
# Define metadata
name           'mpd-hora';
version	       '0.2';
license        'perl'; 
# Specific dependencies
requires 'Audio::MPD';
requires 'Encode';
requires 'Proc::Daemon';
requires 'Getopt::Std';
requires_external_bin 'mpc';
install_script 'mpd-hora';
install_script 'spxcat';
 
WriteAll;
