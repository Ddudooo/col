<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/wizard/jquery.steps.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/wizard/jquery.validate.min.js"></script>



	<!-- 페이지전체 컨테이너 Footer안올라오게하는 용도 -->


		<div class="wizard-content" >
			<form class="tab-wizard wizard-circle">

				<h6>1번 문제</h6>
				<section>
					<div class="form-group">
						<p>웹 서버에서 웹 문서를 서비스하기 위한 네트워크 표준 프로토콜은?</p>
						<div class="btn-group">
							<button type="button" class="btn btn-primary" value="1">SMTP</button>
							<button type="button" class="btn btn-primary" value="2">HTTP</button>
							<button type="button" class="btn btn-primary" value="3">FTP</button>
							<button type="button" class="btn btn-primary" value="4">HTML</button>
							<button type="button" class="btn btn-primary" value="5">DHCP</button>
						</div>
					</div>
				</section>
				<h6>2번 문제</h6>
				<section>
					<div class="form-group">
						<p>웹 서버에서 웹문서를 전송하기 위하여 사용하는 기본 포트 번호는?</p>
						<div class="btn-group">
							<button type="button" class="btn btn-primary" value="1">23번</button>
							<button type="button" class="btn btn-primary" value="2">25번</button>
							<button type="button" class="btn btn-primary" value="3">80번</button>
							<button type="button" class="btn btn-primary" value="4">88번</button>
							<button type="button" class="btn btn-primary" value="5">78번</button>
						</div>
					</div>
				</section>
				<h6>3번 문제</h6>
				<section>
					<div class="form-group">
						<p>다음 중 웹 브라우저가 아닌것은?</p>
						<div class="btn-group">
							<button type="button" class="btn btn-primary" value="1">텔넷</button>
							<button type="button" class="btn btn-primary" value="2">크롬</button>
							<button type="button" class="btn btn-primary" value="3" >인터넷 익스플로러</button>
							<button type="button" class="btn btn-primary" value="4">파이어폭스</button>
							<button type="button" class="btn btn-primary" value="5">사파리</button>
						</div>
					</div>
				</section>
				<h6>4번 문제</h6>
				<section>
					<div class="form-group">
						<p>다음 factorial(3)의 값은?</p>
						<pre>
							 factorial(int n){ if(n<=1) return 1;
							else return n*factorial(n-1); }
							</pre>
						<div class="btn-group">
							<button type="button" class="btn btn-primary" value="1">6</button>
							<button type="button" class="btn btn-primary" value="2">3</button>
							<button type="button" class="btn btn-primary" value="3">2</button>
							<button type="button" class="btn btn-primary" value="4">12</button>
							<button type="button" class="btn btn-primary" value="5">9</button>
						</div>
					</div>
				</section>
				<h6>5번 문제</h6>
				<section>
					<div class="form-group">
						<p>제이쿼리에 대한 설명으로 옳지 않은 것은?</p>
						<ul class="list-group text-left">
							<li class="list-group-item" value="1">오픈소스 라이브러리이다</li>
							<li class="list-group-item" value="2">제이쿼리 API를 다운로드해서만 사용할 수 있다</li>
							<li class="list-group-item" value="3">자바스크립트 코드 형식보다 간결하다</li>
							<li class="list-group-item" value="4">제이쿼리 코드의 단축형에는 $기호를 사용한다</li>
							<li class="list-group-item" value="5">미국의 존레식이 만들었다</li>
						</ul>
					</div>
				</section>
			</form>
		</div>

<script>
	var form = $(".tab-wizard").show();
    $(".tab-wizard").steps({
        headerTag: "h6",
        bodyTag: "section",
        transitionEffect: "fade",
        titleTemplate: '<span class="step">#index#</span> #title#',
        labels: {
            finish: "제출하기"
        },
        onStepChanging: function (event, currentIndex, newIndex) {
            return currentIndex > newIndex || !(3 === newIndex && Number($("#age-2").val()) < 18) && (currentIndex < newIndex && (form.find(".body:eq(" + newIndex + ") label.error").remove(), form.find(".body:eq(" + newIndex + ") .error").removeClass("error")), form.validate().settings.ignore = ":disabled,:hidden", form.valid())
        },
        onFinishing: function (event, currentIndex) {
            return form.validate().settings.ignore = ":disabled", form.valid()
        },
        onFinished: function (event, currentIndex) {
            swal("배치 고사 제출!", "모두 정답이길 기원합니다");
            let data='{';

            $('section').each(function(){
                let tabID = $(this).attr('id').replace("-uid-0-p-","");
                console.log(tabID);
                data+='"'+tabID+'":';
                let selected = $(this).find(".active").val();
                data+='"'+selected+'",';
                console.log(selected);
            });
            data = data.substr(0,data.length-1);
            data+='}';
            console.log(JSON.stringify(JSON.parse(data)));
            console.log(JSON.stringify(data));
            $.ajax({
                type:'post',
                contentType: "application/json; charset=utf-8",
                url:'${pageContext.servletContext.contextPath}/test/surveyTest',
                data:JSON.stringify(JSON.parse(data)),
                async: false
            }).done(function(msg){
                document.location.href='${pageContext.servletContext.contextPath}/test/'+msg;

            })
        }
    });
	$().ready(function(){
	    $("section").each(function(){
			$("section button").click(function(){

				$(this).closest('div').children().each(function(){
					$(this).removeClass('active');
				});
				$(this).button('toggle');

			});
			$(".list-group-item").click(function(){
				$(this).closest('ul').children().each(function(){
					$(this).removeClass('active');
				});
				$(this).addClass('active');

			})
		});
		$('#testSurveySubmitBtn').click(function(){
			//사용자 입력 확인 및 가져오기
			let data='{';

			$('section').each(function(){
			    let tabID = $(this).attr('id');
			    console.log(tabID);
			    data+='"'+tabID+'":';
			    let selected = $(this).find(".active").text();
			    data+='"'+selected+'",';
			    console.log(selected);
			});
			data = data.substr(0,data.length-1);
			data+='}';
			console.log(data);
		})
	});
</script>