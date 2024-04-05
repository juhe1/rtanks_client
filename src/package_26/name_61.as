package package_26
{
   import flash.events.EventDispatcher;
   import package_13.Long;
   import package_27.name_59;
   
   public class name_61 extends EventDispatcher implements name_59
   {
       
      
      private var var_246:Vector.<Long>;
      
      public function name_61()
      {
         super();
      }
      
      public function get clanMembers() : Vector.<Long>
      {
         return this.var_246;
      }
      
      public function set clanMembers(param1:Vector.<Long>) : void
      {
         this.var_246 = param1;
      }
   }
}
