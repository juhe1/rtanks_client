package package_125
{
   import flash.events.Event;
   
   public class SendPromoCodeEvent extends Event
   {
      
      public static var name_2910:String = "SendPromoCodeEvent";
       
      
      private var var_3441:String;
      
      public function SendPromoCodeEvent(param1:String)
      {
         this.var_3441 = param1;
         super(name_2910);
      }
      
      public function name_2912() : String
      {
         return this.var_3441;
      }
   }
}
