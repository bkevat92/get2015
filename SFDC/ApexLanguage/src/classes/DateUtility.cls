public class DateUtility {
   public static Integer workingdaysBetween(Date d1, Date d2)
    {  
        if(d1.daysBetween(d2) == 0)
        {   return 0;}
        if(d2 < d1)
       {
          Date d = d2;
          d2 = d1;
          d1 = d;
       }
       Integer wdays = 0;
       Integer daysToSunday = 7-Math.abs(Math.mod(d1.daysBetween(Date.newInstance(2016,1,3)), 7));
       d1 = d1.addDays(daysToSunday);
       if(daysToSunday > 2 )
       {
          wdays = wdays+(daysToSunday-2);
       }
        if(d1.daysBetween(d2) != 0)
        { 
               Integer range = (d1.daysBetween(d2))-1;
               wdays = wdays+(range/7)*5;
               Integer remdays = Math.mod(range, 7);
               wdays = wdays+((remdays < 5)?remdays:5);
         }
       return wdays;        
    }
}