package alternativa.tanks.model
{
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.model.class_11;
   import alternativa.model.class_52;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.gui.name_1532;
   import alternativa.tanks.gui.name_1545;
   import alternativa.tanks.loader.name_13;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import package_1.GarageModelActivator;
   import package_1.Main;
   import package_103.name_323;
   import package_103.name_328;
   import package_105.name_321;
   import package_109.class_49;
   import package_109.class_53;
   import package_109.name_325;
   import package_12.name_24;
   import package_13.Long;
   import package_139.name_1538;
   import package_254.name_1542;
   import package_254.name_1544;
   import package_254.name_1546;
   import package_254.name_791;
   import package_279.class_27;
   import package_279.name_979;
   import package_31.name_115;
   import package_34.class_3;
   import package_4.ClientObject;
   import package_41.ItemProperty;
   import package_53.name_94;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_32;
   import package_75.name_274;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.Network;
   import scpacker.networking.INetworker;
   
   public class GarageModel extends class_53 implements class_49, class_11, IResourceLoadingListener, name_381, class_50, class_3, name_979, class_51, class_52
   {
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
      
      public static var battleInfoService:name_274 = OSGi.getInstance().getService(name_274) as name_274;
      
      public static var var_812:Dictionary;
      
      public static var var_813:Dictionary;
      
      public static var mounted:Vector.<String>;
      
      public static var var_838:String;
      
      public static var var_836:Number;
      
      public static var var_817:String;
      
      private static const const_514:int = 2;
      
      private static const const_512:int = 3;
      
      private static const const_513:int = 700;
       
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var var_815:name_791;
      
      private var modelRegister:name_32;
      
      private var panelModel:name_115;
      
      private var var_832:name_1535;
      
      private var clientObject:ClientObject;
      
      private var var_83:DisplayObjectContainer;
      
      public var garageWindow:GarageWindow;
      
      private var var_818:Array;
      
      public var mountedItems:Array;
      
      public var var_822:Vector.<String>;
      
      public var name_470:String;
      
      public var var_828:name_325;
      
      public var var_830:name_324;
      
      public var name_458:String;
      
      public var var_829:name_325;
      
      public var var_831:name_324;
      
      public var name_484:String;
      
      public var var_835:name_325;
      
      public var var_839:name_324;
      
      private var var_837:String;
      
      private var var_823:String;
      
      private var var_827:Long;
      
      private var var_843:String;
      
      private var var_841:int = 2147483647;
      
      private var var_842:name_324;
      
      private var var_819:Boolean = false;
      
      private var var_833:Boolean = false;
      
      private var var_825:Boolean = false;
      
      private var var_834:Boolean = false;
      
      private var var_824:Boolean = false;
      
      private var var_840:name_1570;
      
      private var var_821:name_1542;
      
      private var var_820:name_1546;
      
      private var var_826:name_1544;
      
      private const const_79:String = "GarageModel";
      
      private var var_814:name_1545;
      
      private var var_816:String;
      
      private var var_108:Network;
      
      public var name_475:String;
      
      private var localeService:name_102;
      
      private var items:Dictionary;
      
      private var i:int = 2;
      
      public function GarageModel()
      {
         this.items = new Dictionary();
         super();
         _interfaces.push(IModel);
         _interfaces.push(name_381);
         _interfaces.push(class_49);
         _interfaces.push(class_11);
         _interfaces.push(class_50);
         _interfaces.push(class_51);
         this.var_83 = Main.systemLayer;
         var_812 = new Dictionary();
         mounted = new Vector.<String>();
         mounted.push("");
         mounted.push("");
         mounted.push("");
         this.dialogsLayer = (Main.osgi.getService(name_24) as name_24).dialogsLayer as DisplayObjectContainer;
      }
      
      public static function method_1095(param1:Array, param2:ItemProperty) : String
      {
         var _loc3_:name_323 = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = param1[_loc4_] as name_323;
            if(_loc3_.property == param2)
            {
               return _loc3_.value;
            }
            _loc4_++;
         }
         return null;
      }
      
      public static function name_383(param1:String) : name_325
      {
         return var_813[param1];
      }
      
      public static function name_420(param1:String, param2:String) : void
      {
         var _loc3_:name_325 = var_813[param1];
         _loc3_.itemId = param2;
         var_813[param2] = _loc3_;
      }
      
      public static function name_472(param1:String, param2:String) : void
      {
         var _loc3_:name_324 = var_812[param1];
         _loc3_.baseItemId = param2;
         var_812[param2] = _loc3_;
      }
      
      public static function name_377(param1:String) : name_324
      {
         return var_812[param1];
      }
      
      public static function method_1094(param1:name_321) : Boolean
      {
         return param1 == name_321.ARMOR || param1 == name_321.WEAPON || param1 == name_321.COLOR;
      }
      
      public function canBuy(param1:String) : Boolean
      {
         var _loc2_:name_325 = null;
         if(this.garageWindow != null)
         {
            for each(_loc2_ in this.garageWindow.name_483)
            {
               if(_loc2_.itemId == param1)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      public function getView() : GarageWindow
      {
         return this.garageWindow;
      }
      
      public function getObjectItemParams(param1:name_70) : name_324
      {
         var _loc2_:name_324 = null;
         for each(_loc2_ in var_812)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function initObject(param1:ClientObject, param2:String, param3:Number, param4:Long, param5:Network) : void
      {
         this.var_827 = param4;
         this.localeService = Main.osgi.getService(name_102) as name_102;
         GarageModel.var_838 = "RUR";
         GarageModel.var_836 = 5;
         this.var_108 = param5;
         this.objectLoaded(null);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
         if(param1 == null)
         {
            Main.method_8("GARAGE MODEL","objectLoaded");
            this.clientObject = param1;
            Main.stage.quality = StageQuality.HIGH;
            var_813 = new Dictionary();
            this.mountedItems = new Array();
            this.var_822 = new Vector.<String>();
            this.var_818 = new Array();
            this.modelRegister = Main.osgi.getService(name_32) as name_32;
            this.var_832 = (this.modelRegister.getModelsByInterface(name_1535) as Vector.<IModel>)[0] as name_1535;
            this.panelModel = Main.osgi.getService(name_115) as name_115;
            this.garageWindow = new GarageWindow(this.var_827,this);
            this.var_815 = Main.osgi.getService(name_791) as name_791;
            this.var_820 = new name_1546();
            this.var_821 = new name_1542();
            this.var_826 = new name_1544();
            this.var_815.name_981("GarageModel",3,this.var_821,true);
            this.var_815.name_981("GarageModel",2,this.var_820,true);
            this.var_815.name_981("GarageModel",700,this.var_826,false);
            Main.stage.addEventListener(Event.RESIZE,this.method_1081);
            this.method_1081();
            if(!battleInfoService.isInBattle())
            {
               this.method_1089();
            }
         }
         else
         {
            this.showWindow();
            this.panelModel.partSelected(1);
            name_13(Main.osgi.getService(name_13)).hide();
            if(Lobby.var_77)
            {
               Network(Main.osgi.getService(INetworker)).send("lobby;user_inited");
               Lobby.var_77 = false;
            }
            if(var_817 != null)
            {
               this.garageWindow.name_1540(var_817);
               var_817 = null;
            }
         }
      }
      
      private function method_1089() : void
      {
         this.garageWindow.name_1561(this.var_827);
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         Main.method_8("GARAGE MODEL","objectUnloaded");
         var _loc2_:class_27 = GarageModelActivator.osgi.getService(class_27) as class_27;
         if(_loc2_ != null)
         {
            _loc2_.removeListener(this);
         }
         this.hideWindow();
         Main.stage.removeEventListener(Event.RESIZE,this.method_1081);
         this.var_815.name_987("GarageModel",2);
         this.var_815.name_987("GarageModel",3);
         this.var_815.name_987("GarageModel",700);
         this.var_820 = null;
         this.var_821 = null;
         this.var_826 = null;
         var _loc3_:name_13 = Main.osgi.getService(name_13) as name_13;
         this.garageWindow = null;
         this.clientObject = null;
         Main.stage.quality = StageQuality.HIGH;
         if(!battleInfoService.isInBattle())
         {
            TextureResourcesRegistry.releaseTextureResources();
         }
      }
      
      public function name_371(param1:String, param2:name_324) : void
      {
         this.items[param1] = param2;
      }
      
      public function name_471(param1:String, param2:name_324) : void
      {
         var_812[param1] = param2;
      }
      
      public function name_394(param1:ClientObject, param2:Array) : void
      {
         var _loc3_:name_325 = null;
         var _loc4_:String = null;
         var _loc5_:name_324 = null;
         var _loc6_:int = 0;
         while(_loc6_ < param2.length)
         {
            _loc3_ = param2[_loc6_] as name_325;
            _loc4_ = _loc3_.itemId;
            _loc5_ = this.items[_loc4_];
            var_812[_loc4_] = _loc5_ == null ? var_812[_loc4_] : _loc5_;
            var_813[_loc4_] = _loc3_;
            this.garageWindow.name_1536(_loc4_,var_812[_loc4_],_loc3_,_loc3_.discount);
            if(this.var_818.indexOf(_loc4_) != -1)
            {
               this.garageWindow.mountItem(_loc4_);
               this.var_818.splice(this.var_818.indexOf(_loc4_),1);
               this.mountedItems.push(_loc4_);
               switch(_loc5_.name_373)
               {
                  case name_321.WEAPON:
                     this.name_470 = _loc4_;
                     this.var_828 = _loc3_;
                     this.var_830 = _loc5_;
                     break;
                  case name_321.ARMOR:
                     this.name_458 = _loc4_;
                     this.var_829 = _loc3_;
                     this.var_831 = _loc5_;
               }
            }
            _loc6_++;
         }
         this.garageWindow.addEventListener(name_1532.name_1557,this.method_1086);
         this.garageWindow.addEventListener(name_1532.name_1558,this.method_1088);
         this.garageWindow.addEventListener(name_1532.name_1574,this.method_1091);
         this.garageWindow.addEventListener(name_1532.name_1564,this.method_1085);
         this.garageWindow.name_1541();
      }
      
      public function method_106(param1:ClientObject, param2:Array) : void
      {
         var _loc3_:name_325 = null;
         var _loc4_:String = null;
         var _loc5_:name_324 = null;
         Main.method_8("GARAGE MODEL","initMarket itemsOnMarket: " + param2);
         this.modelRegister = Main.osgi.getService(name_32) as name_32;
         var _loc6_:int = 0;
         while(_loc6_ < param2.length)
         {
            _loc3_ = param2[_loc6_] as name_325;
            _loc4_ = _loc3_.itemId;
            _loc5_ = this.items[_loc4_];
            var_812[_loc4_] = _loc5_;
            if(!_loc5_.name_1553)
            {
               var_813[_loc4_] = _loc3_;
            }
            this.garageWindow.name_1536(_loc4_,_loc5_,null,_loc3_.discount);
            _loc6_++;
         }
         this.garageWindow.addEventListener(name_1532.name_1556,this.method_1090);
         this.garageWindow.addEventListener(name_1532.name_1572,this.method_1092);
      }
      
      public function name_1054(param1:int) : void
      {
         var _loc2_:String = null;
         Main.method_8("GARAGE MODEL","crystalsChanged: %1",param1);
         if(!this.var_819 && !this.var_825 && !this.var_834 && !this.var_833 && !this.var_824)
         {
            if(this.garageWindow != null)
            {
               _loc2_ = this.garageWindow.name_1539;
               if(_loc2_ != null)
               {
                  if(this.garageWindow.name_1548)
                  {
                     this.garageWindow.name_1540(_loc2_);
                  }
                  else
                  {
                     this.garageWindow.name_1534(_loc2_);
                  }
               }
            }
         }
      }
      
      public function method_1075(param1:ClientObject, param2:name_324) : void
      {
         Main.method_8("GARAGE MODEL","itemLoaded (" + param1.id + ")");
         var_812[param1.id] = param2;
      }
      
      private function method_1086(param1:name_1532) : void
      {
         var _loc2_:String = param1.itemId;
         this.var_823 = _loc2_;
         var _loc3_:name_324 = var_812[_loc2_] as name_324;
         var _loc4_:name_325 = var_813[_loc2_] as name_325;
         var _loc5_:name_321 = _loc3_.name_373;
         this.garageWindow.name_1551(_loc2_,_loc3_,false,_loc4_,this.mountedItems);
         if(_loc5_ == name_321.ARMOR || _loc5_ == name_321.WEAPON || _loc5_ == name_321.COLOR || _loc5_ == name_321.name_374)
         {
            if(this.mountedItems.indexOf(_loc2_) != -1)
            {
               this.garageWindow.name_1547();
            }
            else
            {
               this.garageWindow.name_1569();
            }
         }
      }
      
      private function method_1090(param1:name_1532) : void
      {
         var _loc2_:String = param1.itemId;
         this.var_837 = _loc2_;
         var _loc3_:name_324 = var_812[_loc2_] as name_324;
         var _loc4_:name_321 = _loc3_.name_373;
         var _loc5_:name_325 = var_813[_loc2_] as name_325;
         this.garageWindow.name_1551(_loc2_,_loc3_,true,_loc5_);
      }
      
      private function method_1088(param1:name_1532) : void
      {
         if(!this.var_825)
         {
            this.var_825 = true;
            Main.method_8("GARAGE MODEL","tryMountItem");
            this.tryMountItem(this.clientObject,this.var_823);
         }
      }
      
      public function tryMountItem(param1:ClientObject, param2:String) : void
      {
         Network(Main.osgi.getService(INetworker)).send("garage;try_mount_item;" + param2);
      }
      
      private function method_1097(param1:name_1532) : void
      {
         Network(Main.osgi.getService(INetworker)).send("lobby;try_open_item;" + this.var_823);
      }
      
      private function method_1092(param1:name_1532) : void
      {
         var _loc2_:name_324 = null;
         var _loc3_:Long = null;
         var _loc4_:ImageResource = null;
         if(!this.var_819)
         {
            this.var_816 = param1.itemId;
            _loc2_ = var_812[param1.itemId] as name_324;
            _loc3_ = _loc2_.previewId;
            _loc4_ = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_loc3_));
            this.method_1079(_loc2_.name,_loc2_.name_373 == name_321.INVENTORY ? int(_loc2_.price * this.garageWindow.itemInfoPanel.name_1537.value) : int(_loc2_.price),_loc4_,true,_loc2_.name_373 == name_321.ARMOR || _loc2_.name_373 == name_321.WEAPON ? int(0) : int(-1),_loc2_.name_373 == name_321.INVENTORY ? int(this.garageWindow.itemInfoPanel.name_1537.value) : int(-1));
         }
      }
      
      public function method_1093(param1:String) : void
      {
         var _loc2_:name_324 = null;
         var _loc3_:Long = null;
         var _loc4_:ImageResource = null;
         if(!this.var_819)
         {
            this.var_816 = param1;
            _loc2_ = var_812[param1] as name_324;
            _loc3_ = _loc2_.previewId;
            _loc4_ = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_loc3_));
            this.method_1079(_loc2_.name,_loc2_.name_373 == name_321.INVENTORY ? int(_loc2_.price * this.garageWindow.itemInfoPanel.name_1537.value) : int(_loc2_.price),_loc4_,true,_loc2_.name_373 == name_321.ARMOR || _loc2_.name_373 == name_321.WEAPON ? int(0) : int(-1),_loc2_.name_373 == name_321.INVENTORY ? int(this.garageWindow.itemInfoPanel.name_1537.value) : int(-1));
         }
      }
      
      private function method_1091(param1:name_1532) : void
      {
         var _loc2_:name_324 = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:name_328 = null;
         var _loc6_:Long = null;
         var _loc7_:ImageResource = null;
         if(!this.var_824)
         {
            this.var_816 = param1.itemId;
            _loc2_ = var_812[param1.itemId] as name_324;
            _loc3_ = _loc2_.modifications;
            _loc4_ = _loc2_.name_1360 + 1;
            _loc5_ = name_328(_loc3_[_loc4_]);
            _loc6_ = _loc5_.previewId;
            _loc7_ = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_loc6_));
            this.method_1079(_loc2_.name,_loc2_.name_1372,_loc7_,false,_loc4_);
         }
      }
      
      private function method_1098(param1:name_1532) : void
      {
      }
      
      private function method_1079(param1:String, param2:int, param3:ImageResource, param4:Boolean, param5:int, param6:int = -1) : void
      {
         this.panelModel.blur();
         this.var_814 = new name_1545(param1,param2,param3,param4,param5,param4 ? String(this.localeService.getText(TextConst.GARAGE_CONFIRM_ALERT_BUY_QEUSTION_TEXT)) : String(this.localeService.getText(TextConst.const_355)),param6);
         this.dialogsLayer.addChild(this.var_814);
         this.var_814.name_1568.addEventListener(MouseEvent.CLICK,param4 ? this.method_1087 : this.method_1084);
         this.var_814.name_1573.addEventListener(MouseEvent.CLICK,this.method_1082);
         this.method_1083();
         Main.stage.addEventListener(Event.RESIZE,this.method_1083);
         if(param3 != null && param3.data == null && !param3.isLoaded)
         {
            param3.loadLazyResource(this);
         }
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         if(this.var_814 != null && this.dialogsLayer.contains(this.var_814))
         {
            this.var_814.name_1550((param1 as ImageResource).data);
         }
      }
      
      public function onResourceLoadingError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(param1:Resource, param2:String) : void
      {
      }
      
      public function onResourceLoadingStart(param1:Resource) : void
      {
      }
      
      public function name_16(param1:Object) : void
      {
         if(this.var_814 != null && this.dialogsLayer.contains(this.var_814))
         {
            this.var_814.name_1550(param1.bitmapData as BitmapData);
         }
      }
      
      public function method_1077(param1:Long) : void
      {
      }
      
      private function method_1083(param1:Event = null) : void
      {
         this.var_814.x = Math.round((Main.stage.stageWidth - this.var_814.width) * 0.5);
         this.var_814.y = Math.round((Main.stage.stageHeight - this.var_814.height) * 0.5);
      }
      
      private function method_1082(param1:MouseEvent = null) : void
      {
         Main.stage.removeEventListener(Event.RESIZE,this.method_1083);
         this.dialogsLayer.removeChild(this.var_814);
         this.panelModel.unblur();
         this.var_814 = null;
      }
      
      private function method_1087(param1:MouseEvent) : void
      {
         this.method_1082();
         this.var_819 = true;
         Main.method_8("GARAGE MODEL","tryBuyItem");
         if((var_812[this.var_816] as name_324).name_373 == name_321.INVENTORY)
         {
            this.tryBuyItem(this.clientObject,this.var_816,this.garageWindow.itemInfoPanel.name_1537.value);
         }
         else
         {
            this.tryBuyItem(this.clientObject,this.var_816,1);
         }
      }
      
      public function tryBuyItem(param1:ClientObject, param2:String, param3:int) : void
      {
         Network(Main.osgi.getService(INetworker)).send("garage;try_buy_item;" + param2 + ";" + param3);
      }
      
      private function method_1084(param1:MouseEvent) : void
      {
         this.method_1082();
         this.var_824 = true;
         Main.method_8("GARAGE MODEL","tryUpgradeItem");
         this.tryUpgradeItem(this.clientObject,this.var_816);
      }
      
      public function tryUpgradeItem(param1:ClientObject, param2:String) : void
      {
         this.name_475 = param2;
         Network(Main.osgi.getService(INetworker)).send("garage;try_update_item;" + param2);
      }
      
      public function method_1085(param1:name_1532) : void
      {
      }
      
      public function mountItem(param1:ClientObject, param2:String, param3:String, param4:Long) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         if(param2 != null)
         {
            _loc5_ = this.mountedItems.indexOf(param2);
            if(_loc5_ != -1)
            {
               if(var_812[param2] != null)
               {
                  this.garageWindow.name_1560(param2);
               }
               this.mountedItems.splice(_loc5_,1);
            }
            _loc5_ = this.var_822.indexOf(param2);
            if(_loc5_ != -1)
            {
               this.var_822.splice(_loc5_,1);
            }
         }
         else
         {
            _loc6_ = true;
         }
         var _loc7_:name_324 = var_812[param3];
         if(_loc7_ != null && this.garageWindow != null)
         {
            this.garageWindow.mountItem(param3);
            this.mountedItems.push(param3);
            if(_loc7_.name_373 == name_321.WEAPON || _loc7_.name_373 == name_321.ARMOR || _loc7_.name_373 == name_321.COLOR || _loc7_.name_373 == name_321.name_374)
            {
               switch(_loc7_.name_373)
               {
                  case name_321.WEAPON:
                     this.name_470 = param3;
                     mounted[0] = this.name_470;
                     this.var_828 = var_813[param3];
                     this.var_830 = _loc7_;
                     this.method_1073(param4);
                     break;
                  case name_321.ARMOR:
                     this.name_458 = param3;
                     mounted[1] = this.name_458;
                     this.var_829 = var_813[param3];
                     this.var_831 = var_812[param3];
                     this.method_1074(param4);
                     break;
                  case name_321.COLOR:
                     this.name_484 = param3;
                     mounted[2] = this.name_484;
                     this.var_835 = var_813[param3];
                     this.var_839 = var_812[param3];
                     this.method_1072(param4);
                     break;
                  case name_321.name_374:
                     this.var_822.push(param3);
               }
            }
         }
         else
         {
            this.var_818.push(param3);
         }
         if(this.garageWindow.name_1539 == param3)
         {
            this.garageWindow.name_1534(param3);
            this.garageWindow.name_1547();
         }
         this.var_825 = false;
      }
      
      public function name_435(param1:String) : void
      {
         this.garageWindow.name_435(param1);
         this.garageWindow.name_1543();
         this.garageWindow.name_1541();
      }
      
      public function name_432(param1:ClientObject, param2:name_325) : void
      {
         var _loc3_:String = param2.itemId;
         var _loc4_:name_324 = this.items[_loc3_];
         _loc4_.name_1359 = false;
         if(!_loc4_.name_1553)
         {
            var_813[_loc3_] = param2;
            this.garageWindow.name_1567(param2);
            this.garageWindow.name_1536(_loc3_,_loc4_,param2,param2.discount);
            this.garageWindow.name_1543();
            this.garageWindow.name_1534(_loc3_);
         }
         else if(_loc4_.name_373 != name_321.KIT)
         {
            if(param2.addable)
            {
               this.garageWindow.name_1566(_loc3_,param2);
            }
            if(_loc4_.id != null)
            {
               name_1538(_loc4_.id.name_176(name_1538)).setCount(param2.count);
            }
            if(var_813[_loc3_] != null)
            {
               var_813[_loc3_] = param2;
            }
            else
            {
               var_813[_loc3_] = param2;
               if(param2.addable)
               {
                  this.garageWindow.method_1078(_loc3_);
                  this.garageWindow.name_435(param2.itemId);
                  this.garageWindow.name_1536(_loc3_,_loc4_,param2,param2.discount);
                  this.garageWindow.name_1543();
               }
            }
            if(param2.addable && this.garageWindow.name_1552 == GarageWindow.name_1549(_loc4_.name_373))
            {
               this.garageWindow.name_1534(_loc3_);
            }
         }
         if(param2.addable && this.garageWindow.name_1552 == GarageWindow.name_1549(_loc4_.name_373))
         {
            this.garageWindow.name_1563(_loc3_);
         }
         if(_loc4_.name_373 == name_321.ARMOR || _loc4_.name_373 == name_321.WEAPON)
         {
            this.tryMountItem(null,_loc4_.baseItemId);
         }
         this.var_819 = false;
      }
      
      public function method_1096(param1:String) : void
      {
         --var_813[param1].count;
         this.garageWindow.name_1534(param1);
      }
      
      public function method_1078(param1:String) : void
      {
         this.garageWindow.method_1078(param1);
         this.garageWindow.name_1541();
         this.garageWindow.name_1554(param1,this.items[param1],var_813[param1]);
         var_813[param1] = null;
      }
      
      public function name_426(param1:ClientObject, param2:String, param3:name_325) : void
      {
         Main.method_8("GARAGE MODEL","upgradeItem oldItem: " + (var_812[param2] as name_324).name);
         Main.method_8("GARAGE MODEL","upgradeItem newItemInfo: " + param3);
         var _loc4_:String = param3.itemId;
         var_813[_loc4_] = param3;
         this.garageWindow.method_1078(param2);
         var _loc5_:int = this.mountedItems.indexOf(param2);
         if(_loc5_ != -1)
         {
            this.mountedItems.splice(_loc5_,1);
         }
         var _loc6_:name_324 = var_812[_loc4_];
         ++_loc6_.name_1360;
         _loc6_.name_1372 = _loc6_.modifications[_loc6_.name_1360 >= 3 ? _loc6_.name_1360 : _loc6_.name_1360 + 1].crystalPrice;
         _loc6_.name_1565 = _loc6_.modifications[_loc6_.name_1360 >= 3 ? _loc6_.name_1360 : _loc6_.name_1360 + 1].itemProperties;
         _loc6_.name_1376 = _loc6_.modifications[_loc6_.name_1360 >= 3 ? _loc6_.name_1360 : _loc6_.name_1360 + 1].rankId;
         _loc6_.previewId = _loc6_.modifications[_loc6_.name_1360 >= 3 ? _loc6_.name_1360 : _loc6_.name_1360].previewId;
         this.garageWindow.name_1536(_loc4_,var_812[_loc4_],var_813[_loc4_],var_813[_loc4_].discount);
         this.garageWindow.name_1534(_loc4_);
         this.garageWindow.name_1555(param2,var_813[_loc4_]);
         this.var_823 = _loc4_;
         this.var_824 = false;
         if(_loc6_.name_373 == name_321.ARMOR || _loc6_.name_373 == name_321.WEAPON)
         {
            this.tryMountItem(null,_loc6_.baseItemId);
         }
         if(_loc6_.name_373 == name_321.name_374 && _loc5_ > -1)
         {
            this.mountItem(null,param2,_loc4_,null);
         }
      }
      
      public function method_1074(param1:Long) : void
      {
         var _loc2_:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1));
         if(_loc2_ != null && _loc2_.isLoaded)
         {
            if(this.garageWindow.name_1533 != null)
            {
               this.garageWindow.name_1533.method_1074(_loc2_);
            }
         }
      }
      
      public function method_1073(param1:Long) : void
      {
         var _loc2_:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1));
         if(_loc2_ != null && _loc2_.isLoaded)
         {
            if(this.garageWindow.name_1533 != null)
            {
               this.garageWindow.name_1533.method_1073(_loc2_);
            }
         }
      }
      
      public function method_1072(param1:Long) : void
      {
         var _loc2_:Resource = ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1);
         if(_loc2_ != null && _loc2_.isLoaded)
         {
            if(this.garageWindow.name_1533 != null)
            {
               if(_loc2_ is ImageResource)
               {
                  this.garageWindow.name_1533.method_1072(_loc2_ as ImageResource);
               }
               else if(_loc2_ is MultiframeImageResource)
               {
                  this.garageWindow.name_1533.name_1571(_loc2_ as MultiframeImageResource);
               }
            }
         }
      }
      
      public function method_1076(param1:String, param2:Number) : void
      {
         var _loc3_:Date = new Date(param2);
         Main.method_8("TIME INDICATOR"," incoming time " + param2 + " : " + _loc3_);
         if(this.garageWindow != null)
         {
            if(this.garageWindow.name_1539 != null && !this.garageWindow.name_1548 && param1 == this.garageWindow.name_1539)
            {
               this.garageWindow.itemInfoPanel.name_1559 = _loc3_;
            }
         }
      }
      
      public function method_36(param1:String) : void
      {
         var _loc2_:name_325 = null;
         if(this.garageWindow != null)
         {
            this.garageWindow.method_1078(param1);
            if(Boolean(var_812[param1] as name_324) && (var_812[param1] as name_324).price > 0)
            {
               _loc2_ = var_813[param1] as name_325;
               this.garageWindow.name_1554(param1,var_812[param1],_loc2_);
               this.garageWindow.name_1540(param1);
               this.garageWindow.name_1562(param1);
            }
         }
      }
      
      private function showWindow() : void
      {
         if(!this.var_83.contains(this.garageWindow))
         {
            Main.mainContainer.blendMode = BlendMode.LAYER;
            Main.systemLayer.addChild(this.garageWindow);
            Main.stage.addEventListener(Event.RESIZE,this.method_1080);
            this.method_1080();
            this.garageWindow.completeLoading();
         }
      }
      
      private function hideWindow() : void
      {
         if(this.var_83.contains(this.garageWindow))
         {
            this.garageWindow.hide();
            this.var_83.removeChild(this.garageWindow);
            Main.mainContainer.blendMode = BlendMode.NORMAL;
            Main.stage.removeEventListener(Event.RESIZE,this.method_1080);
            this.garageWindow = null;
         }
      }
      
      private function method_1080(param1:Event = null) : void
      {
         var _loc2_:Stage = Main.stage;
         var _loc3_:int = int(Math.max(1000,_loc2_.stageWidth));
         if(!battleInfoService.isInBattle())
         {
            this.garageWindow.x = Math.round(_loc3_ / 3);
            this.garageWindow.y = 60;
            this.garageWindow.resize(Math.round(_loc3_ * 2 / 3),Math.max(Main.stage.stageHeight - 60,530));
         }
         else
         {
            this.garageWindow.x = 0;
            this.garageWindow.y = 60;
            this.garageWindow.resize(_loc3_,Math.max(Main.stage.stageHeight - 60,530));
         }
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc2_:String = "\n";
         _loc2_ += "\n   ARMOR: ";
         _loc2_ += "\n";
         _loc2_ += "\n   WEAPON: ";
         return _loc2_ + "\n";
      }
      
      public function get dumperName() : String
      {
         return "mounted";
      }
      
      private function method_1081(param1:Event = null) : void
      {
         var _loc2_:int = int(Math.max(1000,Main.stage.stageWidth));
         var _loc3_:int = int(Math.max(600,Main.stage.stageHeight));
         if(!battleInfoService.isInBattle())
         {
            this.var_821.targetPoint = new Point(Math.round(_loc2_ * (1 / 3)) + 10,_loc3_ - 125);
            this.var_820.targetPoint = new Point(Math.round(_loc2_ * (1 / 3)) + 10,_loc3_ - 40);
         }
         else
         {
            this.var_821.targetPoint = new Point(10000,_loc3_ - 125);
            this.var_820.targetPoint = new Point(10000,_loc3_ - 40);
         }
         this.var_826.targetPoint = new Point(_loc2_ - 400,30);
      }
   }
}
