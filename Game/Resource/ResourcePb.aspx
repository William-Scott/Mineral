﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Game/Resource/Resource.Master" AutoEventWireup="true" CodeBehind="ResourcePb.aspx.cs" Inherits="WebApplication1.Game.Resource.ResourcePb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">    
    <div class="row-fluid">
		<div class="span2">
			<ul id="ul" class="nav nav-stacked nav-pills" >
				<li>
					<a href="ResourceAl.aspx">铝矿</a>
				</li>
				<li>
					<a href="ResourceFe.aspx">铁矿</a>
				</li>
				<li class="active">
					<a href="ResourcePb.aspx">铅矿</a>
				</li>
                            <!--<li>
							    <a href="ResourcePb.aspx">铅矿</a>
						    </li>
                            <li>
							    <a href="ResourceSn.aspx">锡矿</a>
						    </li>
                            <li>
							    <a href="ResourceTi.aspx">钛矿</a>
						    </li>
                            <li>
							    <a href="ResourceCr.aspx">铬矿</a>
						    </li>
                            <li>
							    <a href="ResourceNi">镍矿</a>
						    </li>-->
			</ul>
		</div>
	    <div class="span10">
			<h3>
				铅矿
			</h3>
			<p><em>铅是一种在地球存在的稀有矿物，可以用于建设各种设施</em></p>
            <br/>
            <br/>
            <p id ="num1">你目前拥有0个铅矿</p>
            <br/>
			<p id="num2">你目前每秒生产0个铅矿</p> 
                        <!--<button id = "click" class="btn" type="button" onclick ="produce_al_r()">点击生产铝矿</button>-->
		</div>
	</div>
</div>
<script src="../../kuangwu.js"></script>
<script src="../../kuangchang.js"></script>
<script src="../../cookie.js"></script>
<script src="../../JavaScript.js"></script>
<script>
    var timeid;
    pb_b = new KuangChang("Pb", 0);
    pb_r = new KuangWu("Pb", 0, 1000);
    pb_r.num = getCookie("pb_r_num");
    pb_b.num = getCookie("pb_b_num");
    var pb_r_num_ = 0;
    document.getElementById("num1").innerHTML = "你目前拥有" + pb_r.num + "个铅矿";
    document.getElementById("num2").innerHTML = "你目前每20秒生产" + pb_b.num + "个铅矿";
        /*function checkCookie() {
            al_r.num = getCookie("al_r_num");
            al_b.num = getCookie("al_b_num");
            dopbment.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            dopbment.getElementById("num2").innerHTML = "你目前每10秒生产" + al_b.num + "个铝矿";
        }*/
    //function produce_null() { }
    /*function produce_al_r() {
        var pos = 0;
        dopbment.getElementById("click").className = "btn disabled";
        dopbment.getElementById("click").onclick = function() {produce_null();};
        timeid = setInterval(function () { btn1() }, 10);
        function btn1() {
            if (pos >= 100) {
                clearInterval(timeid);
                dopbment.getElementById("click").innerHTML="点击生产铝矿";
                dopbment.getElementById("click").onclick = function() {produce_al_r();};
                dopbment.getElementById("click").className = "btn";
                al_r.num++;
                dopbment.cookie = "al_r_num="+al_r.num+";path=/";
                dopbment.getElementById("num1").innerHTML = "你目前拥有" + al_r.num + "个铝矿";
            } else {
                pos++;
                dopbment.getElementById("click").innerHTML="点击生产铝矿（冷却中）";
            }
        }  
    }*/
    function btn2() {
        pb_r.num++;
        pb_r_num_++;
        document.cookie = "pb_r_num=" + pb_r.num + ";path=/";
        document.cookie = "pb_r_num_="+pb_r_num_+";path=/";
        document.getElementById("num1").innerHTML = "你目前拥有" + pb_r.num + "个铅矿";
    }
    if (pb_b.num>0) {
        pb_r.num = getCookie("pb_r_num");
        pb_b.num = getCookie("pb_b_num");
        var cd = 20000 / pb_b.num;
        var timeid_ = setInterval(function () { btn2() }, cd);
    }
        //动态生成第一个导航栏
    var able = new Array();
    able[0] = getCookie_w("Able1");
    able[1] = getCookie_w("Able2");
    for (var i = 0; i < 2; i++) {
        if (able[i] != "Pb") {
            var li1 = document.createElement('li');
            var profileLink1 = '<a href="Resource' + able[i] + '.aspx">' + dictionary_r(able[i]) + '</a>';
            li1.innerHTML = profileLink1;
            document.getElementById("ul").appendChild(li1);
        }
    }
</script>
</asp:Content>
