public class Static_Class {
 //Instance variable 
 public static Integer deliveries = 0; 
 //Static variable 
 public static Integer totalDeliveries = 0; 
 
 //Instance method 
 public static void deliveryMade(){ 
 //Increment both variables by one 
 deliveries++; 
 totalDeliveries++; 
     System.debug(totalDeliveries);
 } 
 
 //Static method as it does not need any instance methods 
 public static  void convertMilesToKilometers(){ 
     System.debug(totalDeliveries);
 
 } 
}