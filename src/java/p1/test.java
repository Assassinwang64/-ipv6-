package p1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;

import org.json.JSONException;
import org.json.JSONObject;
/**
 * java����url��ȡjson����
 * @author openks
 * @since 2013-7-16
 * ��Ҫ���java-json.jar��������
 */
public class test {

  private static String readAll(Reader rd) throws IOException {
    StringBuilder sb = new StringBuilder();
    int cp;
    while ((cp = rd.read()) != -1) {
      sb.append((char) cp);
    }
    return sb.toString();
  }

  public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
    InputStream is = new URL(url).openStream();
    try {
      BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
      String jsonText = readAll(rd);
      JSONObject json = new JSONObject(jsonText);
      return json;
    } finally {
      is.close();
     // System.out.println("ͬʱ ������Ҳ�ܿ��� ����return�ˣ���Ȼ��ִ��finally�ģ�");
    }
  }

  public static void main(String[] args) throws IOException, JSONException {
   //������ðٶȵ�ip��λapi���� ��� http://api.map.baidu.com/lbsapi/cloud/ip-location-api.htm
    JSONObject json = readJsonFromUrl("http://api.map.baidu.com/location/ip?ak=F454f8a5efe5e577997931cc01de3974&ip=202.198.16.3");
    System.out.println(json.toString());
    System.out.println(((JSONObject) json.get("content")).get("address"));
  }
}