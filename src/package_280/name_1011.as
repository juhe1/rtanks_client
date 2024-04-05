package package_280
{
   import flash.events.Event;
   
   public class name_1011 extends Event
   {
      
      public static const ALERT_BUTTON_PRESSED:String = "CloseAlert";
       
      
      private var var_1733:String;
      
      public function name_1011(param1:String)
      {
         super("CloseAlert",true,false);
         this.var_1733 = param1;
      }
      
      public function get name_982() : String
      {
         return this.var_1733;
      }
   }
}
