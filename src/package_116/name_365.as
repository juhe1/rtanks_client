package package_116
{
   public class name_365
   {
       
      
      private var var_948:Vector.<name_340>;
      
      public function name_365(param1:Vector.<name_340> = null)
      {
         super();
         this.var_948 = param1;
      }
      
      public function get equipmentConstraintsModeInfos() : Vector.<name_340>
      {
         return this.var_948;
      }
      
      public function set equipmentConstraintsModeInfos(param1:Vector.<name_340>) : void
      {
         this.var_948 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "EquipmentConstraintsCC [";
         _loc1_ += "equipmentConstraintsModeInfos = " + this.equipmentConstraintsModeInfos + " ";
         return _loc1_ + "]";
      }
   }
}
