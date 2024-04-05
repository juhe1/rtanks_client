package alternativa.tanks.models.battlefield.gui.chat
{
   import flash.events.Event;
   
   public class name_1337 extends Event
   {
      
      public static const name_1345:String = "sendMessage";
      
      public static const name_1348:String = "closeChat";
       
      
      private var var_1449:String;
      
      private var var_636:Boolean;
      
      public function name_1337(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         this.var_1449 = param2;
         this.var_636 = param3;
      }
      
      public function get message() : String
      {
         return this.var_1449;
      }
      
      public function get var_1146() : Boolean
      {
         return this.var_636;
      }
      
      override public function clone() : Event
      {
         return new name_1337(type,this.var_1449,this.var_636);
      }
      
      override public function toString() : String
      {
         return "[BattleChatEvent type=" + type + ", message=" + this.var_1449 + ", teamOnly=" + this.var_636 + "]";
      }
   }
}
