public class Spoon implements Kitchen 
{
    public string modelNumber ;
    public Spoon()
    {
    	    modelNumber = 'NEW SPOON';
    }
    public Spoon(String modelNumber)
    {
    	    this.modelNumber = modelNumber;
    }
    public String getModelNumber()
    {
        return modelNumber;
    }
    public void setModelNumber(String modelNumber)
    {
    	    this.modelNumber = modelNumber;
    }
}