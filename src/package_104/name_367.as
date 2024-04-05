package package_104
{
   public class name_367
   {
       
      
      private var _tiers:Vector.<name_327>;
      
      public function name_367(param1:Vector.<name_327> = null)
      {
         super();
         this._tiers = param1;
      }
      
      public function get tiers() : Vector.<name_327>
      {
         return this._tiers;
      }
      
      public function set tiers(param1:Vector.<name_327>) : void
      {
         this._tiers = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ChallengeRewardsCC [";
         _loc1_ += "tiers = " + this.tiers + " ";
         return _loc1_ + "]";
      }
   }
}
