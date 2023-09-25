trigger SivaTrigger on Contact (after insert) {
   database.executeBatch(new pro_task(trigger.new));
}