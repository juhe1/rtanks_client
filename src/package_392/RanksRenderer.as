package package_392
{
   import controls.dropdownlist.ComboBoxRenderer;
   import flash.display.Sprite;
   
   public class RanksRenderer extends ComboBoxRenderer
   {
       
      
      public function RanksRenderer()
      {
         super();
      }
      
      override protected function method_2586(param1:Object) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         var _loc3_:SmallRankIcon = new SmallRankIcon();
         _loc3_.init(false,param1.rank);
         _loc2_.addChild(_loc3_);
         return _loc2_;
      }
   }
}
