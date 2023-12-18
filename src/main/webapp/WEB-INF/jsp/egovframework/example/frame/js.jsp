<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=644a0d29c6872cead0a180f0" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="/spgame/webflow/js/webflow.js?v=11" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script><!-- jquery 사용하려고 선언 -->
<script>
	$(".s_icon_btn").hover(
		function(){$(this).children(".c_deco").toggleClass("on")}
	);
	

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function numberDeleteCommas(x) {
		return x.toString().replace(/\,/g, "");
	}
	var start = 0;
	$(".dw_btn1").click(function(){
		var money = parseInt($(this).attr("money"));
		if(money==-1){
			start = 0;
			$("#depositMoney").val("");
		}
		else{
			start += money;
			$("#depositMoney").val(numberWithCommas(start));
		}
	});
	
	function toFixedDown(val,fix){
		if(isNaN(val)) return 0;
		
		var minus = false;
		if(val < 0)
			minus = true;
		
		var num = 1;
		for(var i = 0; i < parseFloat(fix); i++){
			num *= 10;
		}
		const temp1 = (Number(val) + Number.EPSILON) * num; 
		const temp2 = Math.floor(Math.abs(temp1));
		var result = temp2 / num;
		
		if( result < 1 / num)
			result = 0;
		if(minus)
			result *= -1;
		return result.toFixed(fix);
	}  
</script>