package p1;
import java.io.UnsupportedEncodingException;
import p1.AddressUtils;
import p1.CustomSystemUtil;
public class Address {
    public static String getAddress(){
        getTrueIP gettrueip = new getTrueIP();  
        String address = "";  
        AddressUtils getcity=new AddressUtils();
        String ip=gettrueip.getV4IP();
        try {  
            address = getcity.getAddresses("ip="+ip, "utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
        return address;
    }
     public static void main(String[] args) {
        getAddress();
    }
}
