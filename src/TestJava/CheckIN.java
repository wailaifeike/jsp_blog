package TestJava;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class CheckIN {
    private Date inTime;

    public CheckIN(Date inTime) {
        this.inTime = inTime;
    }

    public String getFormatTime(String format) {
        String value = null;
        DateFormat dateFormat = new SimpleDateFormat(format);
        value =dateFormat.format(inTime);
        return value;
    }

    public static String getTime() {
//        CheckIN cin = new CheckIN(new Date(System.currentTimeMillis()));
//        String formatTime = cin.getFormatTime("YYYY-MM-DD HH:MM:ss");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String formatTime = df.format(new Date());
        return  formatTime;
    }

    //public static void main(String agrs[]){
//        String nowtime = CheckIN.getTime();
       // SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        //System.out.println(df.format(new Date()));
//        System.out.println(nowtime);
   // }

}