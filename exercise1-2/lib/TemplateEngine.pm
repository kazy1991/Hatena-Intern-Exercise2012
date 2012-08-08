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
	my $dir = ${$_[0]};  			#ディレクトリの取得
	my %hash = %$hash;					#引数をデリファレンス
	my $title = escape($hash{'title'});		#エスケープする	
	my $content = id(escape($hash{'content'}));	 #エスケープしてid記法を変換
	my $db;	
	open( FH, "<:utf8", $dir) or die;	#htmlファイルの読み込み
	my @html = <FH>;
	close (FH);

	for my $line (@html){				# htmlの改編
			$line =~ s/{% title %}/$title/g;
			$line =~ s/{% content %}/$content/g;
			$db=$db.$line;
	}
	#return @html;						# 結果を出力
	return $db;							# テストに対応させる処置
}
sub escape {
	my $str=$_[0];
	$str=~ s/&/&amp;/g;
	$str=~ s/>/&gt;/g;
	$str=~ s/</&lt;/g;
	$str=~ s/"/&quot;/g;
	return $str;
}
sub id {
	my $str=$_[0];
	$str=~ s#id:(\w+) #<a href="http://hatenaintern2012.g.hatena.ne.jp/$1/">id:$1</a>#g;
	return $str;
}
1;
