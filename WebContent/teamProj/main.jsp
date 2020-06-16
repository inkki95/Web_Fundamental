<!-- ajax_proxy.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>kakaoMap</title>
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39c6c1c8b379d7eb9472eff045d57c1b"></script>
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    
    <script>
    
   
    $(function(){
       
            $.ajax({
                url : 'fireStation.xml',
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
                  
                      //var info =  "ì´ë¦: "+name +"<br/>"+
                               //"ìë: "+lat+"<br/>"+
                               //"ê²½ë: "+lon+ "<br/>"+"<br/>";
                               
                      //$('#sel').append(info);
                   });
                   //ê° ë°°ì´ì ë¤ ë¤ì´ê°ìë ìí©! 
                   //ì´ì  ì§ëë¥¼ ë³´ì¬ì¤ ì°¨ë¡!
                   var mapContainer = document.getElementById('map'), // ì§ëë¥¼ íìí  div 
                  mapOption = {
                      center: new kakao.maps.LatLng(37.56682, 126.97864), // ì§ëì ì¤ì¬ì¢í
                      level: 7, // ì§ëì íë ë ë²¨
                      mapTypeId : kakao.maps.MapTypeId.ROADMAP // ì§ëì¢ë¥
                  }; 

                 // ì§ëë¥¼ ìì±íë¤ 
                 var map = new kakao.maps.Map(mapContainer, mapOption); 

                 // ì§ë íì ë³ê²½ ì»¨í¸ë¡¤ì ìì±íë¤
                 var mapTypeControl = new kakao.maps.MapTypeControl();
   
                 // ì§ëì ìë¨ ì°ì¸¡ì ì§ë íì ë³ê²½ ì»¨í¸ë¡¤ì ì¶ê°íë¤
                 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);   
   
                 // ì§ëì íë ì¶ì ì»¨í¸ë¡¤ì ìì±íë¤
                 var zoomControl = new kakao.maps.ZoomControl();
   
                 // ì§ëì ì°ì¸¡ì íë ì¶ì ì»¨í¸ë¡¤ì ì¶ê°íë¤
                 map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); 
                 
                 
                 
                         //content: '<div>ê·¼ë¦°ê³µì</div>',
                         //latlng: new kakao.maps.LatLng(33.451393, 126.570738)
                  
               

                 // ì¸í¬ìëì°ë¥¼ íìíë í´ë¡ì ë¥¼ ë§ëë í¨ììëë¤ 
                 function makeOverListener(map, marker, infowindow) {
                     return function() {
                         infowindow.open(map, marker);
                     };
                 }

                 // ì¸í¬ìëì°ë¥¼ ë«ë í´ë¡ì ë¥¼ ë§ëë í¨ììëë¤ 
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
		       <a class="page-link" href="main.jsp">Home</a>
				    <li class="page-item"><a class="page-link" href="map/sampfire.jsp">fire</a></li>
				    <li class="page-item"><a class="page-link" href="map/sampAED.jsp">AED</a></li>
				    <li class="page-item"><a class="page-link" href="map/sampetc.jsp">etc</a></li>
				    <li class="page-item">
				    </li>
				  </ul>
				</nav>
    <div id="map" style="width:100%;height:100vh;"></div>
    <div id="sel"></div>
    
</body>
</html>