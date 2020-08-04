package sinosoft;


import com.sinosoft.ybframework.core.util.JdomUtil;
import org.apache.ibatis.javassist.bytecode.stackmap.BasicBlock;
import org.jdom.Document;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.awt.*;
import java.io.*;

/**
 * @author PengYF
 * @date 2020/7/29 11:06
 */
@Component
public class keyPathTest{
    final static Logger logger = LoggerFactory.getLogger(keyPathTest.class);
    @Value("${keyPath}")
    public String keyPath;
//    String keyPath = "C:/Users/PengYF/Desktop/sinosoft/";
    @Test
    public void aa(){
        logger.info("111    "+keyPath);
//        try{
//            System.out.println(keyPath);
//            InputStream in = new FileInputStream(keyPath+"test.xml");
//            BufferedReader mBufReader = new BufferedReader(new InputStreamReader(in));
//            for (String tLineMsg; null != (tLineMsg=mBufReader.readLine());) {
//                logger.info(tLineMsg);
//            }
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }


    }

}
