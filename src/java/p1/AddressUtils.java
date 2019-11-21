package p1;
import java.io.BufferedReader;  
import java.io.DataOutputStream;  
import java.io.IOException;  
import java.io.InputStreamReader;  
import java.io.UnsupportedEncodingException;  

import java.net.HttpURLConnection;  

import java.net.URL;  
import java.util.logging.Level;
import java.util.logging.Logger;
import java.lang.String;


public class AddressUtils {
    
    public static String getAddresses(String content, String encodingString)  
            throws UnsupportedEncodingException {  
        String city="";
        // ��������Ա�API  
        String urlStr = "http://ip.taobao.com/service/getIpInfo.php";  
        // ��http://whois.pconline.com.cnȡ��IP���ڵ�ʡ������Ϣ  
        String returnStr = getResult(urlStr, content, encodingString);  
        if (returnStr != null) {  
            // �����ص�ʡ������Ϣ  
            System.out.println("(1) unicodeת��������ǰ��returnStr : " + returnStr);  
            
            //returnStr = decodeUnicode(returnStr);  
            //System.out.println("(2) unicodeת�������ĺ��returnStr : " + returnStr);  
            ////
            
            int strlen=returnStr.length();System.out.println(strlen);
            char[] rstr = returnStr.toCharArray();
            int n=0;
            System.out.println(returnStr.indexOf("city")); 
            n=returnStr.indexOf("city")+7;
            System.out.println(n); 
            char a='\"';
            while(rstr[n]!=a){
                System.out.print(rstr[n]);
                city=city+rstr[n];
                n=n+1;
            }
            
           System.out.println("city"+city); 
            
            ////
            String c="";
            String[] temp = returnStr.split(",");  
            if(temp.length<3){  
                return "0";//��ЧIP������������  
            }  
            return city;  
        }  
        return null;  
    }  

    /** 
     * @param urlStr 
     *            ����ĵ�ַ 
     * @param content 
     *            ����Ĳ��� ��ʽΪ��name=xxx&pwd=xxx 
     * @param encoding 
     *            ��������������롣��GBK,UTF-8�� 
     * @return 
     */  
    private static String getResult(String urlStr, String content, String encoding) {  
        URL url = null;  
        HttpURLConnection connection = null;  
        try {  
            url = new URL(urlStr);  
            connection = (HttpURLConnection) url.openConnection();// �½�����ʵ��  
            connection.setConnectTimeout(5000);// �������ӳ�ʱʱ�䣬��λ����  
            connection.setReadTimeout(5000);// ���ö�ȡ���ݳ�ʱʱ�䣬��λ����  
            connection.setDoOutput(true);// �Ƿ������� true|false  
            connection.setDoInput(true);// �Ƿ��������true|false  
            connection.setRequestMethod("POST");// �ύ����POST|GET  
            connection.setUseCaches(false);// �Ƿ񻺴�true|false  
            connection.connect();// �����Ӷ˿�  
            DataOutputStream out = new DataOutputStream(connection  
                    .getOutputStream());// ����������Զ˷�����д����  
            out.writeBytes(content);// д����,Ҳ�����ύ��ı� name=xxx&pwd=xxx  
            out.flush();// ˢ��  
            out.close();// �ر������  
            BufferedReader reader = new BufferedReader(new InputStreamReader(  
                    connection.getInputStream(), encoding));// ���Զ�д�����ݶԶ˷�������������  
            // ,��BufferedReader������ȡ  
            StringBuffer buffer = new StringBuffer();  
            String line = "";  
            while ((line = reader.readLine()) != null) {  
                buffer.append(line);  
            }  
            reader.close();  
            return buffer.toString();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            if (connection != null) {  
                connection.disconnect();// �ر�����  
            }  
        }  
        return null;  
    }  
    /** 
     * unicode ת���� ���� 
     * @param theString 
     * @return 
     */  
    public static String decodeUnicode(String theString) {  
        char aChar;  
        int len = theString.length();  
        StringBuffer outBuffer = new StringBuffer(len);  
        for (int x = 0; x < len;) {  
            aChar = theString.charAt(x++);  
            if (aChar == '\\') {  
                aChar = theString.charAt(x++);  
                if (aChar == 'u') {  
                    int value = 0;  
                    for (int i = 0; i < 4; i++) {  
                        aChar = theString.charAt(x++);  
                        switch (aChar) {  
                        case '0':  
                        case '1':  
                        case '2':  
                        case '3':  
                        case '4':  
                        case '5':  
                        case '6':  
                        case '7':  
                        case '8':  
                        case '9':  
                            value = (value << 4) + aChar - '0';  
                            break;  
                        case 'a':  
                        case 'b':  
                        case 'c':  
                        case 'd':  
                        case 'e':  
                        case 'f':  
                            value = (value << 4) + 10 + aChar - 'a';  
                            break;  
                        case 'A':  
                        case 'B':  
                        case 'C':  
                        case 'D':  
                        case 'E':  
                        case 'F':  
                            value = (value << 4) + 10 + aChar - 'A';  
                            break;  
                        default:  
                            throw new IllegalArgumentException(  
                                    "Malformed      encoding.");  
                        }  
                    }  
                    outBuffer.append((char) value);  
                } else {  
                    if (aChar == 't') {  
                        aChar = '\t';  
                    } else if (aChar == 'r') {  
                        aChar = '\r';  
                    } else if (aChar == 'n') {  
                        aChar = '\n';  
                    } else if (aChar == 'f') {  
                        aChar = '\f';  
                    }  
                    outBuffer.append(aChar);  
                }  
            } else {  
                outBuffer.append(aChar);  
            }  
        }  
        return outBuffer.toString();  
    }  
    public static void main(String[] args) {  
       AddressUtils addressUtils = new AddressUtils();  
        // ����ip 219.136.134.157 �й�=����=�㶫ʡ=������=Խ����=����  
        // 1.24.214.14 hhhtip
        String ip = "110.16.88.8";  //
        String address = "";  
        try {  
            address = addressUtils.getAddresses("ip="+ip, "utf-8");  
        } catch (UnsupportedEncodingException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        System.out.println(address);  
    } 
}
