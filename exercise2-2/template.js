//var src;
var form=  "<br><form id='in'>タイトル<br><input type='text' name='title' size=15 ><br>内容<br><input type='text' name='content' size=15 ><input type='button' value='投稿' onclick='change(this.form)'></form>";

var Template = function(input) {
	  this.src=input.source; 
};

Template.prototype = {
    render: function(variables) {
      this.h1=variables['title'];
	this.h2=variables['content'];
	this.src=this.src.replace(/{% title %}/,this.h1);	
	this.src=this.src.replace(/{% content %}/,this.h2);
	return this.src+form;
    }
};

function change(form_input) {
	this.part=document.getElementById('template').innerHTML;
	 this .title =  form_input.title.value;
	 this.content=form_input.content.value;
	 part=part.replace(/{% title %}/,this.title);
	 part=part.replace(/{% content %}/,this.content);
	 //document.getElementById('in').innerHTML="";
	// console.log(document.getElementById('in'));
	 delete_obj('in');
	 document.getElementById('result').innerHTML+=part+form;
};

function delete_obj( id ){
    var obj=document.getElementById(id);
    obj.parentNode.removeChild(obj);
};