use strict;
use warnings;
use utf8;
use FindBin::libs;
package TemplateEngine;

# html用の配列
our @html = {};

# htmlファイルパスから中身を呼び出す
sub new {
	my $class=shift;
	shift;
	my $dir=shift;
	print $dir;
	open( FH, "<:utf8", $dir) or die;
	@html = <FH>;
	close (FH);
	return $class;
}

# html書き換えて出力
sub render {
	my ($name, $hash) = @_;
	
	my %hash = %$hash;	# ハッシュをデリファレンス
	
	my $title = $hash{'title'};
	my $content = $hash{'content'};
	
	# ループさせてhtml書き換え
	foreach my $line (@html){
		if ($line =~/title/)
			{
				$line =~s/{% title %}/$title/;
			}
		elsif ($line =~/content/)
			{
			$line =~s/{% content %}/$content/;
			}
	}

# output.htmlを出力
return @html;
}