trigger LeadConversionEventTrigger on LeadConversionEvent__e  (after insert) {
  LeadClass.leadConversionHandler(trigger.new);
}