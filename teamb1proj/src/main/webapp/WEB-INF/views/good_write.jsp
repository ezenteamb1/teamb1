<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/good_write.css">

</head> 
<body>

	<div id="good_back">
		<form action="good_write.do" method="post" enctype="multipart/form-data">
			<!-- 맛집 제목,별점 -->
			<div id="ghead">
				<div class="contents" style="float: left;">
					<div class="upload-box">
						<div id="drop-file" class="drag-file">
							<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png"
								alt="파일 아이콘" class="image">
							<p class="message">Drag files to upload</p>
							<img src="" alt="미리보기 이미지" class="preview">
						</div>
						<label class="file-label" for="chooseFile">Choose File</label> 
						<input
							class="file" id="chooseFile" type="file" name="file"
							onchange="dropFile.handleFiles(this.files)"
							accept="image/png, image/jpeg, image/gif">
					</div>
				</div>
				<div style="display: inline-block; margin-top: 2%;">
					<div class="good_title">
						<input type="text" name="goodTitle" placeholder="맛집 이름을 입력하세요">
					</div>
					
					<div>
					
					<div class="star-rating space-x-4 mx-auto">
				
						 <input type="radio" id="5-stars" name="star" value="5" v-model="ratings" /> 
						 <label for="5-stars" class="star pr-4">★</label> 
						 <input type="radio" id="4-stars" name="star" value="4" v-model="ratings" />
						 <label for="4-stars" class="star">★</label> 
						<input type="radio" id="3-stars" name="star" value="3" v-model="ratings" /> 
						<label for="3-stars" class="star">★</label> 
						<input type="radio" id="2-stars" name="star" value="2" v-model="ratings" /> 
						<label for="2-stars" class="star">★</label> 
						<input type="radio" id="1-star" name="star" value="1" v-model="ratings" /> 
						<label for="1-star" class="star">★</label>
					</div>
					</div>
					<div class="good_secondTitle">
						<input type="text" name="goodSummary" placeholder="한줄 요약을 입력하세요">
					</div>
					
					<select name="location" id="locationSelect" class="select_locat">
						<option value=""  class="option_locat" disabled selected>어느지역의 맛집인가요?</option>
						<option value="chung" class="option_locat" data-smallcode="0">충청도</option>
						<option value="kung" class="option_locat" data-smallcode="1">경상도</option>
						<option value="jeon" class="option_locat" data-smallcode="2">전라도</option>
						<option value="seoul" class="option_locat" data-smallcode="3">수도권</option>
						<option value="jeju" class="option_locat" data-smallcode="4">제주도</option>
						<option value="kang" class="option_locat" data-smallcode="5">강원도</option>
					</select>
					
					<input type="hidden" id="smallCode" name="smallCode" value="">
					<input type="hidden" id="bigCode" name="bigCode" value="0">
				</div>
			</div>

			<!-- 맛집 설명, 메뉴 -->
			<div id="gbody">

				<div id="good_ExDiv" style="margin-top: 30px">
					<div id="good_ExTitle">매장소개</div>
					<div class="good_Ex">
						<textarea class="content" name="goodContent" placeholder="소개글을 적어주세요!"></textarea>
					</div>
				</div>

				<div>

					<div id="good_data">
						<table class="good_dataTable">
							<tbody>
								<tr>
									<th>영업시간</th>
									<td colspan="2"><i>OPEN</i> &nbsp;<input type="time" class="operation_time"
										value="11:00" name="open"> &nbsp;  &nbsp;  <i>CLOSE</i> &nbsp;<input type="time" class="operation_time"
										value="20:00" name="close"></td>
								</tr>
								<tr>
									<th>주차</th>
									<td colspan="2"><label>가능 <input type="checkbox"
											name=parking value="0"></label> <label>불가 <input
											type="checkbox" name=parking value="1"></label></td>
								</tr>
								<tr>
									<th rowspan="3">메뉴</th>
									<td><input type="text" placeholder="메뉴이름입력" class="menu" name="menu1"></td>
									<td><input type="text" placeholder="가격입력" class="price" name="price1"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />원
										<br></td>
								</tr>
								<tr>
									<td><input type="text" placeholder="메뉴이름입력" class="menu" name="menu2"></td>
									<td><input type="text" placeholder="가격입력" class="price" name="price2"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />원
										<br></td>
								</tr>
								<tr>
									<td><input type="text" placeholder="메뉴이름입력" class="menu" name="menu3"></td>
									<td><input type="text" placeholder="가격입력" class="price" name="price3"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" />원
										<br></td>
								</tr>

								<tr>
									<th>전화번호</th>
									<td colspan="2"><input type="text" class="phone" name="goodPn"
										placeholder="매장연락처를 입력해주세요"
										oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" /></td>
								</tr>

							</tbody>
						</table>
					</div>
					<div class="map_div">
						<div class="map">
							<div class="map-search">
								<label for="sample5_address" id="div-title">장소</label> 
								<input type="text" id="sample5_address" placeholder="주소" name="goodAddr"> 
								<input type="button" id="search_btn" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
							</div>
							<div id="map"></div>
						</div>
					</div>

				</div>



				<div class="btn_div" style="height: 50px; width: 100%;">
					<button type="submit" class="btn_submit">취소</button>
					<button type="submit" class="btn_submit">작성</button>
				</div>

			</div>

		</form>
		
	</div>
	<script>
		document.getElementById('locationSelect').addEventListener('change', function(){
			var selectedOption = this.options[this.selectedIndex]; 
			var smallCode = selectedOption.getAttribute('data-smallcode'); 
			document.getElementById('smallCode').value = smallCode; 
		}); 
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27ed184b41ab5e32d29f4e75073ed563&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
	<script>
	function DropFile(dropAreaId, fileListId) {
  let dropArea = document.getElementById(dropAreaId);
  let fileList = document.getElementById(fileListId);

  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  function highlight(e) {
    preventDefaults(e);
    dropArea.classList.add("highlight");
  }

  function unhighlight(e) {
    preventDefaults(e);
    dropArea.classList.remove("highlight");
  }

  function handleDrop(e) {
    unhighlight(e);
    let dt = e.dataTransfer;
    let files = dt.files;

    handleFiles(files);

    const fileList = document.getElementById(fileListId);
    if (fileList) {
      fileList.scrollTo({ top: fileList.scrollHeight });
    }
  }

  function handleFiles(files) {
    files = [...files];
    // files.forEach(uploadFile);
    files.forEach(previewFile);
  }

  function previewFile(file) {
    console.log(file);
    renderFile(file);
  }

  function renderFile(file) {
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onloadend = function () {
      let img = dropArea.getElementsByClassName("preview")[0];
      img.src = reader.result;
      img.style.display = "block";
    };
  }

  dropArea.addEventListener("dragenter", highlight, false);
  dropArea.addEventListener("dragover", highlight, false);
  dropArea.addEventListener("dragleave", unhighlight, false);
  dropArea.addEventListener("drop", handleDrop, false);

  return {
    handleFiles
  };
}

