trigger ContactTrigger on Contact (before insert,before update) {
  ContactClass.calculateWeightStatus(trigger.new, trigger.oldMap);
}