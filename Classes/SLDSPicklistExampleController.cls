/**
* Controller        : SLDSPicklistExampleController
* Created by        : Jiten (G10)
* Version           : 1.0  -- Initail Draft(25-11-2016)    
* Description       : This class will contain all the server logic of the page SLDSPicklistExample 
*                   : Inline comments are added to get specific details.
**/

public class SLDSPicklistExampleController{
    
    /* DEFAULT CONTRUCTORS */
    public SLDSPicklistExampleController(){
        
    }
    
    /* PARAMETERIZE CONTRUCTORS */
    public SLDSPicklistExampleController(ApexPages.StandardController stdController){
        
    }

    /*
    * Method Name   : getAllPicklistValues
    * Description   : Method will Fetch picklist Values Dynamically    
    * @param        : None
    * @returns      : Picklist values as string 
    */
    
    public static String getAllPicklistValues(){
    
        PickListValues pickVals = new PickListValues();
        
        Schema.DescribeFieldResult CampaignTypeFieldDescribe = Campaign.Type.getDescribe();
        for(Schema.PicklistEntry loop_var : CampaignTypeFieldDescribe.getPicklistValues()){
              pickVals.campaignType.add(loop_var.getLabel());
        }
        
        Schema.DescribeFieldResult CampaignProductFieldDescribe = Campaign.Active_Product__c.getDescribe();
        for(Schema.PicklistEntry loop_var : CampaignProductFieldDescribe.getPicklistValues()){
              pickVals.campaignProduct.add(loop_var.getLabel());
        }
        
        Schema.DescribeFieldResult CampaignStatusDescribe = Campaign.status.getDescribe();
        for(Schema.PicklistEntry loop_var : CampaignStatusDescribe.getPicklistValues()){
              pickVals.campaignStatus.add(loop_var.getLabel());
        }
        
        return JSON.serialize(pickVals);
   }
   
   // WRAPPER CLASS TO HOLD ALL PICKLIST VALUES
   
   public class PickListValues{
            public List<String> campaignType {get;set;}
            public List<String> campaignProduct {get;set;}
            public List<String> campaignStatus {get;set;}
            
            public PickListValues(){
                campaignType = new List<String>();
                campaignProduct = new List<String>();
                campaignStatus = new List<String>();
            }           
   }

}