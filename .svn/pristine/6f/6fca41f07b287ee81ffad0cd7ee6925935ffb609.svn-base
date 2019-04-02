package com.col.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Controller
public class FileDownController {

    /**
     * 파일(첨부파일, 이미지등) 다운로드.
     */
    @RequestMapping(value = "fileDownload")
    public void fileDownload(HttpServletRequest request,HttpServletResponse response) {
        String path = "d:\\workspace\\fileupload\\";

        String fileName = request.getParameter("fileName");
        String downName = request.getParameter("downName");
        String realPath = "";

        if (fileName == null || "".equals(fileName)) {
            fileName = downName;
        }

        try {
            fileName = URLEncoder.encode(fileName, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }

        realPath = path + downName.substring(0,4) + "/" + downName;

        File file1 = new File(realPath);
        if (!file1.exists()) {
            return ;
        }

        // 파일명 지정
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realPath);

            int ncount = 0;
            byte[] bytes = new byte[512];

            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException");
        } catch (IOException ex) {
            System.out.println("IOException");
        }
    }

}
