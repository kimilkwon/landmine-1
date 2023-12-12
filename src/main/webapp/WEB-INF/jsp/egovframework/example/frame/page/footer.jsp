<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="footer">
	<div class="footer_warp">
		<div class="f_logo">
			<img
				src="https://assets-global.website-files.com/6552cea403b55036cfb448a4/655301c321c374905b752a4d_logo_white1.svg"
				loading="lazy" alt="" class="logo_img">
		</div>
		<div class="copyright">
			<div>CoptRight by TouchKeep ⓒ All Rights reserved</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
  function alertPop(){
    var msg = "<spring:message code='ready' />";
  	alert(msg);
  }
  
  function fmtNum(num) {
//		let result = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
//		return result;
	if (num == null)
		return 0;
	num = String(num);
	if (num.length <= 3)
		return num;

	let decimalv = "";

	if (num.indexOf(".") != -1) {
		let
		numarr = num.split(".");
		num = numarr[0];
		decimalv = "." + numarr[1];
	}

	let
	len, point, str;
	let
	min = "";

	num = num + "";
	if (num.charAt(0) == '-') {
		num = num.substr(1);
		min = "-";
	}

	point = num.length % 3;
	str = num.substring(0, point);
	len = num.length;

	while (point < len) {
		if (str != "")
			str += ",";
		str += num.substring(point, point + 3);
		point += 3;
	}
	return min + str + decimalv;
}
$(function(){
	var $Money = $(".point_span");
	if("${userIdx}"!=''){
		getWallet();
		setInterval(function() {
			getWallet()
		}, 10000);
	}

	function getWallet() {
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '/landmine/getWallet.do',
			success : function(data) {
				$Money.text(fmtNum(data.money));
				$("#totalMoney").text(fmtNum(data.money));
			},
			error : function(e) {
				console.log('ajax error ' + JSON.stringify(e));
			}
		})
	}
});
  </script>

