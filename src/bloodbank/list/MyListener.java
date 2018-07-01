package bloodbank.list;

import java.util.Calendar;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener implements HttpSessionListener 
{
     HttpSession hs;
    /**
     * Default constructor. 
     */
    public MyListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)
    { 
         hs=se.getSession();
         long l=hs.getCreationTime();
         Calendar c=Calendar.getInstance();
         c.setTimeInMillis(l);
         System.out.println("DAY is"+c.get(Calendar.DATE));
         System.out.println("Hour is"+c.get(Calendar.HOUR));
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    }
	
}
