package package_315
{
   import alternativa.osgi.service.logging.name_26;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.model.GarageModel;
   import controls.timer.CountDownTimer;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_337.name_1606;
   import package_433.ItemViewCategoryEnum;
   
   public class DelayMountCategoryServiceImpl implements name_1357
   {
      
      public static var logService:name_26;
       
      
      private var var_891:Dictionary;
      
      public function DelayMountCategoryServiceImpl()
      {
         this.var_891 = new Dictionary();
         super();
      }
      
      public function name_1377(param1:String) : CountDownTimer
      {
         if(GarageModel.name_377(param1) == null)
         {
            return this.var_891[ItemViewCategoryEnum.RESISTANCE];
         }
         var _loc2_:ItemViewCategoryEnum = GarageWindow.name_1549(GarageModel.name_377(param1).name_373);
         return this.var_891[_loc2_];
      }
      
      public function method_2287(param1:name_1606) : void
      {
         this.method_2413(ItemViewCategoryEnum.ARMOR,param1.delayMountArmorInSec);
         this.method_2413(ItemViewCategoryEnum.WEAPON,param1.delayMountWeaponInSec);
         this.method_2413(ItemViewCategoryEnum.RESISTANCE,param1.delayMountResistanceInSec);
      }
      
      private function method_2413(param1:ItemViewCategoryEnum, param2:int) : void
      {
         var _loc3_:CountDownTimer = new CountDownTimer();
         _loc3_.start(param2 * 1000 + getTimer());
         this.var_891[param1] = _loc3_;
      }
      
      public function method_2288() : void
      {
         var _loc1_:CountDownTimer = null;
         for each(_loc1_ in this.var_891)
         {
            if(_loc1_ != null)
            {
               _loc1_.destroy();
            }
         }
         delete this.var_891[ItemViewCategoryEnum.ARMOR];
         delete this.var_891[ItemViewCategoryEnum.RESISTANCE];
         delete this.var_891[ItemViewCategoryEnum.WEAPON];
         delete this.var_891[ItemViewCategoryEnum.DRONE];
      }
      
      public function method_2289() : void
      {
         var _loc1_:CountDownTimer = null;
         for each(_loc1_ in this.var_891)
         {
            if(_loc1_ != null)
            {
               _loc1_.stop();
            }
         }
      }
   }
}
