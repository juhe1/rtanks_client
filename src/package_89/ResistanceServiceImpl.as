package package_89
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.item.resistance.name_1525;
   import alternativa.tanks.model.name_324;
   import alternativa.tanks.model.name_381;
   import controls.timer.CountDownTimer;
   import package_103.name_323;
   import package_315.name_1357;
   import package_41.name_320;
   import package_75.name_274;
   import package_96.MountedResistancesPanel;
   import platform.client.fp10.core.type.name_70;
   
   public class ResistanceServiceImpl implements name_1358
   {
      
      public static var battleInfoService:name_274;
      
      public static var delayMountCategoryService:name_1357;
       
      
      private var view:MountedResistancesPanel = null;
      
      private var var_805:name_1525 = null;
      
      public function ResistanceServiceImpl()
      {
         super();
      }
      
      public function getView() : MountedResistancesPanel
      {
         return this.view;
      }
      
      public function method_1069(param1:MountedResistancesPanel) : void
      {
         this.view = param1;
      }
      
      public function method_117(param1:name_70) : void
      {
         var _loc2_:name_70 = null;
         this.var_805 = name_1525(param1.name_176(name_1525));
         var _loc3_:* = this.var_805.name_1526();
         var _loc4_:uint = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ = _loc3_[_loc4_];
            if(_loc2_ != null)
            {
               if(this.method_1070(_loc2_))
               {
                  this.getView().name_1527(_loc2_);
                  return;
               }
               this.getView().name_1529(_loc4_,_loc2_);
            }
            _loc4_++;
         }
      }
      
      public function method_1068() : void
      {
         this.var_805 = null;
      }
      
      public function method_1066() : void
      {
         this.view = null;
      }
      
      public function method_1067(param1:name_70) : void
      {
      }
      
      public function mount(param1:int, param2:name_70) : void
      {
         var _loc3_:name_324 = null;
         if(this.name_1369(param2))
         {
            if(this.method_1070(param2))
            {
               this.method_1071();
               this.getView().name_1527(param2);
            }
            else
            {
               this.getView().name_1528(param2);
               this.getView().name_1529(param1,param2);
            }
            this.var_805.mount(param1,param2);
            _loc3_ = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(param2);
            GarageModel(OSGi.getInstance().name_6(name_381)).mountItem(null,null,_loc3_.baseItemId,null);
            name_381(OSGi.getInstance().name_6(name_381)).getView().itemInfoPanel.onMountItem();
         }
      }
      
      public function name_1374(param1:name_70) : void
      {
         var _loc2_:int = 0;
         if(!this.name_1365(param1))
         {
            _loc2_ = this.getView().name_1530();
            if(_loc2_ > -1)
            {
               this.mount(_loc2_,param1);
            }
         }
      }
      
      public function name_1370(param1:name_70) : void
      {
         this.getView().name_1528(param1);
         this.var_805.name_1370(param1);
         var _loc2_:name_324 = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(param1);
         GarageModel(OSGi.getInstance().name_6(name_381)).mountItem(null,_loc2_.baseItemId,null,null);
         name_381(OSGi.getInstance().name_6(name_381)).getView().itemInfoPanel.onMountItem();
      }
      
      public function name_1365(param1:name_70) : Boolean
      {
         if(this.var_805 != null)
         {
            return this.var_805.name_1526().indexOf(param1) >= 0;
         }
         return false;
      }
      
      private function method_1071() : void
      {
         var _loc1_:name_70 = null;
         var _loc2_:Vector.<name_70> = new Vector.<name_70>();
         for each(_loc1_ in this.var_805.name_1526())
         {
            if(_loc1_ != null)
            {
               _loc2_.push(_loc1_);
            }
         }
         for each(_loc1_ in _loc2_)
         {
            this.name_1370(_loc1_);
         }
      }
      
      private function method_1070(param1:name_70) : Boolean
      {
         var _loc2_:name_323 = null;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:name_324 = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(param1);
         for each(_loc2_ in _loc3_.itemProperties)
         {
            if(_loc2_.property == name_320.name_487)
            {
               return true;
            }
         }
         return false;
      }
      
      public function name_1371() : void
      {
         this.getView().name_1531();
      }
      
      public function name_1369(param1:name_70) : Boolean
      {
         if(battleInfoService != null && !battleInfoService.isInBattle())
         {
            return true;
         }
         if(battleInfoService != null && !battleInfoService.reArmorEnabled)
         {
            return false;
         }
         var _loc2_:CountDownTimer = delayMountCategoryService.name_1377(param1.name);
         if(_loc2_ != null && _loc2_.name_1368() > 0)
         {
            return false;
         }
         return true;
      }
   }
}
