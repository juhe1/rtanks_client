package alternativa.tanks.gui
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import alternativa.tanks.model.name_324;
   import controls.buttons.name_2255;
   import controls.TankWindowInner;
   import controls.name_1922;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import package_1.Main;
   import package_105.name_321;
   import package_109.name_325;
   import package_13.Long;
   import package_280.name_2618;
   import package_31.name_115;
   import package_316.PartsList;
   import package_326.class_55;
   import package_433.ItemViewCategoryEnum;
   import package_434.CategoryButtonsList;
   import package_434.name_2623;
   import package_435.TankPreview;
   import package_54.name_102;
   import package_7.name_32;
   import package_95.IStorageService;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class GarageWindow extends Sprite
   {
      
      private static const const_1940:ItemViewCategoryEnum = ItemViewCategoryEnum.WEAPON;
      
      private static const const_1941:String = "LAST_SHOWED_GARAGE_CATEGORY";
      
      public static var storageService:IStorageService = IStorageService(OSGi.getInstance().getService(IStorageService));
       
      
      private var modelRegister:name_32;
      
      private var localeService:name_102;
      
      private var name_1029:Point;
      
      private var name_322:GarageModel;
      
      private var menu:CategoryButtonsList;
      
      private const const_1692:int = 11;
      
      private const const_1677:Point = new Point(104,33);
      
      private var var_2349:name_1922;
      
      private var var_2351:TankWindowInner;
      
      private var var_2348:PartsList;
      
      private var var_2355:name_1922;
      
      private var var_2354:TankWindowInner;
      
      public var itemInfoPanel:ItemInfoPanel;
      
      public var var_2352:Boolean;
      
      public var name_1548:Boolean;
      
      public var name_1539:String;
      
      private var var_2350:Array;
      
      private var var_2353:Array;
      
      public var name_1533:TankPreview;
      
      public const const_1942:int = 412;
      
      public var name_1552:ItemViewCategoryEnum;
      
      public var name_402:Vector.<name_325>;
      
      public var name_483:Vector.<name_325>;
      
      private var i:int = 0;
      
      private var j:int = 0;
      
      public function GarageWindow(param1:Long, param2:GarageModel)
      {
         this.name_1552 = ItemViewCategoryEnum.WEAPON;
         this.name_402 = new Vector.<name_325>();
         this.name_483 = new Vector.<name_325>();
         super();
         this.name_322 = param2;
         this.modelRegister = Main.osgi.getService(name_32) as name_32;
         this.localeService = Main.osgi.getService(name_102) as name_102;
         this.var_2350 = new Array();
         this.var_2353 = new Array();
         this.name_1029 = new Point(880,737);
         this.itemInfoPanel = new ItemInfoPanel();
         addChild(this.itemInfoPanel);
         this.var_2349 = new name_1922();
         addChild(this.var_2349);
         this.var_2351 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.var_2351.showBlink = true;
         addChild(this.var_2351);
         this.var_2348 = new PartsList();
         addChild(this.var_2348);
         this.var_2348.addEventListener(name_2618.name_2625,this.method_2367);
         this.var_2348.addEventListener(name_2618.ITEM_DOUBLE_CLICK,this.method_2366);
         this.itemInfoPanel.name_2619.addEventListener(MouseEvent.CLICK,this.onButtonBuyClick);
         this.itemInfoPanel.name_2621.addEventListener(MouseEvent.CLICK,this.method_900);
         this.itemInfoPanel.name_2620.addEventListener(MouseEvent.CLICK,this.onModButtonClick);
         this.menu = new CategoryButtonsList();
         addChild(this.menu);
         this.menu.addEventListener(name_2623.name_2632,this.method_2369);
      }
      
      public static function name_1549(param1:name_321) : ItemViewCategoryEnum
      {
         var _loc2_:ItemViewCategoryEnum = null;
         if(param1 == name_321.WEAPON)
         {
            _loc2_ = ItemViewCategoryEnum.WEAPON;
         }
         else if(param1 == name_321.ARMOR)
         {
            _loc2_ = ItemViewCategoryEnum.ARMOR;
         }
         else if(param1 == name_321.COLOR)
         {
            _loc2_ = ItemViewCategoryEnum.PAINT;
         }
         else if(param1 == name_321.INVENTORY)
         {
            _loc2_ = ItemViewCategoryEnum.INVENTORY;
         }
         else if(param1 == name_321.KIT)
         {
            _loc2_ = ItemViewCategoryEnum.KIT;
         }
         else if(param1 == name_321.PLUGIN)
         {
            _loc2_ = ItemViewCategoryEnum.SPECIAL;
         }
         else if(param1 == name_321.name_374)
         {
            _loc2_ = ItemViewCategoryEnum.RESISTANCE;
         }
         else
         {
            _loc2_ = ItemViewCategoryEnum.SPECIAL;
         }
         return _loc2_;
      }
      
      public function name_1561(param1:Long) : void
      {
         this.name_1533 = new TankPreview(Long.getLong(0,613847));
         addChild(this.name_1533);
      }
      
      private function method_2366(param1:name_2618) : void
      {
         var _loc2_:name_324 = GarageModel.name_377(this.name_1539);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id != null && Boolean(_loc2_.id.method_316(class_55)))
         {
            class_55(_loc2_.id.name_176(class_55)).handleDoubleClickOnItemPreview();
            return;
         }
         if(this.itemInfoPanel.name_2621.visible && this.itemInfoPanel.name_2621.method_1174() == name_2255.UP)
         {
            this.method_900(null);
         }
         else if(this.itemInfoPanel.name_2620.visible && this.itemInfoPanel.name_2620.method_1174() == name_2255.UP)
         {
            this.onModButtonClick(null);
         }
         else if(this.itemInfoPanel.name_2619.visible && this.itemInfoPanel.name_2619.method_1174() == name_2255.UP)
         {
            this.onButtonBuyClick(null);
         }
      }
      
      public function method_2368(param1:Vector.<name_325>, param2:ItemViewCategoryEnum) : Array
      {
         var _loc3_:name_324 = null;
         var _loc4_:name_325 = null;
         var _loc5_:Array = new Array();
         var _loc6_:int = int(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = param1[_loc7_];
            _loc3_ = GarageModel.name_377(_loc4_.itemId);
            if(_loc3_ == null || _loc3_.name_373 == name_321.name_405)
            {
               _loc7_++;
            }
            else
            {
               if(name_1549(_loc3_.name_373) == param2)
               {
                  _loc5_.push(_loc4_);
               }
               _loc7_++;
            }
         }
         return _loc5_;
      }
      
      private function method_2369(param1:name_2623) : void
      {
         if(this.name_1552 != param1.getCategory())
         {
            this.method_2365(param1.getCategory());
         }
      }
      
      public function method_2365(param1:ItemViewCategoryEnum) : void
      {
         var _loc6_:String = null;
         var _loc2_:ItemViewCategoryEnum = null;
         var _loc3_:Object = null;
         if(!this.menu.name_2633(param1))
         {
            _loc2_ = this.menu.name_2635();
            this.method_2365(_loc2_);
            return;
         }
         this.name_1552 = param1;
         this.menu.name_1879(param1);
         var _loc4_:Array = this.method_2368(this.name_402,param1);
         var _loc5_:Array = this.method_2368(this.name_483,param1);
         this.var_2348.name_2634();
         this.name_322.method_106(null,_loc5_);
         this.name_322.name_394(null,_loc4_);
         this.var_2348.sort();
         storageService.getStorage().data["LAST_SHOWED_GARAGE_CATEGORY"] = param1.value;
         if(this.var_2348.name_2630() > 0)
         {
            _loc3_ = this.var_2348.getItemAt(0);
            if(_loc3_ != null)
            {
               this.var_2348.name_2626(_loc3_.dat.id);
            }
         }
         if(param1 == ItemViewCategoryEnum.WEAPON)
         {
            this.mountItem(this.name_322.name_470);
            this.name_1534(this.name_322.name_470);
         }
         else if(param1 == ItemViewCategoryEnum.ARMOR)
         {
            this.mountItem(this.name_322.name_458);
            this.name_1534(this.name_322.name_458);
         }
         else if(param1 == ItemViewCategoryEnum.PAINT)
         {
            this.mountItem(this.name_322.name_484);
            this.name_1534(this.name_322.name_484);
         }
         else if(param1 == ItemViewCategoryEnum.RESISTANCE)
         {
            for each(_loc6_ in this.name_322.var_822)
            {
               this.mountItem(_loc6_);
               this.name_1534(_loc6_);
            }
         }
         this.resize(this.name_1029.x,this.name_1029.y);
      }
      
      public function completeLoading() : void
      {
         this.method_2365(this.method_2370());
      }
      
      private function method_2370() : ItemViewCategoryEnum
      {
         var _loc1_:int = 0;
         if(storageService.getStorage().data.hasOwnProperty("LAST_SHOWED_GARAGE_CATEGORY"))
         {
            _loc1_ = int(storageService.getStorage().data["LAST_SHOWED_GARAGE_CATEGORY"]);
            if(_loc1_ < 0 || _loc1_ >= ItemViewCategoryEnum.method_393.length)
            {
               return const_1940;
            }
            return ItemViewCategoryEnum.method_393[_loc1_];
         }
         return const_1940;
      }
      
      public function isItemInDepot(param1:String) : Boolean
      {
         var _loc2_:name_325 = null;
         for each(_loc2_ in this.name_402)
         {
            if(_loc2_.itemId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function name_1567(param1:name_325) : void
      {
         var _loc2_:int = this.name_402.indexOf(param1);
         if(_loc2_ == -1)
         {
            this.name_402.push(param1);
         }
         var _loc3_:int = this.name_483.indexOf(param1);
         if(_loc3_ != -1)
         {
            this.name_483.splice(_loc3_,1);
         }
         if(this.var_2348.method_2313(param1.itemId) != -1)
         {
            this.var_2348.name_2622(param1.itemId);
         }
      }
      
      public function name_1555(param1:String, param2:name_325) : void
      {
         var _loc3_:int = this.name_402.indexOf(param2);
         if(_loc3_ != -1)
         {
            this.name_402[_loc3_] = param2;
         }
      }
      
      public function name_1566(param1:String, param2:name_325) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < this.name_483.length)
         {
            if(this.name_483[_loc3_].itemId == param1)
            {
               this.name_483.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
         var _loc4_:int = this.name_402.indexOf(param2);
         if(_loc4_ != -1)
         {
            this.name_402[_loc4_] = param2;
         }
         else
         {
            this.name_402.push(param2);
         }
      }
      
      public function hide() : void
      {
         if(this.name_1533 != null)
         {
            removeDisplayObject(this.name_1533);
            this.name_1533.hide();
            this.name_1533 = null;
         }
         this.itemInfoPanel.hide();
         this.itemInfoPanel = null;
         this.modelRegister = null;
         this.var_2349 = null;
         this.var_2351 = null;
         this.var_2348.destroy();
         this.var_2348 = null;
         this.var_2355 = null;
         this.var_2354 = null;
         this.name_1539 = null;
         this.var_2350 = null;
         this.var_2353 = null;
         this.menu.destroy();
         this.menu = null;
         this.name_402 = null;
         this.name_483 = null;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         this.name_1029 = new Point(param1,param2);
         this.var_2349.width = param1;
         this.var_2349.height = 205;
         this.var_2349.x = 0;
         this.var_2349.y = param2 - this.var_2349.height;
         this.var_2351.width = param1 - 11 * 2;
         this.var_2351.height = 169 - 11 * 2;
         this.var_2351.x = 11;
         this.var_2351.y = this.var_2349.y + 11;
         this.var_2348.width = this.var_2349.width - 11 * 2 - 8;
         this.var_2348.height = 169 - 11 * 2 + 1;
         this.var_2348.x = 11 + 4;
         this.var_2348.y = this.var_2349.y + 11 + 4;
         this.menu.width = param1 - 11 * 2 - 8;
         this.menu.x = 11;
         this.menu.y = this.var_2348.y + this.var_2348.height;
         if(this.name_1533 != null)
         {
            this.name_1533.resize(param1 - 412,param2 - this.var_2349.height);
         }
         this.itemInfoPanel.resize(412,param2 - this.var_2349.height);
         this.itemInfoPanel.x = param1 - 412;
      }
      
      public function name_1541() : void
      {
         this.var_2348.name_2628(0);
      }
      
      public function name_1534(param1:String) : void
      {
         this.var_2348.name_1879(param1);
      }
      
      public function method_2385() : void
      {
         this.var_2348.name_2631();
      }
      
      public function name_1540(param1:String) : void
      {
      }
      
      public function name_1543() : void
      {
      }
      
      public function name_1536(param1:String, param2:name_324, param3:name_325, param4:int = 0) : void
      {
         var _loc6_:name_115 = null;
         var _loc7_:int = 0;
         if(this.name_1552 != name_1549(param2.name_373))
         {
            return;
         }
         this.var_2350.push(param1);
         var _loc5_:ImageResource = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param2.previewId));
         if(param3 != null)
         {
            if(param2.name_373.value == 5)
            {
               this.var_2348.addItem(param1,param2.name,4,param2.itemIndex,param2.price,param4,param2.rankId,false,true,param3.count,_loc5_,true,param2.name_1360);
            }
            else
            {
               this.var_2348.addItem(param1,param2.name,param2.name_373.value,param2.itemIndex,param2.price,param4,param2.rankId,false,true,param3.count,_loc5_,true,param2.name_1360);
            }
         }
         else
         {
            _loc6_ = Main.osgi.getService(name_115) as name_115;
            _loc7_ = int(_loc6_.rank);
            if(param2.name_373.value == 5)
            {
               this.var_2348.addItem(param1,param2.name,4,param2.itemIndex,param2.price,param4,_loc7_ >= param2.rankId ? int(0) : int(param2.rankId),false,false,0,_loc5_,false,0);
            }
            else
            {
               this.var_2348.addItem(param1,param2.name,param2.name_373.value,param2.itemIndex,param2.price,param4,_loc7_ >= param2.rankId ? int(0) : int(param2.rankId),false,false,0,_loc5_,false,0);
            }
         }
      }
      
      public function name_1554(param1:String, param2:name_324, param3:name_325) : void
      {
      }
      
      public function method_1078(param1:String) : void
      {
         this.var_2348.name_2622(param1);
         var _loc2_:int = this.var_2350.indexOf(param1);
         this.var_2350.splice(_loc2_,1);
      }
      
      public function name_435(param1:String) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.name_483.length)
         {
            if(this.name_483[_loc2_].itemId == param1)
            {
               this.name_483.splice(_loc2_,1);
               this.var_2348.name_2622(param1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function method_2387(param1:String) : void
      {
         this.var_2348.lock(param1);
      }
      
      public function method_2384(param1:String) : void
      {
         this.var_2348.unlock(param1);
      }
      
      public function method_2380() : void
      {
         removeChild(this.var_2348);
         this.var_2348 = new PartsList();
         addChild(this.var_2348);
         this.var_2348.addEventListener(name_2618.name_2625,this.method_2367);
         this.var_2348.addEventListener(name_2618.ITEM_DOUBLE_CLICK,this.method_2366);
         this.var_2350 = new Array();
      }
      
      public function method_2388(param1:String) : void
      {
      }
      
      public function method_2378(param1:String) : void
      {
      }
      
      public function name_1560(param1:String) : void
      {
         this.var_2348.name_1370(param1);
      }
      
      public function mountItem(param1:String) : void
      {
         this.var_2348.mount(param1);
      }
      
      public function method_2375(param1:String, param2:name_324, param3:Boolean = true) : void
      {
         if(param3)
         {
            this.itemInfoPanel.name_2637.push(param1);
         }
         this.itemInfoPanel.name_2627[param1] = param2;
      }
      
      public function name_1551(param1:String, param2:name_324, param3:Boolean, param4:name_325 = null, param5:Array = null) : void
      {
         this.name_1548 = param3;
         this.var_2352 = param2.name_373 == name_321.INVENTORY;
         if(param2.name_1553 && param4 != null && !param3)
         {
            this.var_2348.name_2624(param4.itemId,param4.count);
         }
         this.itemInfoPanel.name_1551(param1,param2,param3,param4,param5);
         this.itemInfoPanel.resize(412,this.name_1029.y - this.var_2349.height);
      }
      
      public function method_2371(param1:Long) : void
      {
         var _loc2_:int = this.var_2350.indexOf(param1);
         if(this.var_2350[int(_loc2_ + 1)] != null)
         {
            this.name_1539 = this.var_2350[int(_loc2_ + 1)];
            this.var_2348.name_1879(this.name_1539);
         }
         else if(this.var_2350[int(_loc2_ - 1)] != null)
         {
            this.name_1539 = this.var_2350[int(_loc2_ - 1)];
            this.var_2348.name_1879(this.name_1539);
         }
         dispatchEvent(new name_1532(name_1532.name_1557,this.name_1539));
      }
      
      public function method_2374(param1:Long, param2:name_325, param3:name_324) : void
      {
         if(param3.name_1553)
         {
            this.var_2348.name_2624(param1,param2.count);
         }
      }
      
      public function name_1563(param1:String) : void
      {
         this.var_2348.name_2626(param1);
      }
      
      public function name_1562(param1:String) : void
      {
      }
      
      public function method_2373() : void
      {
         this.itemInfoPanel.name_2619.enable = false;
      }
      
      public function method_2376() : void
      {
         this.itemInfoPanel.name_2620.enable = false;
      }
      
      public function name_1547() : void
      {
         Main.method_8("GARAGE WINDOW","lockMountButton storeItemSelected: " + this.name_1548);
         Main.method_8("GARAGE WINDOW","lockMountButton inventorySelected: " + this.var_2352);
         if(!this.name_1548 && !this.var_2352)
         {
            this.itemInfoPanel.name_2621.enabled = false;
         }
      }
      
      public function method_2382() : void
      {
         this.itemInfoPanel.name_2619.enable = true;
      }
      
      public function method_2383() : void
      {
         this.itemInfoPanel.name_2620.enable = true;
      }
      
      public function name_1569() : void
      {
         Main.method_8("GARAGE WINDOW","unlockMountButton storeItemSelected: " + this.name_1548);
         Main.method_8("GARAGE WINDOW","unlockMountButton inventorySelected: " + this.var_2352);
         if(!this.name_1548 && !this.var_2352)
         {
            this.itemInfoPanel.method_904();
         }
      }
      
      public function method_2377(param1:BitmapData) : void
      {
      }
      
      public function method_2386(param1:Boolean, param2:int = 0, param3:int = 0) : void
      {
         Main.method_8("GARAGE WINDOW","setBuyButtonInfo reset: %1, crystal: %2, rank: %3",param1,param2,param3);
         if(param1)
         {
            this.itemInfoPanel.name_2619.icon = null;
         }
         else
         {
            this.itemInfoPanel.name_2619.name_1375(param2,param3);
         }
      }
      
      private function method_2367(param1:Event) : void
      {
         this.name_1539 = this.var_2348.name_2636 as String;
         dispatchEvent(new name_1532(name_1532.name_1557,this.name_1539));
      }
      
      private function method_2379(param1:Event) : void
      {
      }
      
      public function onButtonBuyClick(param1:MouseEvent) : void
      {
         dispatchEvent(new name_1532(name_1532.name_1572,this.name_1539));
      }
      
      private function method_2381(param1:MouseEvent) : void
      {
         dispatchEvent(new name_1532(name_1532.name_1564,this.name_1539));
      }
      
      private function method_900(param1:MouseEvent) : void
      {
         dispatchEvent(new name_1532(name_1532.name_1558,this.name_1539));
      }
      
      public function onModButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new name_1532(name_1532.name_1574,this.name_1539));
      }
      
      private function method_2372(param1:MouseEvent) : void
      {
         dispatchEvent(new name_1532(name_1532.name_2629,this.name_1539));
      }
   }
}
