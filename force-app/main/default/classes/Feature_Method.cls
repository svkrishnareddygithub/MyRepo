public class Feature_Method {
    
    public static void callMe(){
        System.debug('1st line');
        System.debug('2nd Line');
    }
    @future
    public static void invoke(){
        System.debug('3st line');
        System.debug('4nd Line');
    }
    public void show(){
        System.debug('5st line');
        System.debug('6nd Line');
        callMe();
        System.debug('7st line');
        System.debug('8nd Line');
        invoke();
        System.debug('9st line');
        System.debug('10nd Line');
    }
}