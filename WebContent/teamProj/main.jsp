<!-- ajax_proxy.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KakaoMapMain</title>
    <script type="text/javascript" src="../js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39c6c1c8b379d7eb9472eff045d57c1b"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
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
                   var mapContainer = document.getElementById('map'), // Ã¬Â§ÂÃ«ÂÂÃ«Â¥Â¼ Ã­ÂÂÃ¬ÂÂÃ­ÂÂ  div 
                  mapOption = {
                      center: new kakao.maps.LatLng(37.56682, 126.97864), // Ã¬Â§ÂÃ«ÂÂÃ¬ÂÂ Ã¬Â¤ÂÃ¬ÂÂ¬Ã¬Â¢ÂÃ­ÂÂ
                      level: 7, // Ã¬Â§ÂÃ«ÂÂÃ¬ÂÂ Ã­ÂÂÃ«ÂÂ Ã«Â ÂÃ«Â²Â¨
                      mapTypeId : kakao.maps.MapTypeId.ROADMAP // Ã¬Â§ÂÃ«ÂÂÃ¬Â¢ÂÃ«Â¥Â
                  }; 

                 var map = new kakao.maps.Map(mapContainer, mapOption); 
                 
                 kakao.maps.event.addListener(map, 'center_changed', function() {

                    var level = map.getLevel();

                    var latlng = map.getCenter(); 

                     var message = '<p>11KKKK ' + level + 'KKKK </p>';
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
<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				    <li class="page-item disabled">
				    </li>
		   <button type="button" class="btn btn-outline-info" >Home</button>
			<button type="button" class="btn btn-outline-danger" onclick="location='map/sampfire.jsp?'">fire</button>
			<button type="button" class="btn btn-outline-warning" onclick="location='map/sampAED.jsp'">AED</button>
			<button type="button" class="btn btn-outline-success" onclick="location='map/sampetc.jsp'">etc</button>
				    <li class="page-item">
				    </li>
				  </ul>
				</nav>
    <div id="map" style="width:30%;height:30vh;"></div>
    <div id="sel"></div>
    
</body>
</html>