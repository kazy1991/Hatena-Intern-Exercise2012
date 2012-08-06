use strict;
use warnings;
use utf8;
use FindBin::libs;
package TemplateEngine;

sub new {
	my $class=shift;
	shift;
	my $dir=shift;
	bless  {dir => $dir}, $class;
}

sub render {
	my ($name, $hash) = @_;
	my $dir= ${$name}{dir};  			#ディレクトリの取得
	my %hash = %$hash;					#引数をデリファレンス
	my $title = $hash{'title'};			
	my $content = $hash{'content'};	 
		
	open( FH, "<:utf8", $dir) or die;	#htmlファイルの読み込み
	my @html = <FH>;
	close (FH);

	for my $line (@html){				# htmlの改編
		if ($line =~/title/)
			{
				$line =~s/{% title %}/$title/;
			}
		elsif ($line =~/content/)
			{
				$line =~s/{% content %}/$content/;
			}
	}
return @html;							# 結果を出力
}
1;