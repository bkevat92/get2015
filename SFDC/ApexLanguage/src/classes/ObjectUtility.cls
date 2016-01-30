public class ObjectUtility{
 public static Map<String,schema.SObjectType> getAllsObjects()
 {
     return schema.getGlobalDescribe();
 }
}