use strict;
use warnings;

use Test::More;
use FindBin::libs;

use_ok 'TemplateEngine';

my $template = TemplateEngine->new( file => 'templates/main.html' );
isa_ok $template, 'TemplateEngine';

my $expected = <<'HTML';
<html>
  <head>
    <title>タイトル</title>
  </head>
  <body>
    <p>これは<a href="http://hatenaintern2012.g.hatena.ne.jp/kazy1991/">id:kazy1991</a>へのコンテンツです</p>
  </body>
</html>
HTML

cmp_ok $template->render({
    title   => 'タイトル',
    content => 'これはid:kazy1991 へのコンテンツです',
}), 'eq', $expected; 


done_testing();
