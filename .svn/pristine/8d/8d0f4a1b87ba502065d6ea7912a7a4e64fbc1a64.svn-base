<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
/* Scroll top button */
#toTop {
	width: 40px;
	height: 40px;
	background-color: rgba(0, 0, 0, 0.6);
	text-align: center;
	padding: 10px;
	line-height: 20px;
	position: fixed;
	bottom: 10px;
	right: 10px;
	cursor: pointer;
	display: none;
	color: #fff;
	font-size: 20px;
}

#toTop:before {
	font-style: normal;
	font-weight: normal;
	font-family: "fontello";
	content: "▲";
}

#social_footer p {
	font-size: 12px;
	color: #8c8c8c;
}

#social_footer ul {
	margin: 10px;
	padding: 0 0 10px 0;
	text-align: center;
	
}

#social_footer ul li {
	display: inline-block;
	margin: 0 5px 10px 5px;
}

#social_footer ul li a {
	color: #111;
	text-align: center;
	line-height: 34px;
	display: block;
	font-size: 16px;
	width: 35px;
	height: 35px;
	border: 1px solid rgba(255, 255, 255, 0.3);
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

#social_footer ul li a:hover {
	border: 1px solid #FFBB00;
	background: #FFBB00;
	color: #111;
}
</style>  

<script>

/**
 * footer-reveal.js
 * 
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Copyright 2014 Iain Andrew
 * https://github.com/IainAndrew
 */

(function($) {

  $.fn.footerReveal = function(options) {

    var $this = $(this),
        $prev = $this.prev(),
        $win = $(window),

        defaults = $.extend ({
          shadow : true,
          shadowOpacity: 0.8,
          zIndex : -100
        }, options ),

        settings = $.extend(true, {}, defaults, options);

    if ($this.outerHeight() <= $win.outerHeight()) {
      $this.css({
        'z-index' : defaults.zIndex,
        position : 'fixed',
        bottom : 0
      });

      if (defaults.shadow) {
        $prev.css ({
          '-moz-box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + defaults.shadowOpacity + ')',
          '-webkit-box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + defaults.shadowOpacity +')',
          'box-shadow' : '0 20px 30px -20px rgba(0,0,0,' + defaults.shadowOpacity + ')'
        });
      }

      $win.on('load resize', function() {
        $this.css({
          'width' : $prev.outerWidth()
        });
        $prev.css({
          'margin-bottom' : $this.outerHeight()
        });
      });
    }

    return this;

  };

}) (jQuery);


$(function () {
	/* Scroll to top*/
	$(window).scroll(function () {
		if ($(this).scrollTop() != 0) {
			$('#toTop').fadeIn();
		} else {
			$('#toTop').fadeOut();
		}
	});
	$('#toTop').on("click", function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
	});
});

if ($(window).width() >= 768) {
	$('footer.revealed').footerReveal({
	shadow: false,
	opacity:0.6,
	zIndex: 0
});
}

</script>  

	   <footer class="footer revealed" style="text-align:center;">
            <i class="mdi mdi-phone-classic"></i><font style="size:2em;">Tel:</font> <a href="tel://821098482582" id="phone">+821098482582</a>
			<i class="mdi mdi-email-outline"></i><font>  Email: </font> <a href="mailto:perfectr2@naver.com" id="email_footer">perfectr2@naver.com</a>
					 
					 
               <div id="social_footer">
	               <ul>
	               		<li><a href="https://www.twitch.tv/ddudooo"><i class="mdi mdi-twitch icon" ></i></a></li>
						<li><a href="https://www.instagram.com/spring5.0"><i class="ti-instagram icon"></i></a></li>
						<li><a href="#"><i class="ti-facebook icon"></i></a></li>
				
						<p>©Spring5.0</p>
	               </ul>
					
			</div>
					
						
        </footer>
        
        <div id="toTop" class="fas fa-angle-double-up"></div>
        