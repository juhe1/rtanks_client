package package_293
{
   import assets.icons.BattleInfoIcons;
   
   public class name_2335 extends class_198
   {
      
      private static const const_2306:int = 17;
      
      private static const const_2291:int = 10;
       
      
      private var icon:BattleInfoIcons;
      
      public function name_2335()
      {
         super();
         this.icon = new BattleInfoIcons();
         this.icon.type = BattleInfoIcons.name_2338;
         addChild(this.icon);
         this.icon.y = 10;
      }
      
      override protected function method_2825() : int
      {
         var _loc2_:int = var_3035.width > var_3034.width ? int(var_3035.width) : int(var_3034.width);
         var_3035.x = 5 + 5 + (_loc2_ - var_3035.width >> 1);
         this.icon.x = var_3035.x + _loc2_ + 5;
         var_3034.x = this.icon.x + 17 + 5 + (_loc2_ - var_3034.width >> 1);
         return var_3034.x + _loc2_ + 5 + 5;
      }
   }
}
