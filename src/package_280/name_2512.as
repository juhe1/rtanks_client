package package_280
{
   import flash.events.Event;
   
   public class name_2512 extends Event
   {
      
      public static const name_1345:String = "SendMessage";
       
      
      public var rangTo:int;
      
      public var nameTo:String;
      
      public function name_2512(param1:int = 0, param2:String = "")
      {
         this.rangTo = param1;
         this.nameTo = param2;
         super("SendMessage",true,false);
      }
   }
}
