trigger Lead_Trans on Lead (before insert) {
    Lead_Shedulable.call(trigger.new);
}