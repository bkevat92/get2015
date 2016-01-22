public class JsonController {
	 public List<Account> accList {get;set;}
    public String jsonData{get; set;}
    public String preparedData() {
         accList = Database.query('select Id,Name from Account');
       return JSON.serialize(accList);
    }
    public JsonController() {
        jsonData = preparedData();
    }

}