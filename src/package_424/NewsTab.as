package package_424
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.gui.communication.tabs.class_202;
   import alternativa.tanks.services.NewsServiceEvent;
   import alternativa.tanks.services.name_363;
   import controls.base.name_1134;
   import controls.name_1891;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import forms.name_1139;
   import package_13.Long;
   import package_130.name_348;
   import package_393.name_2002;
   import package_463.NewsItem;
   import utils.name_1915;
   
   public class NewsTab extends class_202
   {
      
      public static var var_3125:name_363 = OSGi.getInstance().name_6(name_363) as name_363;
      
      private static const const_2222:int = 25;
      
      private static const const_2220:int = 5;
      
      private static const const_2219:int = 15;
      
      private static const const_2221:int = 5;
      
      private static const const_2218:int = 3;
      
      private static const const_2355:int = 10;
      
      private static const const_2357:int = 12;
      
      private static const const_2356:int = 24;
       
      
      private var var_2630:ScrollPane;
      
      private var var_2632:Sprite;
      
      private var var_2861:Sprite;
      
      private var var_1182:name_1891;
      
      private var var_3127:Boolean;
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_3126:Dictionary;
      
      public function NewsTab()
      {
         this.var_2630 = new ScrollPane();
         this.var_2632 = new Sprite();
         this.var_2861 = new Sprite();
         this.var_1182 = new name_1891(0,0,name_1891.name_1428);
         this.var_3126 = new Dictionary();
         super();
         this.var_1182.name_1895 = true;
         addChild(this.var_1182);
         this.var_2632.addChild(this.var_2861);
         name_1915.name_1918(this.var_2630);
         this.var_2630.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.var_2630.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.var_2630.source = this.var_2632;
         this.var_2630.update();
         this.var_2630.focusEnabled = false;
         this.var_2630.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel,true);
         this.var_1182.addChild(this.var_2630);
         var_3125.method_1156(this.method_2901);
         var_3125.addEventListener(NewsServiceEvent.NEWS_ITEM_IS_SENT,this.method_2251);
         var_3125.addEventListener(NewsServiceEvent.NEWS_ITEM_IS_REMOVED,this.method_2898);
         addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:NewsItem = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < this.var_2632.numChildren)
         {
            _loc2_ = this.var_2632.getChildAt(_loc5_);
            if(_loc2_ is NewsItem)
            {
               _loc3_ = NewsItem(_loc2_);
               _loc4_ = _loc2_.y - (this.var_3127 ? this.var_2630.verticalScrollPosition : 0);
               if(!_loc3_.name_3089() && _loc2_.x <= mouseX && _loc2_.x + _loc2_.width >= mouseX && _loc4_ <= mouseY && _loc4_ + _loc2_.height >= mouseY)
               {
                  _loc3_.name_3090();
                  break;
               }
            }
            _loc5_++;
         }
      }
      
      private function onMouseWheel(param1:MouseEvent) : void
      {
         param1.delta *= 3;
      }
      
      private function method_2898(param1:NewsServiceEvent) : void
      {
         var _loc2_:Long = param1.name_3091();
         var _loc3_:NewsItem = this.var_3126[_loc2_];
         if(_loc3_ != null)
         {
            this.method_1164(_loc3_);
         }
      }
      
      public function method_1164(param1:NewsItem) : void
      {
         param1.destroy();
         var _loc2_:int = this.var_2632.getChildIndex(param1);
         this.var_2632.removeChildAt(_loc2_);
         this.method_2900(_loc2_);
         this.resize(this._width,this._height);
      }
      
      private function method_2900(param1:int) : void
      {
         if(!(this.var_2632.getChildAt(param1 - 1) is name_1134))
         {
            return;
         }
         if(param1 == this.var_2632.numChildren || this.var_2632.getChildAt(param1) is name_1134)
         {
            this.var_2632.removeChildAt(param1 - 1);
         }
      }
      
      private function method_2251(param1:NewsServiceEvent) : void
      {
         var _loc2_:name_1134 = null;
         var _loc3_:name_348 = param1.name_3088();
         var _loc4_:Long = _loc3_.id;
         if(this.var_3126[_loc4_] != null)
         {
            return;
         }
         var _loc5_:NewsItem = this.method_2897(_loc3_);
         if(_loc5_ == null)
         {
            return;
         }
         this.var_3126[_loc4_] = _loc5_;
         var _loc6_:String = _loc3_.dateInSeconds;
         if(this.var_2632.numChildren > 1)
         {
            _loc2_ = this.var_2632.getChildAt(1) as name_1134;
            if(_loc6_ == _loc2_.text)
            {
               this.var_2632.addChildAt(_loc5_,2);
            }
            else
            {
               this.method_2899(_loc5_,_loc6_);
            }
         }
         else
         {
            this.method_2899(_loc5_,_loc6_);
         }
         this.resize(this._width,this._height);
         dispatchEvent(new NewsTabNewsItemAddedEvent());
      }
      
      private function method_2897(param1:name_348) : NewsItem
      {
         var _loc2_:int = 0;
         if(param1.endDate > 0)
         {
            _loc2_ = param1.endDate * 1000 - new Date().time;
            if(_loc2_ < 5000)
            {
               return null;
            }
         }
         var _loc3_:NewsItem = new NewsItem(param1,this,_loc2_);
         _loc3_.x = 10;
         return _loc3_;
      }
      
      private function method_2899(param1:NewsItem, param2:String) : void
      {
         this.var_2632.addChildAt(param1,1);
         var _loc3_:name_1134 = new name_1134();
         _loc3_.htmlText = param2;
         _loc3_.textColor = name_1139.const_1753;
         this.var_2632.addChildAt(_loc3_,1);
      }
      
      override public function resize(param1:int, param2:int) : void
      {
         this._width = param1;
         this._height = param2;
         this.var_2630.y = 5;
         this.var_2630.setSize(param1 + 5,param2 - 5 * 2);
         this.var_1182.width = param1;
         this.var_1182.height = param2;
         var _loc3_:int = this.method_2736(param1 - 20);
         this.var_3127 = false;
         if(this.var_2630.height < _loc3_ + 5 * 2)
         {
            _loc3_ = this.method_2736(param1 - 25);
            this.var_3127 = true;
         }
         this.method_2690(_loc3_);
         this.var_2630.update();
      }
      
      private function method_2690(param1:int) : void
      {
         this.var_2861.graphics.lineStyle(1,name_1139.name_2012,0);
         this.var_2861.graphics.beginFill(name_1139.name_2012,0);
         this.var_2861.graphics.drawRect(0,0,1,15);
         this.var_2861.graphics.endFill();
         this.var_2861.x = 25;
         this.var_2861.y = param1;
      }
      
      private function method_2736(param1:int) : int
      {
         var _loc2_:DisplayObject = null;
         var _loc3_:NewsItem = null;
         var _loc4_:name_1134 = null;
         var _loc5_:int = 12 >> 1;
         var _loc6_:int = 0;
         while(_loc6_ < this.var_2632.numChildren)
         {
            _loc2_ = this.var_2632.getChildAt(_loc6_);
            if(_loc2_ is NewsItem)
            {
               _loc3_ = NewsItem(_loc2_);
               _loc3_.resize(param1);
               _loc3_.y = _loc5_;
               _loc5_ += _loc3_.method_165() + 24;
            }
            if(_loc2_ is name_1134)
            {
               _loc4_ = name_1134(_loc2_);
               _loc4_.x = param1 - _loc4_.textWidth >> 1;
               _loc4_.y = _loc5_;
               _loc5_ = _loc4_.y + _loc4_.textHeight + 12;
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      private function method_2901(param1:Vector.<name_348>) : void
      {
         var _loc2_:name_348 = null;
         var _loc3_:NewsItem = null;
         var _loc4_:String = null;
         var _loc5_:name_1134 = null;
         this.method_1831();
         var _loc6_:String = "";
         for each(_loc2_ in param1)
         {
            _loc3_ = this.method_2897(_loc2_);
            if(_loc3_ != null)
            {
               _loc4_ = _loc2_.dateInSeconds;
               if(_loc6_ != _loc4_)
               {
                  _loc6_ = _loc4_;
                  _loc5_ = new name_1134();
                  _loc5_.htmlText = _loc6_;
                  _loc5_.textColor = name_1139.const_1753;
                  this.var_2632.addChild(_loc5_);
               }
               this.var_3126[_loc2_.id] = _loc3_;
               this.var_2632.addChild(_loc3_);
            }
         }
         this.resize(this._width,this._height);
         dispatchEvent(new name_2513(param1));
      }
      
      private function method_2902(param1:int) : String
      {
         var _loc2_:Date = new Date();
         _loc2_.setTime(param1 * 1000);
         return name_2002.name_2009(_loc2_);
      }
      
      private function method_1831() : void
      {
         this.var_2632 = new Sprite();
         this.var_2861 = new Sprite();
         this.var_2632.addChild(this.var_2861);
         this.var_2630.source = this.var_2632;
         this.var_2630.update();
         var_3125.method_1162();
      }
      
      public function destroy() : void
      {
         var _loc1_:NewsItem = null;
         var_3125.method_1163();
         this.var_2630.removeEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheel);
         var_3125.removeEventListener(NewsServiceEvent.NEWS_ITEM_IS_SENT,this.method_2251);
         var_3125.removeEventListener(NewsServiceEvent.NEWS_ITEM_IS_REMOVED,this.method_2898);
         removeEventListener(MouseEvent.CLICK,this.onClick);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_2632.numChildren)
         {
            _loc1_ = this.var_2632.getChildAt(_loc2_) as NewsItem;
            if(_loc1_ != null)
            {
               _loc1_.destroy();
            }
            _loc2_++;
         }
      }
   }
}
