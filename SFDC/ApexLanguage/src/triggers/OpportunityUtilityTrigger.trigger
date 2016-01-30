trigger OpportunityUtilityTrigger on Opportunity (Before update) {
   OpportunityUtility.updateManagerField(Trigger.new);
}