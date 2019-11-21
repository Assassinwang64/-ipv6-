package p1;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;


public class CustomSystemUtil {
    public static String INTRANET_IP = getIntranetIp(); // ����IP
    public static String INTERNET_IP = getInternetIp(); // ����IP

    public CustomSystemUtil(){}

    /**
     * �������IP
     * @return ����IP
     */
    public static String getIntranetIp(){
        try{
            return InetAddress.getLocalHost().getHostAddress();
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    /**
     * �������IP
     * @return ����IP
     */
    public static String getInternetIp(){
        try{
            Enumeration<NetworkInterface> networks = NetworkInterface.getNetworkInterfaces();
            InetAddress ip = null;
            Enumeration<InetAddress> addrs;
            while (networks.hasMoreElements())
            {
                addrs = networks.nextElement().getInetAddresses();
                while (addrs.hasMoreElements())
                {
                    ip = addrs.nextElement();
                    if (ip != null
                            && ip instanceof Inet4Address
                            && ip.isSiteLocalAddress()
                            && !ip.getHostAddress().equals(INTRANET_IP))
                    {
                        System.out.println(ip.getHostAddress());
                        return ip.getHostAddress();
                        
                    }
                }
            }

            // ���û������IP���ͷ�������IP
            return INTRANET_IP;
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args){
        //getInternetIp();
    }
}