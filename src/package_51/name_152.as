package package_51
{
   public class name_152
   {
       
      
      private var var_408:Vector.<name_90>;
      
      public function name_152(param1:Vector.<name_90> = null)
      {
         super();
         this.var_408 = param1;
      }
      
      public function get resistances() : Vector.<name_90>
      {
         return this.var_408;
      }
      
      public function set resistances(param1:Vector.<name_90>) : void
      {
         this.var_408 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "TankResistancesCC [";
         _loc1_ += "resistances = " + this.resistances + " ";
         return _loc1_ + "]";
      }
   }
}
