trigger AccountTrigger on Account (after insert, after update) {
   // if(AccountTriggerHandler.executeTrigger){
        if(Trigger.isAfter){
          if(Trigger.isInsert || Trigger.isUpdate){
            Boolean attributesChanged = AccountTriggerHandler.attributesAreChanged(Trigger.newMap);
            if(attributesChanged){
                AccountTriggerHandler.updateOppMarketingAttributes(Trigger.newMap);
            }
          }  
        }
    //  }
}