//var src;
var Template = function(input) {
	this.src=input.source; 							//ソースを取得
};

Template.prototype = {
	render: function(variables) {
		escape(variables);	
		//なぜ動かないのでしょうか？
		//    this.src=this.src.replace(/{%\s*(\w+)\s*%}/g, variables[RegExp.$1]); 		
		this.src=this.src.replace(/{%\s*(\w+)\s*%}/g,function(){return variables[RegExp.$1]});
		console.log(variables[RegExp.$1]);
		return this.src;
	}
};
function escape(hash) {
	for (var i in hash) {
		hash[i]=hash[i].replace(/&/,"&amp;");
		hash[i]=hash[i].replace(/>/,"$gt;");
		hash[i]=hash[i].replace(/</,"&lt;");
		hash[i]=hash[i].replace(/"/,"&quot;");
		hash[i]=hash[i].replace(/'/,"&#39;");
	};
}
