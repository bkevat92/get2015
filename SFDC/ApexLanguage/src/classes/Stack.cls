public class Stack {
    
   private  Integer top;
   Integer[] myList = new List<Integer>();
    
   public Stack()
   {
       top = -1;
   }
    public Boolean isEmty()
    {
        if(top == -1)
        return true; 
     else 
         return false;
    }
    
    public Integer peek()
    {
        return isEmty()?0:myList[top];
    }
    
    public void push(Integer item)
    {
        top++;
        myList.add(item);
    }
    
    public Integer pop()
    {
        return isEmty()?0:myList[--top];
    }
    
    public Integer size()
    {
        return top+1;
    }

}