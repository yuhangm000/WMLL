<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/demo.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/sweet-alert.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/awardRotate.js"></script>
<script src="js/sweet-alert.min.js"></script>
<script type="text/javascript" src="js/ThreeCanvas.js"></script>
<script type="text/javascript" src="js/Snow.js"></script>


<style type="text/css">
body {position: relative; width: 100%; height: 100%; background-size: 100% 100%; }
</style>

<script type="text/javascript">
	var SCREEN_WIDTH = window.innerWidth*0.7;//
	var SCREEN_HEIGHT = window.innerHeight;
	var container;
	var particle;//粒子

	var camera;
	var scene;
	var renderer;

	var starSnow = 1;

	var particles = []; 

	var particleImage = new Image();
	//THREE.ImageUtils.loadTexture( "img/ParticleSmoke.png" );
	particleImage.src = 'image/ParticleSmoke.png'; 
	


	function init() {
		//alert("message3");
		container = document.createElement('div');//container：画布实例;
		document.body.appendChild(container);

		camera = new THREE.PerspectiveCamera( 50, SCREEN_WIDTH / SCREEN_HEIGHT, 1, 10000 );
		camera.position.z = 1000;
		//camera.position.y = 50;

		scene = new THREE.Scene();
		scene.add(camera);
			
		renderer = new THREE.CanvasRenderer();
		renderer.setSize(SCREEN_WIDTH, SCREEN_HEIGHT);
		var material = new THREE.ParticleBasicMaterial( { map: new THREE.Texture(particleImage) } );
			//alert("message2");
		for (var i = 0; i < 260; i++) {
			//alert("message");
			particle = new Particle3D( material);
			particle.position.x = Math.random() * 2000-1000;
			
			particle.position.z = Math.random() * 2000-1000;
			particle.position.y = Math.random() * 2000-1000;
			//particle.position.y = Math.random() * (1600-particle.position.z)-1000;
			particle.scale.x = particle.scale.y = 0.5;
			scene.add( particle );
			
			particles.push(particle); 
		}

		container.appendChild( renderer.domElement );


		//document.addEventListener( 'mousemove', onDocumentMouseMove, false );
		document.addEventListener( 'touchstart', onDocumentTouchStart, false );
		document.addEventListener( 'touchmove', onDocumentTouchMove, false );
		document.addEventListener( 'touchend', onDocumentTouchEnd, false );
		
		setInterval( loop, 1000 / 40 );
		
	}

	var touchStartX;
	var touchFlag = 0;//储存当前是否滑动的状态;
	var touchSensitive = 80;//检测滑动的灵敏度;
	//var touchStartY;
	//var touchEndX;
	//var touchEndY;
	function onDocumentTouchStart( event ) {

		if ( event.touches.length == 1 ) {

			event.preventDefault();//取消默认关联动作;
			touchStartX = 0;
			touchStartX = event.touches[ 0 ].pageX ;
			//touchStartY = event.touches[ 0 ].pageY ;
		}
	}


	function onDocumentTouchMove( event ) {

		if ( event.touches.length == 1 ) {
			event.preventDefault();
			var direction = event.touches[ 0 ].pageX - touchStartX;
			if (Math.abs(direction) > touchSensitive) {
				if (direction>0) {touchFlag = 1;}
				else if (direction<0) {touchFlag = -1;};
				//changeAndBack(touchFlag);
			}	
		}
	}

	function onDocumentTouchEnd (event) {
		// if ( event.touches.length == 0 ) {
		// 	event.preventDefault();
		// 	touchEndX = event.touches[ 0 ].pageX ;
		// 	touchEndY = event.touches[ 0 ].pageY ;
	
		// }这里存在问题
		var direction = event.changedTouches[ 0 ].pageX - touchStartX;

		changeAndBack(touchFlag);
	}


	function changeAndBack (touchFlag) {
		var speedX = 20*touchFlag;
		touchFlag = 0;
		for (var i = 0; i < particles.length; i++) {
			particles[i].velocity=new THREE.Vector3(speedX,-10,0);
		}
		var timeOut = setTimeout(";", 800);
		clearTimeout(timeOut);

		var clearI = setInterval(function () {
			if (touchFlag) {
				clearInterval(clearI);
				return;
			};
			speedX*=0.8;

			if (Math.abs(speedX)<=1.5) {
				speedX=0;
				clearInterval(clearI);
			};
			
			for (var i = 0; i < particles.length; i++) {
				particles[i].velocity=new THREE.Vector3(speedX,-10,0);
			}
		},100);


	}


	function loop() {
		for(var i = 0; i<particles.length; i++){
			var particle = particles[i]; 
			particle.updatePhysics(); 

			with(particle.position)
			{
				if((y<-1000)&&starSnow) {y+=2000;}

				if(x>1000) x-=2000; 
				else if(x<-1000) x+=2000;
				if(z>1000) z-=2000; 
				else if(z<-1000) z+=2000;
			}			
		}

		camera.lookAt(scene.position); 

		renderer.render( scene, camera );
	}
</script>

<script>
	function shut(){
		$.ajax({
			url:"Lucky_off",
			type:'post',
			success: function (data) {
				window.location.href="mLeftPage";
			},
			fail: function(){
				alert("关闭失败，请重试");
			}
		});
	}
</script>
</head>
<body bgcolor="#eae0d9" id="body" onLoad="init()">
<c:import url="mleftPage.jsp"></c:import>
<button style="width:200px;" onclick="shut()">红包雨停止</button>

<div class="couten" style="float:right;width:75%;text-align:center; "></div>
	
</body>
</html>