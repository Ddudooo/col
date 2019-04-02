<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/wizard/jquery.steps.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/assets/node_modules/wizard/jquery.validate.min.js"></script>

<div class="page-wrapper">
	<div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">배치고사</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">Survey Test</li>
					</ol>
				</div>
			</div>
		</div>

		<div class="card text-center">
			<div class="card-body">
				<div class="table-responsive">
					<div class="wizard-content" >
						<form class="tab-wizard wizard-circle">

							<h6>1번 문제</h6>
							<section>
								<div class="form-group">
									<p>웹 서버에서 웹 문서를 서비스하기 위한 네트워크 표준 프로토콜은?</p>
									<div class="btn-group">
										<button type="button" class="btn btn-primary"  disabled value="1">SMTP</button>
										<button type="button" class="btn btn-primary active" value="2">HTTP</button>
										<button type="button" class="btn btn-primary"  disabled value="3">FTP</button>
										<button type="button" class="btn btn-primary"  disabled value="4">HTML</button>
										<button type="button" class="btn btn-primary"  disabled value="5">DHCP</button>
									</div>
								</div>
							</section>
							<h6>2번 문제</h6>
							<section>
								<div class="form-group">
									<p>웹 서버에서 웹문서를 전송하기 위하여 사용하는 기본 포트 번호는?</p>
									<div class="btn-group">
										<button type="button" class="btn btn-primary"  disabled value="1">23번</button>
										<button type="button" class="btn btn-primary"  disabled value="2">25번</button>
										<button type="button" class="btn btn-primary active"  value="3">80번</button>
										<button type="button" class="btn btn-primary"  disabled value="4">88번</button>
										<button type="button" class="btn btn-primary"  disabled value="5">78번</button>
									</div>
								</div>
							</section>
							<h6>3번 문제</h6>
							<section>
								<div class="form-group">
									<p>다음 중 웹 브라우저가 아닌것은?</p>
									<div class="btn-group">
										<button type="button" class="btn btn-primary active" value="1">텔넷</button>
										<button type="button" class="btn btn-primary"  disabled value="2">크롬</button>
										<button type="button" class="btn btn-primary"  disabled value="3" >인터넷 익스플로러</button>
										<button type="button" class="btn btn-primary"  disabled value="4">파이어폭스</button>
										<button type="button" class="btn btn-primary"  disabled value="5">사파리</button>
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
										<button type="button" class="btn btn-primary active"   value="1">6</button>
										<button type="button" class="btn btn-primary"  disabled value="2">3</button>
										<button type="button" class="btn btn-primary"  disabled value="3">2</button>
										<button type="button" class="btn btn-primary"  disabled value="4">12</button>
										<button type="button" class="btn btn-primary"  disabled value="5">9</button>
									</div>
								</div>
							</section>
							<h6>5번 문제</h6>
							<section>
								<div class="form-group">
									<p>제이쿼리에 대한 설명으로 옳지 않은 것은?</p>
									<ul class="list-group text-left">
										<li class="list-group-item"  disabled value="1">오픈소스 라이브러리이다</li>
										<li class="list-group-item active" value="2">제이쿼리 API를 다운로드해서만 사용할 수 있다</li>
										<li class="list-group-item"  disabled value="3">자바스크립트 코드 형식보다 간결하다</li>
										<li class="list-group-item"  disabled value="4">제이쿼리 코드의 단축형에는 $기호를 사용한다</li>
										<li class="list-group-item"  disabled value="5">미국의 존레식이 만들었다</li>
									</ul>
								</div>
							</section>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
    var form = $(".tab-wizard").show();
    $(".tab-wizard").steps({
        headerTag: "h6",
        bodyTag: "section",
        transitionEffect: "fade",
        titleTemplate: '<span class="step">#index#</span> #title#',
        labels: {
            finish: "홈으로!"
        },
        onStepChanging: function (event, currentIndex, newIndex) {
            return currentIndex > newIndex || !(3 === newIndex && Number($("#age-2").val()) < 18) && (currentIndex < newIndex && (form.find(".body:eq(" + newIndex + ") label.error").remove(), form.find(".body:eq(" + newIndex + ") .error").removeClass("error")), form.validate().settings.ignore = ":disabled,:hidden", form.valid())
        },
        onFinishing: function (event, currentIndex) {
            return form.validate().settings.ignore = ":disabled", form.valid()
        },
        onFinished: function (event, currentIndex) {
			document.location.href="${pageContext.servletContext.contextPath}";
        }
    });
</script>