const dropFile = new DropFile("drop-file", "files");
</script>
	<script>
function getDegAngle(x0, y0, x1, y1) {
    const y = y1 - y0;
    const x = x1 - x0;
    return Math.atan2(y, x) * (180 / Math.PI);
}

function addClass(el, className) {
    el.classList.add(className);
}
function removeClass(el, className) {
    el.classList.remove(className);
}

const DECAY = 4;
const SPREAD = 50;
const GRAVITY = 1200;

let angle = 270;
let shoot = false;

let dpr = window.devicePixelRatio || 1;
const tada = document.getElementById('tada');
const shaker = document.getElementById('shaker');
const intro = document.getElementById('intro');
const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');

let confettiSpriteIds = [];
let confettiSprites = {};

ctx.scale(dpr, dpr);

function setCanvasSize() {
    canvas.width = window.innerWidth * dpr;
    canvas.height = window.innerHeight * dpr;
    // canvas.style.width = window.innerWidth + 'px';
    // canvas.style.height = window.innerHeight + 'px';
}

function setupListeners() {
    // Use TweenLite tick event for the render loop
    TweenLite.ticker.addEventListener('tick', render);
    
    canvas.addEventListener('mousedown', handleMousedown);
    canvas.addEventListener('mouseup', handleMouseup);
    canvas.addEventListener('mousemove', handleMousemove);
    canvas.addEventListener('touchstart', handleMousedown);
    canvas.addEventListener('touchend', handleMouseup);
    canvas.addEventListener('touchmove', handleTouchmove);
    canvas.addEventListener('resize', setCanvasSize);
}

