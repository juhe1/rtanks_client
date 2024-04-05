package package_142
{
   import platform.client.fp10.core.type.name_70;
   
   public class name_392
   {
       
      
      private var var_408:Vector.<name_70>;
      
      public function name_392(param1:Vector.<name_70> = null)
      {
         super();
         this.var_408 = param1;
      }
      
      public function get resistances() : Vector.<name_70>
      {
         return this.var_408;
      }
      
      public function set resistances(param1:Vector.<name_70>) : void
      {
         this.var_408 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "MountedResistancesCC [";
         _loc1_ += "resistances = " + this.resistances + " ";
         return _loc1_ + "]";
      }
   }
}
