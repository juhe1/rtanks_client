package package_316
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.GarageModel;
   import assets.icons.GarageItemBackground;
   import assets.icons.IconGarageMod;
   import assets.icons.InputCheckIcon;
   import assets.name_2295;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.InventoryIcon;
   import controls.Money;
   import controls.base.name_1134;
   import controls.saleicons.SaleIcons;
   import fl.controls.ScrollBarDirection;
   import fl.controls.TileList;
   import fl.data.DataProvider;
   import fl.events.ListEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.getTimer;
   import forms.RegisterForm;
   import package_207.name_561;
   import package_280.name_2618;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.disposeBitmapsData;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeDisplayObject;
   
   public class PartsList extends Sprite implements IResourceLoadingListener
   {
      
      public static var userPropertiesService:name_561 = OSGi.getInstance().name_6(name_561) as name_561;
      
      public static const const_2475:int = 4;
      
      public static const WEAPON:int = 1;
      
      public static const ARMOR:int = 2;
      
      public static const COLOR:int = 3;
      
      public static const PLUGIN:int = 5;
      
      public static const name_374:int = 7;
      
      private static const const_2476:Number = 70;
      
      private static const const_2473:Number = 7;
      
      private static const const_2474:Number = 3;
      
      private static const var_3035:Bitmap = SaleIcons.name_3195();
       
      
      private var list:TileList;
      
      private var var_1347:DataProvider;
      
      private var typeSort:Array;
      
      private var var_3173:Object = null;
      
      private var var_3174:Number;
      
      private var var_3176:Number;
      
      private var var_3175:Number;
      
      private var var_3178:int;
      
      private var var_3172:int;
      
      private var currentTime:int;
      
      private var var_3171:Number = 0;
      
      private var _width:int;
      
      private var _height:int;
      
      private var model:GarageModel;
      
      private var var_3177:Array;
      
      public function PartsList()
      {
         this.typeSort = [1,2,3,4,0];
         super();
         this.var_1347 = new DataProvider();
         this.var_3177 = [];
         this.list = new TileList();
         this.list.dataProvider = this.var_1347;
         this.list.addEventListener(ListEvent.ITEM_CLICK,this.method_2744);
         this.list.addEventListener(ListEvent.ITEM_DOUBLE_CLICK,this.method_2744);
         this.list.rowCount = 1;
         this.list.rowHeight = 130;
         this.list.columnWidth = 203;
         this.list.setStyle("cellRenderer",PartsListRenderer);
         this.list.direction = ScrollBarDirection.HORIZONTAL;
         this.list.focusEnabled = false;
         this.list.horizontalScrollBar.focusEnabled = false;
         addChild(this.list);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.method_2936);
         this.method_2266();
         addEventListener(Event.ADDED_TO_STAGE,this.method_1472);
         addEventListener(Event.REMOVED_FROM_STAGE,this.method_2938);
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1347.length)
         {
            _loc2_ = this.var_1347.getItemAt(_loc3_);
            if(_loc2_.dat.preview != null && (_loc2_.dat.preview as ImageResource).id == param1.id)
            {
               this.update(_loc2_.dat.id,"preview",param1 as ImageResource);
            }
            _loc3_++;
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
      
      private function method_2937(param1:MouseEvent) : void
      {
         this.var_3171 = 0;
         var _loc2_:Rectangle = this.list.horizontalScrollBar.getBounds(stage);
         _loc2_.top -= 3;
         if(!_loc2_.contains(param1.stageX,param1.stageY))
         {
            this.var_3175 = 0;
            this.var_3174 = this.var_3176 = param1.stageX;
            this.currentTime = this.var_3172 = getTimer();
            this.var_3178 = this.list.selectedIndex;
            stage.addEventListener(MouseEvent.MOUSE_UP,this.method_2933);
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.method_2932);
         }
      }
      
      private function method_2932(param1:MouseEvent) : void
      {
         this.var_3174 = this.var_3176;
         this.var_3176 = param1.stageX;
         this.var_3172 = this.currentTime;
         this.currentTime = getTimer();
         var _loc2_:Number = this.var_3176 - this.var_3174;
         this.var_3175 += Math.abs(_loc2_);
         if(this.var_3175 > 7)
         {
            this.list.horizontalScrollPosition -= _loc2_;
         }
      }
      
      private function method_2933(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_2932);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_2933);
         var _loc2_:Number = (getTimer() - this.var_3172) / 1000;
         if(_loc2_ == 0)
         {
            _loc2_ = 0.1;
         }
         var _loc3_:Number = param1.stageX - this.var_3174;
         this.var_3171 = _loc3_ / _loc2_;
         this.var_3172 = this.currentTime;
         this.currentTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.method_2934);
      }
      
      private function method_2934(param1:Event) : void
      {
         this.var_3172 = this.currentTime;
         this.currentTime = getTimer();
         var _loc2_:Number = (this.currentTime - this.var_3172) / 1000;
         this.list.horizontalScrollPosition -= this.var_3171 * _loc2_;
         var _loc3_:Number = this.list.horizontalScrollPosition;
         var _loc4_:Number = this.list.maxHorizontalScrollPosition;
         if(Math.abs(this.var_3171) > 70 && 0 < _loc3_ && _loc3_ < _loc4_)
         {
            this.var_3171 *= Math.exp(-1.5 * _loc2_);
         }
         else
         {
            this.var_3171 = 0;
            removeEventListener(Event.ENTER_FRAME,this.method_2934);
         }
      }
      
      public function get name_2636() : Object
      {
         return this.var_3173;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.list.width = this._width;
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.list.height = this._height;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      private function method_1472(param1:Event) : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.method_2937);
      }
      
      private function method_2938(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.method_2934);
         removeEventListener(MouseEvent.MOUSE_WHEEL,this.method_2936);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.method_2937);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_2933);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.method_2932);
      }
      
      public function addItem(param1:Object, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:int, param11:ImageResource, param12:Boolean, param13:int = 0) : void
      {
         var _loc14_:DisplayObject = null;
         var _loc15_:DisplayObject = null;
         var _loc16_:Object = {};
         var _loc17_:Boolean = param7 < 1 && !param9;
         _loc16_.id = param1;
         _loc16_.name = param2;
         _loc16_.type = param3;
         _loc16_.typeSort = this.typeSort[param3];
         _loc16_.mod = param13;
         _loc16_.crystalPrice = param5;
         _loc16_.discount = param6;
         _loc16_.rang = param9 ? -1 : param7;
         _loc16_.installed = param8;
         _loc16_.garageElement = param9;
         _loc16_.count = param10;
         _loc16_.preview = param11;
         _loc16_.sort = param4;
         _loc16_.sto = param12;
         _loc14_ = this.method_2586(_loc16_,false,param12);
         _loc15_ = this.method_2586(_loc16_,true,param12);
         this.var_1347.addItem({
            "iconNormal":_loc14_,
            "iconSelected":_loc15_,
            "dat":_loc16_,
            "accessable":_loc17_,
            "rang":_loc16_.rang,
            "type":param3,
            "sto":param12,
            "typesort":_loc16_.typeSort,
            "sort":param4
         });
         this.var_1347.sortOn(["sto","accessable","rang","typesort","sort"],[Array.DESCENDING,Array.DESCENDING,Array.NUMERIC,Array.NUMERIC,Array.NUMERIC]);
      }
      
      public function update(param1:Object, param2:String, param3:* = null) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:int = this.method_2313(param1);
         if(_loc6_ == -1)
         {
            return;
         }
         var _loc7_:Object = this.var_1347.getItemAt(_loc6_);
         var _loc8_:Object = _loc7_.dat;
         _loc8_[param2] = param3;
         _loc4_ = this.method_2586(_loc8_,false,_loc8_.sto);
         _loc5_ = this.method_2586(_loc8_,true,_loc8_.sto);
         _loc7_.dat = _loc8_;
         _loc7_.iconNormal = _loc4_;
         _loc7_.iconSelected = _loc5_;
         this.var_1347.replaceItemAt(_loc7_,_loc6_);
         this.var_1347.sortOn(["sto","accessable","rang","typesort","sort"],[Array.DESCENDING,Array.DESCENDING,Array.NUMERIC,Array.NUMERIC,Array.NUMERIC]);
         this.var_1347.invalidateItemAt(_loc6_);
      }
      
      public function lock(param1:Object) : void
      {
         this.update(param1,"accessable",true);
      }
      
      public function unlock(param1:Object) : void
      {
         this.update(param1,"accessable",false);
      }
      
      public function mount(param1:Object) : void
      {
         this.update(param1,"installed",true);
      }
      
      public function name_1370(param1:Object) : void
      {
         this.update(param1,"installed",false);
      }
      
      public function method_2940(param1:Object, param2:int) : void
      {
         this.update(param1,"condition",param2);
      }
      
      public function name_2624(param1:Object, param2:int) : void
      {
         this.update(param1,"count",param2);
      }
      
      public function method_2939(param1:Object, param2:int) : void
      {
         this.update(param1,"mod",param2);
      }
      
      public function method_2941() : void
      {
         this.var_1347 = new DataProvider();
      }
      
      public function getItemAt(param1:int) : Object
      {
         return this.var_1347.getItemAt(param1);
      }
      
      public function name_2622(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         var _loc3_:Object = this.var_1347.getItemAt(_loc2_);
         if(this.list.selectedIndex == _loc2_)
         {
            this.var_3173 = null;
            this.list.selectedItem = null;
         }
         this.var_1347.removeItem(_loc3_);
      }
      
      public function name_1879(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         this.list.selectedIndex = _loc2_;
         this.var_3173 = param1;
         dispatchEvent(new name_2618(name_2618.name_2625));
      }
      
      public function name_2628(param1:uint) : void
      {
         if(this.var_1347.length == 0)
         {
            return;
         }
         var _loc2_:Object = (this.var_1347.getItemAt(param1) as Object).dat;
         this.list.selectedIndex = param1;
         this.var_3173 = _loc2_.id;
         dispatchEvent(new name_2618(name_2618.name_2625));
      }
      
      public function name_2626(param1:Object) : void
      {
         var _loc2_:int = this.method_2313(param1);
         this.list.scrollToIndex(_loc2_);
      }
      
      public function name_2631() : void
      {
         this.var_3173 = null;
         this.list.selectedItem = null;
      }
      
      private function method_2586(param1:Object, param2:Boolean, param3:Boolean) : DisplayObject
      {
         var _loc4_:Bitmap = null;
         var _loc5_:BitmapData = null;
         var _loc6_:GarageItemBackground = null;
         var _loc7_:String = null;
         var _loc8_:name_1134 = null;
         var _loc9_:name_2193 = null;
         var _loc20_:Boolean = false;
         _loc4_ = null;
         var _loc10_:Sprite = new Sprite();
         var _loc11_:Sprite = new Sprite();
         var _loc12_:name_1134 = new name_1134();
         var _loc13_:name_1134 = new name_1134();
         var _loc14_:name_1134 = new name_1134();
         var _loc15_:name_2295 = new name_2295();
         var _loc16_:IconGarageMod = new IconGarageMod(param1.mod);
         var _loc17_:InventoryIcon = new InventoryIcon(param1.sort,true);
         var _loc18_:InputCheckIcon = new InputCheckIcon();
         var _loc19_:ImageResource = param1.preview as ImageResource;
         if(_loc19_ != null && _loc19_.data == null)
         {
            _loc11_.addChild(_loc18_);
            _loc18_.x = 200 - _loc18_.width >> 1;
            _loc18_.y = 130 - _loc18_.height >> 1;
            _loc18_.gotoAndStop(RegisterForm.name_2297);
            _loc19_.addLazyListener(this);
         }
         else if(_loc19_ == null)
         {
            _loc11_.addChild(_loc18_);
            _loc18_.x = 200 - _loc18_.width >> 1;
            _loc18_.y = 130 - _loc18_.height >> 1;
            _loc18_.gotoAndStop(RegisterForm.name_2443);
         }
         else if(_loc19_.isLoaded)
         {
            _loc4_ = new Bitmap(_loc19_.data);
            _loc4_.x = 200 - _loc19_.data.width >> 1;
            _loc4_.y = 18;
            _loc11_.addChild(_loc4_);
         }
         if(param1.rang > 0 && !param1.garageElement || Boolean(param1.accessable))
         {
            _loc9_ = new BigRankIcon();
            _loc9_.name_2152(param1.rang);
            _loc7_ = "OFF";
            param1.installed = false;
            _loc9_.x = 135;
            _loc9_.y = 60;
            if(param1.type != 5)
            {
               _loc11_.addChild(_loc9_);
            }
            _loc14_.color = _loc13_.color = _loc12_.color = 12632256;
            _loc6_ = new GarageItemBackground(param2 ? 2 : 0);
         }
         else
         {
            if(Boolean(param1.garageElement))
            {
               _loc14_.color = _loc13_.color = _loc12_.color = 11194766;
               _loc6_ = new GarageItemBackground(Boolean(param1.installed) ? (param2 ? 6 : 5) : (param2 ? 10 : 9));
            }
            else
            {
               _loc14_.color = _loc13_.color = _loc12_.color = 5898034;
               _loc6_ = new GarageItemBackground(param2 ? 8 : 7);
            }
            _loc14_.color = _loc13_.color = _loc12_.color = 5898034;
            switch(param1.type)
            {
               case 1:
                  if(Boolean(param1.garageElement))
                  {
                     _loc11_.addChild(_loc16_);
                     _loc16_.x = 159;
                     _loc16_.y = 7;
                  }
                  if(Boolean(param1.installed))
                  {
                     _loc12_.color = 8693863;
                  }
                  _loc7_ = "GUN";
                  break;
               case 2:
                  if(Boolean(param1.garageElement))
                  {
                     _loc11_.addChild(_loc16_);
                     _loc16_.x = 159;
                     _loc16_.y = 7;
                  }
                  if(Boolean(param1.installed))
                  {
                     _loc12_.color = 9411748;
                  }
                  _loc7_ = "SHIELD";
                  break;
               case 7:
                  if(Boolean(param1.garageElement))
                  {
                     _loc11_.addChild(_loc16_);
                     _loc16_.x = 159;
                     _loc16_.y = 7;
                  }
                  if(Boolean(param1.installed))
                  {
                     _loc12_.color = 9411748;
                  }
                  break;
               case 3:
                  _loc7_ = "COLOR";
                  if(Boolean(param1.installed))
                  {
                     _loc12_.color = 11049390;
                  }
                  break;
               case 4:
                  _loc7_ = "ENGINE";
                  param1.installed = false;
                  _loc11_.addChild(_loc14_);
                  _loc14_.x = 90;
                  _loc14_.y = 100;
                  _loc17_.x = 6;
                  _loc17_.y = 84;
                  _loc14_.autoSize = TextFieldAutoSize.NONE;
                  _loc14_.size = 16;
                  _loc14_.align = TextFormatAlign.RIGHT;
                  _loc14_.width = 100;
                  _loc14_.height = 25;
                  _loc14_.text = param1.count == 0 ? " " : "×" + String(param1.count);
                  break;
               case 5:
                  _loc7_ = "PLUGIN";
            }
         }
         _loc7_ += (Boolean(param1.installed) ? "_INSTALLED" : "_NORMAL") + (param2 ? "_SELECTED" : "");
         if(param1.type == 1 || param1.type == 2 || param1.type == 7)
         {
            _loc12_.text = param1.name + " M" + param1.mod;
         }
         else
         {
            _loc12_.text = param1.name;
         }
         if(!param1.garageElement || param1.type == 4)
         {
            if(param1.crystalPrice > 0)
            {
               _loc13_.text = Money.name_876(param1.crystalPrice,false);
               _loc13_.x = 181 - _loc13_.textWidth;
               _loc13_.y = 2;
               _loc11_.addChild(_loc15_);
               _loc11_.addChild(_loc13_);
               _loc15_.x = 186;
               _loc15_.y = 6;
            }
         }
         _loc12_.y = 2;
         _loc12_.x = 3;
         _loc11_.addChildAt(_loc6_,0);
         _loc11_.addChild(_loc12_);
         if(Boolean(param1.garageElement))
         {
            if((param1.type == 1 || param1.type == 2) && param1.mod != 3)
            {
               _loc20_ = true;
            }
            if(param1.type == 4)
            {
               _loc20_ = true;
            }
         }
         else
         {
            _loc20_ = userPropertiesService.rank >= param1.rang;
         }
         if(param1.discount > 0 && _loc20_)
         {
            var_3035.y = _loc6_.height - var_3035.height - 8;
            var_3035.x = _loc6_.width - var_3035.width - 2;
            _loc11_.addChild(var_3035);
            _loc8_ = new name_1134();
            _loc8_.color = 16777215;
            _loc8_.align = TextFormatAlign.CENTER;
            _loc8_.text = "-" + param1.discount + "%";
            _loc8_.size = 13;
            _loc8_.x = int(var_3035.x + var_3035.width / 2 - _loc8_.textWidth / 2);
            _loc8_.y = var_3035.y + 6;
            _loc11_.addChild(_loc8_);
            if(param1.timerDiscount == null)
            {
               _loc8_.y += 5;
            }
         }
         _loc5_ = new BitmapData(_loc11_.width,_loc11_.height,true,0);
         _loc5_.draw(_loc11_);
         this.var_3177.push(_loc5_);
         _loc10_.addChildAt(new Bitmap(_loc5_),0);
         return _loc10_;
      }
      
      private function method_2266() : void
      {
         this.list.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.list.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.list.setStyle("trackUpSkin",ScrollTrackGreen);
         this.list.setStyle("trackDownSkin",ScrollTrackGreen);
         this.list.setStyle("trackOverSkin",ScrollTrackGreen);
         this.list.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.list.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      public function method_2313(param1:Object) : int
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1347.length)
         {
            _loc2_ = this.var_1347.getItemAt(_loc3_);
            if(_loc2_.dat.id == param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      private function method_2744(param1:ListEvent) : void
      {
         var _loc2_:Object = null;
         _loc2_ = param1.item;
         this.var_3173 = _loc2_.dat.id;
         this.list.selectedItem = _loc2_;
         this.list.scrollToSelected();
         dispatchEvent(new name_2618(name_2618.name_2625));
         if(param1.type == ListEvent.ITEM_DOUBLE_CLICK)
         {
            dispatchEvent(new name_2618(name_2618.ITEM_DOUBLE_CLICK));
         }
      }
      
      private function method_2936(param1:MouseEvent) : void
      {
         this.list.horizontalScrollPosition -= param1.delta * (Boolean(Capabilities.os.search("Linux") != -1) ? 50 : 10);
      }
      
      public function destroy() : void
      {
         disposeBitmapsData(this.var_3177);
         this.var_3177 = null;
         removeDisplayObject(this.list);
         this.method_2935();
         this.list.removeEventListener(ListEvent.ITEM_CLICK,this.method_2744);
         this.list.removeAll();
         this.list = null;
         this.var_1347.removeAll();
         this.var_1347 = null;
      }
      
      public function name_2634() : void
      {
         this.method_2935();
         this.var_1347.removeAll();
      }
      
      public function sort() : void
      {
         this.var_1347.sortOn(["sto","accessable","rang","typesort","sort"],[Array.DESCENDING,Array.DESCENDING,Array.NUMERIC,Array.NUMERIC,Array.NUMERIC]);
      }
      
      public function name_2630() : int
      {
         return this.var_1347.length;
      }
      
      private function method_2935() : void
      {
         var _loc1_:Object = null;
         var _loc2_:ImageResource = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_1347.length)
         {
            _loc1_ = this.var_1347.getItemAt(_loc3_);
            _loc2_ = _loc1_.dat.preview as ImageResource;
            if(_loc2_ != null)
            {
               _loc2_.removeLazyListener(this);
            }
            _loc3_++;
         }
      }
   }
}
