var src;
var form=  "<br><form id='in'>タイトル<br><input type='text' name='title' size=15 ><br>内容<br><input type='text' name='content' size=15 ><input type='button' value='変更' onclick='change(this.form)'></form>";

var Template = function(input) {
	  src=input.source; 
};

Template.prototype = {
    render: function(variables) {
      this.h1=variables['title'];
	this.h2=variables['content'];
	src=src.replace(/{% title %}/,this.h1);	
	src=src.replace(/{% content %}/,this.h2);
	return src+form;
    }
};

function change(form_input) {
	this.part=document.getElementById('template').innerHTML;
	 this .title =  form_input.title.value;
	 this.content=form_input.content.value;
	 part=part.replace(/{% title %}/,this.title);
	 part=part.replace(/{% content %}/,this.content);
	 document.getElementById('in').innerHTML="";
	 document.getElementById('result').innerHTML+=part+form;
};
