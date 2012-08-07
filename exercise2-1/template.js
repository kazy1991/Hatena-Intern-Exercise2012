var src;
var Template = function(input) {
	  src=input.source; 							//ソースを取得
};

Template.prototype = {
    render: function(variables) {
      this.h1=variables['title'];					//変更要素を取得
	this.h2=variables['content'];
	src=src.replace(/{% title %}/,this.h1);	//置換
	src=src.replace(/{% content %}/,this.h2);
	return src;
    }
};