package package_294
{
   import flash.events.Event;
   import package_427.name_2537;
   
   public class name_2538 extends Event
   {
      
      public static const name_2539:String = "KillMe";
      
      public static const name_3053:String = "updateUid";
       
      
      private var _line:name_2537;
      
      public function name_2538(param1:String, param2:name_2537)
      {
         super(param1,false,false);
         this._line = param2;
      }
      
      public function get line() : name_2537
      {
         return this._line;
      }
   }
}
