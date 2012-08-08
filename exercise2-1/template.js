//var src;
var Template = function(input) {
	  this.src=input.source; 							//ソースを取得
};

Template.prototype = {
    render: function(variables) {
    	escape(variables);	
      this.h1=variables['title'];					//変更要素を取得
	this.h2=variables['content'];
	this.src=this.src.replace(/{% title %}/,this.h1);	//置換
	this.src=this.src.replace(/{% content %}/,this.h2);
	return this.src;
    }
};
function escape(hash) {
	for (var i in hash) {
		hash[i]=hash[i].replace(/&/,"&amp");
		hash[i]=hash[i].replace(/>/,"$gt");
		hash[i]=hash[i].replace(/</,"&lt");
		hash[i]=hash[i].replace(/"/,"&quot");
	};
}