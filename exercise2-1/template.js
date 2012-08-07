var src;
var Template = function(input) {
	 src=input;    
	//console.log(input);
};

Template.prototype = {
    render: function(variables) {
   // 		alert(src.source);
      this.h1=variables['title'];
	this.h2=variables['content']
	var title="<h1>"+this.h1+"</h1>";
	var message="<h2>"+this.h2+"</h2>";
	//return title+message;
	src.source=src.source.replace(/{% title %}/,this.h1);	
	src.source=src.source.replace(/{% content %}/,this.h2);	
	return src.source;
    }
};
