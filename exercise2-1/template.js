var src;
var Template = function(input) {
	  src=input.source; 
};

Template.prototype = {
    render: function(variables) {
      this.h1=variables['title'];
	this.h2=variables['content'];
	src=src.replace(/{% title %}/,this.h1);	
	src=src.replace(/{% content %}/,this.h2);
	return src;
    }
};