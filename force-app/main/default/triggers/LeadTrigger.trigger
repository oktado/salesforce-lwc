trigger LeadTrigger on Lead (after insert,after update) {
  LeadClass.leadConvertEvent(trigger.new);    
}