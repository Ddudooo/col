package com.col.login.kakao;

import com.col.register.service.UserVO;
import com.fasterxml.jackson.databind.JsonNode;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;


import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class KakaoLoginBO {


    public static JsonObject getAccessToken(String authorize_code){
        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
        String result="";

        URL url = null;
        try {
            url = new URL(RequestUrl);

            Map<String,Object> params = new LinkedHashMap<>();
                params.put("grant_type","authorization_code");
                params.put("client_id","55bdba35799ca5e188cfe3c592b2ed5b");
                params.put("redirect_uri","http://localhost:8080/col/login/kakao");
                params.put("code",authorize_code);
    //            params.put("client_secret","");
                StringBuilder postData = new StringBuilder();
                for(Map.Entry<String,Object> param : params.entrySet()) {
                    if(postData.length() != 0) postData.append('&');
                    postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                    postData.append('=');
                    postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
                }
                byte[] postDataBytes = postData.toString().getBytes(StandardCharsets.UTF_8);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("POST");

            conn.setDoOutput(true);
            conn.getOutputStream().write(postDataBytes); // POST 호출

                /*
                grant_type	authorization_code로 고정	O
                client_id	앱 생성시 발급 받은 REST API 키.	O
                redirect_uri	코드가 리다이렉트 된 URI.
                설정 > 일반 > 웹 > 사이트 도메인에서 설정한 각각의 도메인에 설정 > 일반 > 웹 > Redirect Path 를 붙인 URI.	O
                code	위 코드 받기에서 발급 받은 인증된 코드.	O
                client_secret설정 > 일반 > Client Secret 에서 생성한 client_secret 코드
                ACTIVE 상태 인 경우 필수로 설정해야 함   X
                 */
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));

            String inputLine;

            while((inputLine = in.readLine()) != null) { // response 출력
//                System.out.println(inputLine);
                result +=inputLine;
            }

            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        JsonParser parser = new JsonParser();
        JsonObject authToken = (JsonObject) parser.parse(result);
        return authToken;
    }

    public static JsonObject getKakaoUserInfo(JsonObject authToken) {

        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        String result="";

        URL url = null;
        try {
            url = new URL(RequestUrl);


            HttpURLConnection conn = (HttpURLConnection)url.openConnection();

            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("Authorization", "Bearer "+authToken.get("access_token"));
            conn.setDoOutput(true);
//            conn.getOutputStream().write(postDataBytes); // POST 호출


            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));

            String inputLine;

            while((inputLine = in.readLine()) != null) { // response 출력
//                System.out.println(inputLine);
                result +=inputLine;
            }

            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        JsonParser parser = new JsonParser();
        JsonObject profile = (JsonObject) parser.parse(result);

        return profile;

    }
    public static UserVO getKakaoUser(UserVO kakao,JsonObject profile) throws Exception {
        //UserVO kakao = new UserVO();

        JsonObject kakaoProperties = (JsonObject) profile.get("properties");
        JsonObject kakaoProfile = (JsonObject) profile.get("kakao_account");
        if("true".equals(String.valueOf(kakaoProfile.get("is_email_valid")))){
            if("true".equals(String.valueOf(kakaoProfile.get("has_email")))){
                kakao.setUserEmail(String.valueOf(kakaoProfile.get("email")).replaceAll("\"",""));
            }else{
                kakao.setUserEmail(kakao.getUserID()+"@kakao.noemail");

            }

        }else{
            //이메일 동의 받으러 이동
            System.out.println("=====================================================================================================================");
            System.out.println("kakao get account_email IS FAIL");
            System.out.println("=====================================================================================================================");

            throw new Exception(getKakaoAccess("account_email"));


        }
        kakao.setUserNick("kakao-"+String.valueOf(kakaoProperties.get("nickname")).replaceAll("\"",""));
        //kakao.setUserImg(String.valueOf(kakaoProperties.get("profile_image")));
        //프로필 이미지
        return kakao;
    }
    public static String getKakaoAccess(String requestInfo){
        final String RequestUrl = "https://kauth.kakao.com/oauth/authorize";
        String result="";
        Map<String,Object> params = new HashMap<>();
        params.put("scope",requestInfo);
        params.put("response_type","code");
        params.put("redirect_uri","http://localhost:8080/col/login/kakao");
        params.put("client_id","55bdba35799ca5e188cfe3c592b2ed5b");
        result += RequestUrl+"?";
        for(Map.Entry<String,Object> param : params.entrySet()){
            if(result.charAt(result.length()-1)!='?'){
                result+="&";
            }
            result+=param.getKey()+"="+param.getValue();
        }
        System.out.println(result);
        return result;
    }
}
