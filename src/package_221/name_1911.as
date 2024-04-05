package package_221
{
   public class name_1911
   {
       
      
      private var var_245:int;
      
      public function name_1911(param1:int = 0)
      {
         super();
         this.var_245 = param1;
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
         var _loc1_:String = "ClanCreateCC [";
         _loc1_ += "minRankForCreateClan = " + this.minRankForCreateClan + " ";
         return _loc1_ + "]";
      }
   }
}
