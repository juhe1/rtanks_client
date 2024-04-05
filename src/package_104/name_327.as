package package_104
{
   public class name_327
   {
       
      
      private var var_928:name_330;
      
      private var var_930:name_330;
      
      private var var_929:Boolean;
      
      private var var_927:int;
      
      public function name_327(param1:name_330 = null, param2:name_330 = null, param3:Boolean = false, param4:int = 0)
      {
         super();
         this.var_928 = param1;
         this.var_930 = param2;
         this.var_929 = param3;
         this.var_927 = param4;
      }
      
      public function get battlePassItem() : name_330
      {
         return this.var_928;
      }
      
      public function set battlePassItem(param1:name_330) : void
      {
         this.var_928 = param1;
      }
      
      public function get freeItem() : name_330
      {
         return this.var_930;
      }
      
      public function set freeItem(param1:name_330) : void
      {
         this.var_930 = param1;
      }
      
      public function get needShowBattlePassItem() : Boolean
      {
         return this.var_929;
      }
      
      public function set needShowBattlePassItem(param1:Boolean) : void
      {
         this.var_929 = param1;
      }
      
      public function get stars() : int
      {
         return this.var_927;
      }
      
      public function set stars(param1:int) : void
      {
         this.var_927 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "Tier [";
         _loc1_ += "battlePassItem = " + this.battlePassItem + " ";
         _loc1_ += "freeItem = " + this.freeItem + " ";
         _loc1_ += "needShowBattlePassItem = " + this.needShowBattlePassItem + " ";
         _loc1_ += "stars = " + this.stars + " ";
         return _loc1_ + "]";
      }
   }
}
