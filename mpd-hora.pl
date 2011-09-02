#!/usr/bin/perl 
use strict;
use warnings;

use Audio::MPD;
use Encode; 

my $mpd = Audio::MPD->new;

&cue_hora; 

# loop forever
while (1) {
 
    open(MPC,"mpc idle player |") || die "Failed: $!\n";
    for (<MPC>)
    {
    my $current;
    eval { $current = encode("utf-8", $mpd->current) };
	if (/player\n/ && $current eq "hora.spx") 
	{
   	    print $current . "\n";
	    &spxcat; 
           #while (my ($key, $value) = each (%$status)) {
           #print "$key => $value\n";
           #}
	}
	
    }
}

sub spxcat
{
    $mpd->stop;
    my ($hour, $min) = &get_time;
    my $out_file = "/var/lib/mpd/hora/hora.spx";
    my $hour_file = "/var/lib/mpd/hora/HRS$hour.spx"; 
    my $min_file = "/var/lib/mpd/hora/MIN$min.spx"; 
    
    my $string = join(" ", ("/usr/local/bin/spxcat", $hour_file, $min_file, $out_file));

    system ("$string") == 0 or die "Cannot open pipe to spxcati ($?): $!";
    $mpd->play;
    1;
    #my @pipe;
    #for (<PIPE>){push(@pipe,$_); }
    #return @pipe;
}

sub get_time
{
    my @timeData = localtime(time);
    my $min = $timeData[1]; 
    my $hour = $timeData[2];
    for ($hour, $min) {
       if($_ eq "0") {$_ = "12"};
       if(length($_) == 1){$_ = "0" . $_};
    }
    return ($hour, $min);
}

sub cue_hora 
{
    my @items = $mpd->playlist->as_items;
    $mpd->playlist->add( 'hora.spx' );
    my $len = $#items += 1;  
    $mpd->playlist->move($len, 1)
}
