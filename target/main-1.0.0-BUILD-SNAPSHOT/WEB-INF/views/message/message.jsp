
<!DOCTYPE html>
<html>
  <head>
    <title>WebSocket Chat Client</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <script type="text/javascript" src="/VTS/js/java-websocket/prototype.js"></script>
    <script type="text/javascript" src="/VTS/js/java-websocket/swfobject.js"></script>
    <script type="text/javascript" src="/VTS/js/java-websocket/FABridge.js"></script>

    <script type="text/javascript">
        document.observe("dom:loaded", function() {
            function log(text) {
                $("log").innerHTML = (new Date).getTime() + ": " + (!Object.isUndefined(text) && text !== null ? text.escapeHTML() : "null") + $("log").innerHTML;
            }

            if (!window.WebSocket) {
                log("WebSocket not natively supported, falling back to Flash");
                WEB_SOCKET_DEBUG = true;

                $$("head")[0].insert(new Element("script", {
                  "type": "text/javascript",
                  "src": "/VTS/js/java-websocket/web_socket.js"
                }));

            } else {
                log("Using browser's native WebSocket implementation")
            }

            var ws;

            $("uriForm").observe("submit", function(e) {
                e.stop();
                ws = new WebSocket($F("uri"));
                ws.onopen = function() {
                    log("[WebSocket#onopen]\n");
                }
                ws.onmessage = function(e) {
                    log("[WebSocket#onmessage] Message: '" + e.data + "'\n");
                }
                ws.onclose = function() {
                    log("[WebSocket#onclose]\n");
                    $("uri", "connect").invoke("enable");
                    $("disconnect").disable();
                    ws = null;
                }
                $("uri", "connect").invoke("disable");
                $("disconnect").enable();
            });

            $("sendForm").observe("submit", function(e) {
                e.stop();
                if (ws) {
                    var textField = $("textField");
                    ws.send(textField.value);
                    log("[WebSocket#send]      Send:    '" + textField.value + "'\n");
                    textField.value = "";
                    textField.focus();
                }
            });

            $("disconnect").observe("click", function(e) {
                e.stop();
                if (ws) {
                    ws.close();
                }
            });
        });
    </script>
  </head>
  <body>
      <form id="uriForm"><input type="text" id="uri" value="ws://localhost:8887" style="width:200px;"> <input type="submit" id="connect" value="Connect"><input type="button" id="disconnect" value="Disconnect" disabled="disabled"></form><br>
      <form id="sendForm"><input type="text" id="textField" value="" style="width:200px;"> <input type="submit" value="Send"></form><br>
      <form><textarea id="log" rows="30" cols="100" style="font-family:monospace; color:red;"></textarea></form><br>
  </body>
</html> 
[출처] HTML5 - WebSocket (java-WebSocket opensource 활용 [Push Server])|작성자 최고영회