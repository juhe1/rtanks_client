package package_229
{
   public class name_1904
   {
       
      
      private var var_238:Boolean;
      
      private var var_245:int;
      
      public function name_1904(param1:Boolean = false, param2:int = 0)
      {
         super();
         this.var_238 = param1;
         this.var_245 = param2;
      }
      
      public function get clanButtonVisible() : Boolean
      {
         return this.var_238;
      }
      
      public function set clanButtonVisible(param1:Boolean) : void
      {
         this.var_238 = param1;
      }
      
      public function get minRankForCreateClan() : int
      {
         return this.var_245;
      }
      
      public function set minRankForCreateClan(param1:int) : void
      {
         this.var_245 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanLoadingPanelCC [";
         _loc1_ += "clanButtonVisible = " + this.clanButtonVisible + " ";
         _loc1_ += "minRankForCreateClan = " + this.minRankForCreateClan + " ";
         return _loc1_ + "]";
      }
   }
}
