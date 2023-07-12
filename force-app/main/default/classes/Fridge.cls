public class Fridge implements Kitchen 
{
    public String ModelNumber;
    
    Public Fridge()
    {
        ModelNumber = null ;
    }
    
    Public Fridge(String mod)
    {
        ModelNumber = mod;
    }
    
    public String getModelNumber()
    {
       return ModelNumber; 
    }
    
    public void setModelNumber(String ModelNumber)
    {
        this.ModelNumber = ModelNumber;
    }
}