package package_415
{
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.statassets.ReferralStatHeader;
   import controls.statassets.class_150;
   import controls.statassets.name_3006;
   import controls.statassets.name_3007;
   import controls.statassets.name_3008;
   import controls.statassets.name_3009;
   import controls.statassets.name_3010;
   import controls.statassets.name_3011;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Timer;
   import package_1.Main;
   import package_280.name_3005;
   
   public class ReferralStatList extends Sprite
   {
       
      
      private var header:ReferralStatHeader;
      
      protected var list:List;
      
      protected var var_1347:DataProvider;
      
      protected var var_2997:int = 1;
      
      protected var var_2998:DisplayObject;
      
      protected var var_2999:DisplayObject;
      
      protected var timer:Timer = null;
      
      protected var _width:int = 100;
      
      private var _height:int = 100;
      
      public function ReferralStatList()
      {
         this.header = new ReferralStatHeader();
         this.list = new List();
         this.var_1347 = new DataProvider();
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.method_2068);
      }
      
      public static function method_2791(param1:int, param2:int, param3:Boolean) : BitmapData
      {
         var _loc5_:class_150 = null;
         var _loc4_:Sprite = new Sprite();
         var _loc6_:Array = [0,param1 - 120,param1 - 1];
         var _loc7_:int = 0;
         var _loc8_:BitmapData = new BitmapData(param1,20,true,0);
         _loc7_ = 0;
         while(_loc7_ < 2)
         {
            if(param2 == _loc7_)
            {
               if(param3)
               {
                  _loc5_ = new name_3009();
               }
               else
               {
                  _loc5_ = new name_3011();
               }
            }
            else if(param3)
            {
               _loc5_ = new name_3006();
            }
            else
            {
               _loc5_ = new name_3008();
            }
            _loc5_.width = _loc6_[_loc7_ + 1] - _loc6_[_loc7_] - 2;
            _loc5_.height = 18;
            _loc5_.x = _loc6_[_loc7_];
            _loc4_.addChild(_loc5_);
            _loc7_++;
         }
         _loc8_.draw(_loc4_);
         return _loc8_;
      }
      
      protected function method_2068(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.method_2068);
         this.var_2997 = 1;
         this.list.rowHeight = 20;
         this.list.setStyle("cellRenderer",ReferralStatListRenderer);
         this.list.dataProvider = this.var_1347;
         this.method_2795();
         addChild(this.header);
         addChild(this.list);
         this.list.y = 20;
         this.header.addEventListener(name_3005.name_3013,this.method_2794);
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.list.height = this._height - 20;
      }
      
      public function clear() : void
      {
         var _loc1_:Object = new Object();
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1347.length)
         {
            _loc1_ = this.var_1347.getItemAt(_loc2_);
            _loc1_.sort = this.var_2997;
            this.var_1347.replaceItemAt(_loc1_,_loc2_);
            _loc2_++;
         }
         this.sort();
      }
      
      public function name_2300(param1:Array) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         for each(_loc3_ in param1)
         {
            _loc2_ = new Object();
            _loc2_.rank = _loc3_.rank;
            _loc2_.callsign = _loc3_.callsign;
            _loc2_.income = _loc3_.income;
            _loc2_.sort = this.var_2997;
            Main.method_8("REFERALS MODEL","name = %1, income=%2",_loc2_.callsign,_loc2_.income);
            this.var_1347.addItem(_loc2_);
         }
         this.sort();
      }
      
      private function sort() : void
      {
         if(this.var_2997 == 0)
         {
            this.var_1347.sortOn("callsign");
         }
         else
         {
            this.var_1347.sortOn("income",Array.NUMERIC | Array.DESCENDING);
         }
         this.var_1347.invalidate();
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         var _loc2_:Boolean = this.list.maxVerticalScrollPosition > 0;
         var _loc3_:int = _loc2_ ? this._width + 6 : this._width;
         this.list.width = _loc3_;
         this.header.width = _loc2_ ? _loc3_ - 15 : _loc3_;
         name_3010.bg = new Bitmap(method_2791(_loc2_ ? _loc3_ - 15 : _loc3_,this.var_2997,false));
         name_3007.bg = new Bitmap(method_2791(_loc2_ ? _loc3_ - 15 : _loc3_,this.var_2997,true));
         this.var_1347.invalidate();
      }
      
      protected function method_2794(param1:name_3005) : void
      {
         this.var_2997 = param1.name_3012;
         this.clear();
         this.width = this._width;
      }
      
      protected function method_2795() : void
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
   }
}
