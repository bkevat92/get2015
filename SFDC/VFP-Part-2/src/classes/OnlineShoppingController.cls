public class OnlineShoppingController {
    public List<Custom_Product__c> productList {set ;get;}
    public string selectedCategory {set ;get;}
    public List<Purchase_Line_Item__c> PurchaseLineItemList {set ;get ;}
    public String productID {get ;set ;}
    public String orderID {get ;set ;}
    public List<Id> numberOfLineItems {get ;set;}
    public Boolean isAllCorrect{get ; set;}
    
    public OnlineShoppingController() {
        isAllCorrect = true;
        numberOfLineItems = new List<Id>();
    }
    
    public List<SelectOption> getCategory() {
        
        List<SelectOption> category = new List<SelectOption>();
       
        for(Custom_Product__c product : [select category__c from Custom_Product__c] ) {
            category.add(new SelectOption(product.category__c,product.category__c));
        }
        return category;
    }
    
    public PageReference getProducts() {
        productList = [select Name,Price_Per_Item__c from Custom_Product__c where category__c =: selectedCategory];
        return null;
    }
    
    public PageReference addToCart() {
        isAllCorrect = true;
        Integer index = 0;
        Custom_Product__c prdct = [select Name,Price_Per_Item__c from Custom_Product__c where Id =:productID];
        Purchase_Line_Item__c ordrLine = new Purchase_Line_Item__c();
        ordrLine.Custom_Product__c = productID;
        ordrLine.Price_per_item__c = prdct.Price_per_item__c;
        ordrLine.Quantity__c = 0;
        String orderId = Database.insert(ordrLine).getId();
        ordrLine.Id = orderId;
        if(PurchaseLineItemList == null) {
            PurchaseLineItemList = new List<Purchase_Line_Item__c>();
        }
        for(Custom_Product__c prdct1 : productList) {
            if(prdct1.Id == prdct.Id) 
                break;
            index++;
        }
        productList.remove(index);
        PurchaseLineItemList.add(ordrLine);
 		return null;       
    }
    
    public PageReference remove() {
       	System.debug('orderID' + orderID);
        Integer index = 0;
        for(Purchase_Line_Item__c item : PurchaseLineItemList ) {
            if(item.id == orderID) {
                Purchase_Line_Item__c item1= PurchaseLineItemList.remove(index);
                System.debug('item1' + item1);
                productList.add([select Name,Price_Per_Item__c from Custom_Product__c where Id =:item1.Custom_Product__c]);
       			Database.delete(orderID);
                break;
            }
                
                index++;
        }
        index = 0;
        for(Id idFromList : numberOfLineItems) {
           	   if(idFromList == orderID) {
                   break;
            	}
            index++;
       	    } 
        numberOfLineItems.remove(index);
        if(numberOfLineItems.size() == PurchaseLineItemList.size()) {
            isAllCorrect = false;
        }
        if(numberOfLineItems.size() == 0) {
            isAllCorrect = true;
        }
        System.debug('numberOfLineItems.size() == PurchaseLineItemList.size()  '+numberOfLineItems.size() +' '+ PurchaseLineItemList.size());
        return null;
    }
    
    public PageReference addToOrder() {
        Purchase_Order__c ordr = new Purchase_Order__c();
        String orderId = Database.insert(ordr).getId();
        ordr.Id = orderId;
        for(Purchase_Line_Item__c lineItem : PurchaseLineItemList) {
            lineItem.Purchase_Order__c = orderId;
        }
        upsert PurchaseLineItemList; 
        return null;
    }
    
    public PageReference checkQuantity() {
        Integer index = 0;
        for(Purchase_Line_Item__c item : PurchaseLineItemList ) {
            if(item.id == orderID) {
                break;
            }
            index++;
        }
        Purchase_Line_Item__c item = PurchaseLineItemList[index];
        Custom_Product__c prdct = [select 	Available_Quatity__c from Custom_Product__c where id =: item.Custom_Product__c];
        if(prdct.Available_Quatity__c < item.Quantity__c) {
            remove();
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Sorry Quantity is not as your expectation! you can only order  '+prdct.Available_Quatity__c +' items'));
        }
        Boolean isAvail = false;
        if(numberOfLineItems.size() == 0) {
             numberOfLineItems.add(orderID);
        }
        else {
           for(Id idFromList : numberOfLineItems) {
           	   if(idFromList == orderID) {
                   isAvail=true;
                	break;
            	}
       	    } 
            if(isAvail == false) {
                numberOfLineItems.add(orderId);
            }
        }
        if(numberOfLineItems.size() == PurchaseLineItemList.size()) {
            isAllCorrect = false;
        }
        return null;
    }
}