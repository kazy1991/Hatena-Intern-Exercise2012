use strict;
use warnings;
use utf8;
use FindBin::libs;
package TemplateEngine;

sub new {
	my $class=shift;
	shift;
	my $dir=shift;
	bless  \$dir, $class;
}

sub render {
	my ($name, $hash) = @_;
	my $dir = ${$_[0]};					#ディレクトリの取得
	my %hash = %$hash;					#引数をデリファレンス
	my $title = escape($hash{'title'});			
	my $content = escape($hash{'content'});
	my $db;
		
	open( FH, "<:utf8", $dir) or die("can't find file");	#htmlファイルの読み込み
	my @html = <FH>;
	close (FH);

	for my $line (@html){				# htmlの改編
			$line =~ s/{% title %}/$title/g;
			$line =~ s/{% content %}/$content/g;
			$db=$db.$line;
	}
	return $db;						# 結果を出力
}
sub escape {
	my $str=$_[0];
	$str=~ s/&/&amp;/g;
	$str=~ s/>/&gt;/g;
	$str=~ s/</&lt;/g;
	$str=~ s/"/&quot;/g;
	return $str;
}
1;
