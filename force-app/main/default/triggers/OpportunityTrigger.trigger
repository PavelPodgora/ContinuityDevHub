trigger OpportunityTrigger on Opportunity (after insert, after update) {

//if(OpportunityTriggerHandler.executeTrigger){
  if(Trigger.isAfter){
    if(Trigger.isInsert || Trigger.isUpdate){
      Boolean attributesChanged = OpportunityTriggerHandler.attributesAreChanged(Trigger.new);
      if(attributesChanged){
        OpportunityTriggerHandler.updateAccountMarketingAttributes(Trigger.new);
      }
    }  
  }
//}
    
}