function handleMousemove(e) {
    const pointerAngle = getDegAngle(canvas.width/2, canvas.height*.9, e.clientX*dpr, e.clientY*dpr);
    angle = pointerAngle;
    tada.style.transform = `translateX(0)rotate(${angle + 45}deg)`;
}
function handleTouchmove(e) {
    const pointerAngle = getDegAngle(canvas.width/2, canvas.height*.9, e.touches[0].clientX*dpr, e.touches[0].clientY*dpr);
    angle = pointerAngle;
    tada.style.transform = `translateX(0)rotate(${angle + 45}deg)`;
}

function handleMousedown() {
    shoot = true;
    addClass(shaker, 'shake');
    addClass(intro, 'bye');
}
function handleMouseup() {
    shoot = false;
    removeClass(shaker, 'shake');
}

function addConfettiParticles(amount, angle, velocity, x, y) {
    let i = 0;
    while (i < amount) {
        // sprite
        const r = _.random(4, 6) * dpr;
        const d = _.random(15, 25) * dpr;
        
        const cr = _.random(50, 255);
        const cg = _.random(50, 200);
        const cb = _.random(50, 200);
        const color = `rgb(${cr}, ${cg}, ${cb})`;
        
        const tilt = _.random(10, -10);
        const tiltAngleIncremental = _.random(0.07, 0.05);
        const tiltAngle = 0;

        const id = _.uniqueId();
        const sprite = {
            [id]: {
                angle,
                velocity,
                x,
                y,
                r,
                d,
                color,
                tilt,
                tiltAngleIncremental,
                tiltAngle,
            },
        };

        Object.assign(confettiSprites, sprite);
        confettiSpriteIds.push(id);
        tweenConfettiParticle(id);
        i++;
    }
}

function tweenConfettiParticle(id) {
    const minAngle = confettiSprites[id].angle - SPREAD / 2;
    const maxAngle = confettiSprites[id].angle + SPREAD / 2;
    
    const minVelocity = confettiSprites[id].velocity / 4;
    const maxVelocity = confettiSprites[id].velocity;

    // Physics Props
    const velocity = _.random(minVelocity, maxVelocity);
    const angle = _.random(minAngle, maxAngle);
    const gravity = GRAVITY;
    // const friction = _.random(0.1, 0.25);
    const friction = _.random(0.01, 0.05);
    const d = 0;

    TweenLite.to(confettiSprites[id], DECAY, {
        physics2D: {
            velocity,
            angle,
            gravity,
            friction,
        },
        d,
        ease: Power4.easeIn,
        onComplete: () => {
            // remove confetti sprite and id
            _.pull(confettiSpriteIds, id);
            delete confettiSprites[id];
        },
    });
}

function updateConfettiParticle(id) {
    const sprite = confettiSprites[id];
    
    const tiltAngle = 0.0005 * sprite.d;
    
    sprite.angle += 0.01;
    sprite.tiltAngle += tiltAngle;
    sprite.tiltAngle += sprite.tiltAngleIncremental;
    sprite.tilt = (Math.sin(sprite.tiltAngle - (sprite.r / 2))) * sprite.r * 2;
    sprite.y += Math.sin(sprite.angle + sprite.r / 2) * 2;
    sprite.x += Math.cos(sprite.angle) / 2;
}

function drawConfetti() {
    confettiSpriteIds.map(id => {
        const sprite = confettiSprites[id];
        
        ctx.beginPath();
        ctx.lineWidth = sprite.d / 2;
        ctx.strokeStyle = sprite.color;
        ctx.moveTo(sprite.x + sprite.tilt + sprite.r, sprite.y);
        ctx.lineTo(sprite.x + sprite.tilt, sprite.y + sprite.tilt + sprite.r);
        ctx.stroke();

        updateConfettiParticle(id);
    });
}

function render() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    
    drawConfetti();
}

function shootConfetti() {
    requestAnimationFrame(shootConfetti);
    if (shoot) {
        addConfettiParticles(10, angle, 5000, canvas.width/2, canvas.height*.9);   
    }
}

setupListeners();
setCanvasSize();
// let foo = addConfettiParticles(100, 0, 5000, window.innerWidth/2, window.innerHeight/2);

shootConfetti();


</script>
</body>
</html>