function idCheck(id){
    if (id == ""){
        alert("id 입력해 주세요");
        document.regForm.id.focus();
    } else {
         url = "idCheck.jsp?id="+id;
        window.open(url, "_post", "width=300,height=150");
    }
}


function zipCheck(){
	url="zipCheck.jsp?check=y";

	window.open(url, "post", "toolbar=no, width=500, height=300, directories=no, status=yes, scrollbar=yes, menubar=no");
	if(zip ==""){
		
	}
}



function dongCheck(){
	if(document.zipForm.dong.value== ""){
		alert("동 이름을 입력해 주세요");
		document.zipForm.dong.focus();
		return;
	}
	document.zipForm.submit();
}

function sendAddress(zipcode,sido,gugun,dong,ri,bunji){
	var address=sido+""+gugun+ " "+dong+ " "+ ri+""+bunji;
	opener.document.regForm.zipcode.value=zipcode;
	opener.document.regForm.address1.value=address;
	self.close();
}

function inputCheck() {
		if(document.regForm.id.value== ""){
		alert("id 입력하세요");
		document.regForm.id.focus();
		return;
	}
		if(document.regForm.pass.value== ""){
		alert("pass 입력하세요");
		document.regForm.pass.focus();
		return;
	}
	if(document.regForm.repass.value== ""){
		alert("pass  를 확인 하세요");
		document.regForm.repass.focus();
		return;
	}
	if(document.regForm.pass.value !==document.regForm.repass.value){
		alert("비번이 일치 하지 않음 ");
		document.regForm.repass.focus();
		return;
	}
	
	if(document.regForm.name.value== ""){
		alert("이름 을  입력 하세요");
		document.regForm.name.focus();
		return;
	}
	
		if(document.regForm.phone1.value== ""){
		alert("지역번호 를  입력 하세요");
		document.regForm.phone1.focus();
		return;
	}
		if(document.regForm.phone2.value== ""){
		alert("중간 번호를  입력 하세요");
		document.regForm.phone2.focus();
		return;
	}
	
		if(document.regForm.phone3.value== ""){
		alert("마지막 번호를  입력 하세요");
		document.regForm.phone3.focus();
		return;
	}
		if(document.regForm.email.value== ""){
		alert("email 을  입력 하세요");
		document.regForm.email.focus();
		return;
	}

// 이메일 형심 검사
var str=document.regForm.email.value;
var atPos =str.indexOf('@');
var atLastPos =str.lastIndexOf('@');
var dotPos =str.indexOf('.');
var spacePos =str.indexOf(' ');
var commaPos =str.indexOf(',');
var eMailSize=str.length;


	//if (atpos  >1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos +1 < dotPos && atPos + 1  < eMailSize); 
	if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos==-1 && commaPos ==-1 && atPos+1 < dotPos && atPos+1 < eMailSize);
	else {
    	alert("이메일 주소 형식이 잘못되었습니다. \n\f 다시 입력해주세요.");
    	document.regForm.email.focus();
    	return;
	}
	
	if(document.regForm.zipcode.value== ""){
		alert("우편번호를  입력 하세요");
		document.regForm.zipcode.focus();
		return;
	}
	
		if(document.regForm.address1.value== ""){
		alert("주소를 입력하세요");
		document.regForm.address1.focus();
		return;
	}
	
		if(document.regForm.address2.value== ""){
		alert("상세 주소를 입력하세요");
		document.regForm.address2.focus();
		return;
	}
		document.regForm.submit();
}


function updateCheck(){
	
	console.log("gg");
	if(document.regForm.pass.value== ""){
		alert("pass 입력하세요");
		document.regForm.pass.focus();
		return;
	}
	if(document.regForm.repass.value== ""){
		alert("pass  를 확인 하세요");
		document.regForm.repass.focus();
		return;
	}
	if(document.regForm.pass.value != document.regForm.repass.value){
		alert("비번이 일치 하지 않음 ");
		document.regForm.repass.focus();
		return;
	}
		if(document.regForm.phone1.value== ""){
		alert("지역번호 를  입력 하세요");
		document.regForm.phone1.focus();
		return;
	}
		if(document.regForm.phone2.value== ""){
		alert("중간 번호를  입력 하세요");
		document.regForm.phone2.focus();
		return;
	}
	
		if(document.regForm.phone3.value== ""){
		alert("마지막 번호를  입력 하세요");
		document.regForm.phone3.focus();
		return;
	}
		if(document.regForm.email.value== ""){
		alert("email 을  입력 하세요");
		document.regForm.email.focus();
		return;
	}

// 이메일 형심 검사
var str=document.regForm.email.value;
var atPos =str.indexOf('@');
var atLastPos =str.lastIndexOf('@');
var dotPos =str.indexOf('.');
var spacePos =str.indexOf(' ');
var commaPos =str.indexOf(',');
var eMailSize=str.length;


	//if (atpos  >1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos +1 < dotPos && atPos + 1  < eMailSize); 
	if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos==-1 && commaPos ==-1 && atPos+1 < dotPos && atPos+1 < eMailSize);
	else {
    	alert("이메일 주소 형식이 잘못되었습니다. \n\f 다시 입력해주세요.");
    	document.regForm.email.focus();
    	return;
	}
	
	if(document.regForm.zipcode.value== ""){
		alert("우편번호를  입력 하세요");
		document.regForm.zipcode.focus();
		return;
	}
	
		if(document.regForm.address1.value== ""){
		alert("주소를 입력하세요");
		document.regForm.address1.focus();
		return;
	}
	
		if(document.regForm.address2.value== ""){
		alert("상세 주소를 입력하세요");
		document.regForm.address2.focus();
		return;
	}
		document.regForm.submit();
	
	
}

function begin(){
	document.myForm.pass.focus();
}

function checkId(){
	if(!document.myForm.pass.value()){
	  alert("비밀번호가 입력되지 않았습니다.");
		document.myForm.pass.focus();
		return;
	}
}