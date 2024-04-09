package package_20
{
   import alternativa.osgi.OSGi;
   import flash.utils.getQualifiedClassName;
   import package_13.Long;
   import platform.client.fp10.core.registry.name_29;
   import platform.client.fp10.core.type.*;
   
   public class GameClass implements name_178
   {
       
      
      private var var_21:Long;
      
      private var var_232:Vector.<Long>;
      
      public function GameClass(param1:Long, param2:Vector.<Long> = null)
      {
         super();
         this.var_21 = param1;
         if(param2 != null)
         {
            this.var_232 = param2;
         }
         else
         {
            this.var_232 = new Vector.<Long>();
         }
      }
      
      public function get id() : Long
      {
         return this.var_21;
      }
      
      public function get models() : Vector.<Long>
      {
         return this.var_232;
      }
      
      public function toString() : String
      {
         var _loc1_:int = 0;
         var _loc2_:name_29 = name_29(OSGi.getInstance().getService(name_29));
         var _loc3_:String = "ClientClass\n";
         _loc3_ += "  id: " + this.var_21 + "\n";
         if(this.var_232.length > 0)
         {
            _loc3_ += "  models:\n";
            _loc1_ = 0;
            while(_loc1_ < this.var_232.length)
            {
               _loc3_ += "    id: " + this.var_232[_loc1_] + ", class: " + getQualifiedClassName(_loc2_.getModel(this.var_232[_loc1_])) + "\n";
               _loc1_++;
            }
         }
         return _loc3_;
      }
   }
}
