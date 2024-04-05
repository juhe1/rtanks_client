package package_280
{
   import flash.events.Event;
   
   public class name_2872 extends Event
   {
      
      public static const name_2874:String = "SliderChangeValue";
       
      
      public var currentValue:Number;
      
      public function name_2872(param1:Number)
      {
         this.currentValue = param1;
         super("SliderChangeValue",true,false);
      }
   }
}
