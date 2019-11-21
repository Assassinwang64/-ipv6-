//��ȡ����IP
package p1;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.IOException;
/**
 *
 * @author lzk
 */
public class getTrueIP {
        /** �ӿڳ�ʱʱ�� */
    private static final Integer TIME_OUT = 1000;
    public static String INTERNET_IP = getV4IP(); // ����IP
    
    //private CustomSystemUtil(){}
    
    /**
     * �������IP
     * @return ����IP
     */
    public static String getV4IP(){
        String ip = "";
        String chinaz = "http://ip.chinaz.com";
        StringBuilder inputLine = new StringBuilder();
        String read = "";
        URL url = null;
        HttpURLConnection urlConnection = null;
        BufferedReader in = null;
        try {
            url = new URL(chinaz);
            try {
                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setConnectTimeout(TIME_OUT);
                urlConnection.setReadTimeout(TIME_OUT);
                in = new BufferedReader( new InputStreamReader(urlConnection.getInputStream(),"UTF-8"));
            } catch (Exception e) {
                //�����ʱ���򷵻�����ip
                return "time out";
            }
            while((read=in.readLine())!=null){
                inputLine.append(read+"\r\n");
            }
            //System.out.println(inputLine.toString());
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(in!=null){
                try {
                    in.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        
        
        Pattern p = Pattern.compile("\\<dd class\\=\"fz24\">(.*?)\\<\\/dd>");
        Matcher m = p.matcher(inputLine.toString());
        if(m.find()){
            String ipstr = m.group(1);
            ip = ipstr;
            //System.out.println(ipstr);
        }
        if ("".equals(ip)) {
            // ���û������IP
            return "";
        }
                System.out.println(ip);
        return ip;
    }
    
    public static void main(String[] args) {
        System.out.println(getV4IP());
    }
}
