package package_304
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   
   public class name_1209 extends ErrorEvent
   {
      
      public static const name_1210:String = "loaderError";
       
      
      private var var_2033:String;
      
      public function name_1209(param1:String, param2:String, param3:String)
      {
         super(param1);
         this.text = param3;
         this.var_2033 = param2;
      }
      
      public function get textureName() : String
      {
         return this.var_2033;
      }
      
      override public function clone() : Event
      {
         return new name_1209(type,this.var_2033,text);
      }
      
      override public function toString() : String
      {
         return "[BatchTextureLoaderErrorEvent textureName=" + this.var_2033 + ", text=" + text + "]";
      }
   }
}
