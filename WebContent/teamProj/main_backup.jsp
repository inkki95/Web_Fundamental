<!-- ajax_proxy.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>'WELCOME TO OUR SERVICE'</title>
    <script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39c6c1c8b379d7eb9472eff045d57c1b"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
    <style>
    body {
    	 background-color:#17a2b8;
    
    
    }
    
    </style>
    
    <script>
    var scrt_var = 10; 
    $(function(){
            $.ajax({
                url : 'xml/fireStation.xml',
                type :'GET',
                dataType : 'xml',
                error : function(){
                    alert('error');
                },
                success : function(xml){
                   const nameArr = [];
                   const latitudeArr =[];
                   const longitudeArr=[];
                   $(xml).find("item").each(function(){
                  let name = $(this).find("facilityName").text();
                  let latitude = $(this).find("latitude").text();
                  let longitude = $(this).find("longitude").text();
                  nameArr.push(name);
                  latitudeArr.push(latitude);
                  longitudeArr.push(longitude);
                  
                               
                   });
                   var mapContainer = document.getElementById('map'), // ÃÂ¬ÃÂ§ÃÂÃÂ«ÃÂÃÂÃÂ«ÃÂ¥ÃÂ¼ ÃÂ­ÃÂÃÂÃÂ¬ÃÂÃÂÃÂ­ÃÂÃÂ  div 
                  mapOption = {
                      center: new kakao.maps.LatLng(37.56682, 126.97864), // ÃÂ¬ÃÂ§ÃÂÃÂ«ÃÂÃÂÃÂ¬ÃÂÃÂ ÃÂ¬ÃÂ¤ÃÂÃÂ¬ÃÂÃÂ¬ÃÂ¬ÃÂ¢ÃÂÃÂ­ÃÂÃÂ
                      level: 7, // ÃÂ¬ÃÂ§ÃÂÃÂ«ÃÂÃÂÃÂ¬ÃÂÃÂ ÃÂ­ÃÂÃÂÃÂ«ÃÂÃÂ ÃÂ«ÃÂ ÃÂÃÂ«ÃÂ²ÃÂ¨
                      mapTypeId : kakao.maps.MapTypeId.ROADMAP // ÃÂ¬ÃÂ§ÃÂÃÂ«ÃÂÃÂÃÂ¬ÃÂ¢ÃÂÃÂ«ÃÂ¥ÃÂ
                  }; 

                 var map = new kakao.maps.Map(mapContainer, mapOption); 
                 
                 

                 if (navigator.geolocation) {
                         
                         // GeoLocation을 이용해서 접속 위치를 얻어옵니다
                         navigator.geolocation.getCurrentPosition(function(position) {
                             
                             var lat = position.coords.latitude, // 위도
                                 lon = position.coords.longitude; // 경도
                             
                             var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                                 message = '<div style="padding:5px;">You are here!!</div>'; // 인포윈도우에 표시될 내용입니다
                             
                             // 마커와 인포윈도우를 표시합니다
                             displayMarker(locPosition, message);
                                 
                           });
                         
                     } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
                         
                         var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
                             message = 'It is not work T.T'
                             
                         displayMarker(locPosition, message);
                     }

                     // 지도에 마커와 인포윈도우를 표시하는 함수입니다
                     function displayMarker(locPosition, message) {

                         // 마커를 생성합니다
                         var marker = new kakao.maps.Marker({  
                             map: map, 
                             position: locPosition
                         }); 
                         
                         var iwContent = message, // 인포윈도우에 표시할 내용
                             iwRemoveable = true;

                         // 인포윈도우를 생성합니다
                         var infowindow = new kakao.maps.InfoWindow({
                             content : iwContent,
                             removable : iwRemoveable
                         });
                         
                         // 인포윈도우를 마커위에 표시합니다 
                         infowindow.open(map, marker);
                         
                         // 지도 중심좌표를 접속위치로 변경합니다
                         map.setCenter(locPosition);      
                     }    
                
                 
                 kakao.maps.event.addListener(map, 'center_changed', function() {

                    var level = map.getLevel();

                    var latlng = map.getCenter(); 

                     var message = '<p>11KKKK ' + level + 'KKKKÂ </p>';
                     message += '<p>KKKK ' + latlng.getLat() + ', KKKK ' + latlng.getLng() + 'KK</p>';

                     var resultDiv = document.getElementById('result');
                 
                 });

                 var mapTypeControl = new kakao.maps.MapTypeControl();
                 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);   
                 var zoomControl = new kakao.maps.ZoomControl();
                 map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); 

                 function makeOverListener(map, marker, infowindow) {
                     return function() {
                         infowindow.open(map, marker);
                     };
                 }

                 function makeOutListener(infowindow) {
                     return function() {
                         infowindow.close();
                     };
                 }  
                   
                }
            });

        });

    </script>
</head>
<body>
<div style="position: absolute;">

    <div style = "position:relative;z-index:2;left: 10px; top: 10px;">
<div class="btn-group-vertical">

		   <button type="button" class="btn btn-info" >HOME</button>
			<button type="button" class="btn btn-danger" onclick="location='map/sampfire.jsp?'">FIRE STATION</button>
			<button type="button" class="btn btn-warning" onclick="location='map/sampAED.jsp'">AED</button>
			<button type="button" class="btn btn-success" onclick="location='map/sampetc.jsp'">EMERGENCY</button>
</div>
</div>
</div>
	
    <div style = "position:relative;z-index:1;">
    <div class="container">
    <div class="row">
    <div class="col-12" id="upper" style="background-color:white; width:100%;height:2vh;">
    <div id="upperText">HELLO</div></div>
    </div>
     <div class="row">
    <div class = "col-12" id="map" style="width:100%;height:96vh;"></div>
    </div>
    <div class="row">
    <div class="col-12" id="upper" style="background-color:white; width:100%;height:2vh;"></div>
    </div>
  
    
    </div>
    </div>
</body>
</html>