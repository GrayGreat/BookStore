
window.onload=function(){
	var outer=document.getElementById('outer1');
	var oInput=outer.getElementsByTagName('input');//
	var oDiv=outer.getElementsByTagName('div');//3
//	alert(oDiv.length+"+"+oInput.length);
	for(var i=0;i<oInput.length;i++){
		oInput[i].index=i;
		oInput[i].onclick=function(){
			for(var j=0;j<oInput.length;j++){
				oInput[j].className="but3";
				oDiv[j].style.display="none";
			}
			this.className="aactive but3";
			oDiv[this.index].style.display="block";
		}
	}
}
function onReport(id){
	var foot=document.getElementById("comment_foot_down");
	var fSpan=foot.getElementsByTagName("span");
//	alert(fSpan.length);
	for(var i=0;i<fSpan.length;i++){
		if(i%4==2)
			fSpan[4*id-2].style.display="block";
	}
}

function outReport(id){
	var foot=document.getElementById("comment_foot_down");
	var fSpan=foot.getElementsByTagName("span");
//	alert(fSpan.length);
	for(var i=0;i<fSpan.length;i++){
		if(i%4==2)
			fSpan[i].style.display="none";
	}
}
