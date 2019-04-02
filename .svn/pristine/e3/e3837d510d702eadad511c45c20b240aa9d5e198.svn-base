<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Create a simple CodeMirror instance -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/theme/monokai.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/theme/darcula.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/theme/eclipse.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/theme/rubyblue.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/theme/idea.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/codemirror/addon/dialog/dialog.css">
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/lib/codemirror.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/dialog/dialog.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/edit/matchbrackets.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/mode/clike/clike.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/mode/javascript/javascript.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/mode/python/python.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/selection/active-line.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/search/search.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/search/searchcursor.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/search/jump-to-line.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/scroll/annotatescrollbar.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/search/matchesonscrollbar.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/addon/search/match-highlighter.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/codemirror/keymap/sublime.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	.CodeMirror {border-top: 1px solid black; border-bottom: 1px solid black;}
	.CodeMirror-focused .cm-matchhighlight {
		background-position: bottom;
		background-repeat: repeat-x;
	}
	.cm-matchhighlight {background-color: lightgreen}
	.CodeMirror-selection-highlight-scrollbar {background-color: green}
</style>
<script>
    var editor = "";
    var codeLang;
	$().ready(function () {
        $('.testContent').html("${test.testContent}");
        //초기 코드 설정
		var CEditor = "#include <iostream>\n\n"+
        "int main() {\n"+
            "std::cout << \"hello, world\" << std::endl;\n"+
            "return 0;\n"+
        "}";

        var javaEditor = "public class Main {\n"
            + "   public static void main(String[] args) {\n" +
			"		System.out.println(\"hello, world\");\n" +
			"	}\n"
            + "}\n";
		var JSEditor = "console.log(\"hello, world\");";
		var PythonEditor = "print(\"hello, world\")";
		//
		// $('#testUserInput').val();
        	editor = CodeMirror.fromTextArea(document.getElementById('testUserInput'), {
            lineNumbers: true,
            lineWrapping: true,
            styleActiveLine: true,
            styleActiveSelected: true,
            matchBrackets: true,
            keyMap: "sublime",
            highlightSelectionMatches: {showToken: /\w/, annotateScrollbar: true},
            mode: "text/x-java",
			theme: 'monokai'
        });
		editor.setValue(javaEditor);
		codeLang="Java";

		$('.editorLanguage button').click(function(){
            let select = $(this).val();

            let current = editor.getOption("mode");
            //console.log(current);
			if("text/x-c++src"==current){
			    CEditor = editor.getValue();
			}else if("text/x-java"==current){
			    javaEditor=editor.getValue();
			}else if("python"==current){
			    PythonEditor=editor.getValue();
			}else if("javascript"){
			    JSEditor=editor.getValue();
			}
            if(select=="C++"){
                editor.setValue(CEditor);
                editor.setOption("mode","text/x-c++src");
            }if(select=="Java"){
                editor.setValue(javaEditor);
                editor.setOption("mode","text/x-java");
            }else if(select=="Python"){
                editor.setValue(PythonEditor);
                editor.setOption("mode","python");
            }else if(select=="Javascript"){
                editor.setValue(JSEditor);
                editor.setOption("mode","javascript");
            }
            codeLang = select;
		});

        $('.editorTheme button').click(function (){
            let select = $(this).val();

            editor.setOption("theme",select);
        })
    });
    function testSubmit() {
		if(${sessionScope.login == null}){
            document.getElementById('id01').style.display='block';
            return false;
        }

        var $form = $('<form></form>');
        $form.attr('action', '${pageContext.servletContext.contextPath}/test/answer');
        $form.attr('method', 'post');

        $form.appendTo('body');

        let testNum = $('<input name="testNum" type="hidden" value="'+'${test.testNum}'+'" >');
        let userID = $('<input name="userID" type="hidden" value="'+'${sessionScope.login}'+'" >');
        let sourceCode = $('<input name ="sourceCode" type="hidden" value=\''+editor.getValue()+'\' >');
		let subLang = $('<input name="subLang" type="hidden" value="'+codeLang+'" >');

        $form.append(testNum).append(userID).append(sourceCode).append(subLang);
        $form.submit();

    }
    function replaceAll(str, searchStr, replaceStr) {
        return str.split(searchStr).join(replaceStr);
    }

</script>
<div class="page-wrapper">
    <div class="container-fluid">
		<div class="row page-titles">
			<div class="col-md-5 align-self-center">
				<h4 class="text-themecolor">Test - 상시테스트</h4>
			</div>
			<div class="col-md-7 align-self-center text-right">
				<div class="d-flex justify-content-end align-items-center">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.servletContext.contextPath}">Home</a></li>
						<li class="breadcrumb-item active">Test</li>
					</ol>
				</div>
			</div>
		</div>
		<div class="card">
		<div class="card-body">
			<div class="card-title">
					<b><h2>${test.testTitle}</h2></b>
				
			</div>

			<div class="w3-row w3-selection w3-margin-left w3-margin-bottom">
				<div class="testContent w3-row w3-selection"></div>
			</div>
			
			<div class="w3-bar w3-light-blue w3-text-white">
				<div class="w3-bar-item">${test.testCate}</div>
				<div class="w3-bar-item">${test.testLevel}</div>
				<div class="w3-bar-item">${test.testPoint}</div>
				<div class="w3-dropdown-hover w3-right">
					<button class="w3-button w3-indigo w3-hover-teal">에디터 테마</button>
					<div class="editorTheme w3-dropdown-content w3-bar-block w3-border" style=" z-index: 100;">
						<button value="monokai" class="w3-bar-item w3-button">monokai</button>
						<button value="darcula" class="w3-bar-item w3-button">darcula</button>
						<button value="eclipse" class="w3-bar-item w3-button">eclipse</button>
						<button value="rubyblue" class="w3-bar-item w3-button">rubyblue</button>
						<button value="idea" class="w3-bar-item w3-button">idea</button>
					</div>
				</div>
				<div class="w3-dropdown-hover w3-right ">
					<button class="w3-button w3-blue w3-hover-blue-gray">언어 변경</button>
					<div class="editorLanguage w3-dropdown-content w3-bar-block w3-border" style=" z-index: 100;">
						<button value="C++" class="w3-bar-item w3-button">C++</button>
						<button value="Java" class="w3-bar-item w3-button">Java</button>
						<button value="Javascript" class="w3-bar-item w3-button">Javascript</button>
						<button value="Python" class="w3-bar-item w3-button">Python</button>
					</div>
				</div>
			</div>
		
			<div class="w3-row w3-selection">
				<textarea id="testUserInput" ></textarea>
			</div>
		</div>
		<div class="card-body text-center">
			<button class="btn btn-primary waves-effect waves-light" onclick="testSubmit();">코드 제출</button>
		</div>
		</div>
	</div>
</div>