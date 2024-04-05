package package_228
{
   public class name_2062
   {
       
      
      private var var_266:Vector.<ClanAction>;
      
      public function name_2062(param1:Vector.<ClanAction> = null)
      {
         super();
         this.var_266 = param1;
      }
      
      public function get actions() : Vector.<ClanAction>
      {
         return this.var_266;
      }
      
      public function set actions(param1:Vector.<ClanAction>) : void
      {
         this.var_266 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanPermissionsCC [";
         _loc1_ += "actions = " + this.actions + " ";
         return _loc1_ + "]";
      }
   }
}
