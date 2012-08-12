use strict;
use warnings;
use UTF8;
use HTML::Entities;
use IO::File;
package TemplateEngine;

binmode(STDOUT, ":utf8"); #wide char問題対策
sub new {
	my($class,%values)=@_;
	my $dir=$values{file};
	bless \$dir,$class;
}

sub render {
	my $out='';
	my($dir,$values)=@_;
	$values=escape($values);
	my %values=%$values;	
	$dir= ${$dir};		#ディレクトリのデリファレンス
	my $io=IO::File->new($dir,'<') or die;
	my @lines= $io->getlines; #ファイルから全行を取得
	for my $line (@lines){
		$line=~ s/{%\s*(\w+)\s*%}/$values{$1}/g; #テンプレートを置換
		$out.=$line; #出力用のスカラー値に追加
	}
	return $out;
}

sub escape {
	my %hash= %{$_[0]}; #hash値のデリファレンス
	for my $key (keys %hash){
		$hash{$key}=HTML::Entities::encode_entities($hash{$key},qw(&<>"'));
	}
	return \%hash;
}
1;
