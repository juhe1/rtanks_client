package package_96
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_324;
   import alternativa.tanks.model.name_381;
   import controls.timer.CountDownTimer;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import package_207.name_561;
   import package_279.class_27;
   import package_314.name_1356;
   import package_314.name_1361;
   import package_315.name_1357;
   import package_316.name_1362;
   import package_53.name_94;
   import package_54.name_102;
   import package_75.name_274;
   import package_89.name_1358;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class name_311 implements AutoClosable
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      public static var battleInfoService:name_274;
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().name_6(name_94) as name_94;
      
      public static var delayMountCategoryService:name_1357 = OSGi.getInstance().name_6(name_1357) as name_1357;
      
      public static var var_641:name_1358 = OSGi.getInstance().name_6(name_1358) as name_1358;
      
      public static var userPropertiesService:name_561 = OSGi.getInstance().name_6(name_561) as name_561;
      
      public static var var_644:class_27 = OSGi.getInstance().name_6(class_27) as class_27;
       
      
      private const const_423:Number = 120;
      
      private const const_422:Number = 11;
      
      private const SPACE:Number = 15;
      
      private var var_643:name_1362;
      
      private var var_642:name_1361;
      
      private var item:name_70;
      
      private var garageWindowDispatcher:IEventDispatcher;
      
      public function name_311()
      {
         this.var_643 = new name_1362();
         this.var_642 = new name_1361();
         super();
         this.var_643.width = 120;
         this.var_642.width = 120;
         this.var_643.x = 11;
         this.var_642.x = this.var_643.x + 120 + 15 + 120 + 15;
         this.var_643.name_1342(localeService.getText(name_390.name_1366));
         this.var_643.addEventListener(MouseEvent.CLICK,this.onButtonBuyClick);
         this.var_642.addEventListener(MouseEvent.CLICK,this.method_900);
      }
      
      private function method_903() : void
      {
         this.var_643.visible = Boolean(name_381(OSGi.getInstance().name_6(name_381)).canBuy(this.item.name)) || this.method_905(this.item);
         this.var_642.visible = (!var_641.getView().isFull() || Boolean(var_641.name_1365(this.item))) && !name_381(OSGi.getInstance().name_6(name_381)).canBuy(this.item.name);
      }
      
      private function method_905(param1:name_70) : Boolean
      {
         var _loc2_:name_324 = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(param1);
         if(_loc2_ != null)
         {
            return _loc2_.name_1360 < 3 && _loc2_.modifications.length > 1;
         }
         return false;
      }
      
      private function method_906(param1:name_70) : Boolean
      {
         var _loc2_:name_324 = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(param1);
         if(_loc2_ != null)
         {
            return _loc2_.modifications.length > 1;
         }
         return false;
      }
      
      public function onDoubleClick() : *
      {
         if(name_381(OSGi.getInstance().name_6(name_381)).getView().isItemInDepot(this.item.name))
         {
            if(!var_641.name_1365(this.item))
            {
               this.method_899();
            }
         }
         else
         {
            this.method_898();
         }
      }
      
      private function method_901(param1:name_70) : void
      {
         var _loc2_:name_324 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc7_:* = name_381(OSGi.getInstance().name_6(name_381)).canBuy(param1.name);
         if(this.var_643.visible)
         {
            _loc2_ = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(this.item);
            if(_loc2_ != null)
            {
               _loc4_ = !_loc2_.name_1359 ? _loc2_.name_1372 : _loc2_.price;
               _loc3_ = !_loc2_.name_1359 ? _loc2_.name_1376 : _loc2_.rankId;
            }
            this.method_907(param1,_loc7_);
            this.var_643.name_1375(_loc4_,1,_loc3_,false);
            this.var_643.enabled = var_644.crystal >= _loc4_ && _loc3_ > 0 && userPropertiesService.rank >= _loc3_;
         }
      }
      
      private function method_907(param1:name_70, param2:Boolean) : void
      {
         var _loc3_:name_324 = null;
         var _loc4_:String = String(localeService.getText(name_390.name_1366));
         if(this.method_906(param1))
         {
            _loc3_ = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(this.item);
            this.var_643.name_1342(_loc4_ + " " + "M" + (!_loc3_.name_1359 ? _loc3_.name_1360 + 1 : _loc3_.name_1360));
         }
         else
         {
            this.var_643.name_1342(_loc4_);
         }
      }
      
      public function updateActionElements(param1:DisplayObjectContainer, param2:IEventDispatcher, param3:name_70) : void
      {
         this.item = param3;
         if(Boolean(name_381(OSGi.getInstance().name_6(name_381)).canBuy(param3.name)) || !var_641.name_1369(param3))
         {
            var_641.name_1371();
         }
         else
         {
            this.method_844();
         }
         this.garageWindowDispatcher = param2;
         param1.addChild(this.var_643);
         param1.addChild(this.var_642);
         this.method_902();
      }
      
      private function method_898() : void
      {
         var _loc1_:name_324 = GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(this.item);
         if(_loc1_ == null)
         {
            return;
         }
         if(!_loc1_.name_1359)
         {
            GarageModel(OSGi.getInstance().name_6(name_381)).garageWindow.onModButtonClick(null);
         }
         else
         {
            GarageModel(OSGi.getInstance().name_6(name_381)).garageWindow.onButtonBuyClick(null);
         }
      }
      
      private function onButtonBuyClick(param1:MouseEvent) : void
      {
         this.method_898();
      }
      
      private function method_899() : void
      {
         if(this.method_896())
         {
            var_641.name_1370(this.item);
         }
         else
         {
            var_641.name_1374(this.item);
         }
         this.method_897();
      }
      
      private function method_900(param1:MouseEvent) : void
      {
         this.method_899();
      }
      
      private function method_896() : Boolean
      {
         return var_641.name_1365(this.item);
      }
      
      private function method_902() : void
      {
         this.method_903();
         this.method_897();
         this.method_904();
      }
      
      private function method_904() : void
      {
         this.method_908();
      }
      
      private function method_897() : void
      {
         this.method_901(this.item);
         this.var_642.label = this.method_896() ? String(localeService.getText(name_390.name_1373)) : String(localeService.getText(name_390.name_1367));
      }
      
      private function method_908() : void
      {
         var _loc1_:CountDownTimer = null;
         if(lobbyLayoutService.inBattle())
         {
            if(battleInfoService.reArmorEnabled)
            {
               _loc1_ = delayMountCategoryService.name_1377(GarageModel(OSGi.getInstance().name_6(name_381)).getObjectItemParams(this.item).baseItemId);
               if(_loc1_.name_1368() > 0)
               {
                  this.var_642.startTimer(_loc1_);
                  this.var_642.addEventListener(name_1356.name_1364,this.method_895);
                  var_641.getView().disable();
               }
               else
               {
                  this.method_844();
               }
            }
            else
            {
               this.var_642.name_1363();
               this.var_642.enabled = false;
               var_641.getView().disable();
            }
         }
         else
         {
            this.method_844();
         }
      }
      
      private function method_844() : void
      {
         this.var_642.name_1363();
         this.var_642.enabled = true;
         var_641.getView().enable();
      }
      
      private function method_895(param1:name_1356) : void
      {
         this.var_642.enabled = true;
         this.var_642.removeEventListener(name_1356.name_1364,this.method_895);
         var_641.getView().enable();
      }
      
      public function close() : void
      {
         this.var_643.removeEventListener(MouseEvent.CLICK,this.onButtonBuyClick);
         this.var_642.removeEventListener(MouseEvent.CLICK,this.method_900);
         this.var_642.removeEventListener(name_1356.name_1364,this.method_895);
         this.var_642.name_1363();
      }
   }
}
