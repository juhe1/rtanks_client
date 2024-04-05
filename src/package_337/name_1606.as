package package_337
{
   public class name_1606
   {
       
      
      private var var_2393:int;
      
      private var var_2392:int;
      
      private var var_2391:int;
      
      public function name_1606(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.var_2393 = param1;
         this.var_2392 = param2;
         this.var_2391 = param3;
      }
      
      public function get delayMountArmorInSec() : int
      {
         return this.var_2393;
      }
      
      public function set delayMountArmorInSec(param1:int) : void
      {
         this.var_2393 = param1;
      }
      
      public function get delayMountResistanceInSec() : int
      {
         return this.var_2392;
      }
      
      public function set delayMountResistanceInSec(param1:int) : void
      {
         this.var_2392 = param1;
      }
      
      public function get delayMountWeaponInSec() : int
      {
         return this.var_2391;
      }
      
      public function set delayMountWeaponInSec(param1:int) : void
      {
         this.var_2391 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "DelayMountCategoryCC [";
         _loc1_ += "delayMountArmorInSec = " + this.delayMountArmorInSec + " ";
         _loc1_ += "delayMountResistanceInSec = " + this.delayMountResistanceInSec + " ";
         _loc1_ += "delayMountWeaponInSec = " + this.delayMountWeaponInSec + " ";
         return _loc1_ + "]";
      }
   }
}
