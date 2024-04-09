package controls.chat
{
   import controls.base.LabelBase;
   import controls.TankWindowInner;
   import controls.statassets.class_150;
   import controls.statassets.name_2741;
   import controls.statassets.name_3008;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_390.ChatUpdateEvent;
   import package_390.name_3078;
   import package_423.ChatAddressMode;
   import package_423.MessageType;
   
   public class name_2520 extends Sprite
   {
      
      private static const const_2351:uint = 8454016;
      
      private static const const_2349:uint = 16776960;
      
      private static const const_2352:uint = 16777215;
      
      private static const const_2346:uint = 1244928;
      
      private static const const_2348:uint = 5898034;
      
      private static const const_2347:String = "→";
      
      private static const const_2350:String = "—";
       
      
      private var data:name_3079;
      
      public var var_3114:LabelBase;
      
      private var var_385:String;
      
      private var var_3123:String;
      
      private var var_3115:name_3078;
      
      private var var_3116:name_3078;
      
      private var var_3118:LabelBase;
      
      private var var_3121:Boolean = false;
      
      private var _self:Boolean = false;
      
      private var var_3119:MessageType;
      
      private var var_3117:int = 0;
      
      private var var_3124:Boolean;
      
      private var var_3122:String;
      
      private var _width:int;
      
      private var var_1445:Bitmap;
      
      public var var_3120:ChatAddressMode;
      
      public function name_2520(param1:name_3079, param2:int, param3:Boolean, param4:Boolean)
      {
         var _loc5_:name_2508 = null;
         var _loc7_:String = null;
         super();
         this.data = param1;
         this._width = param2;
         _loc5_ = param1.name_3082();
         var _loc6_:name_2508 = param1.name_3083();
         _loc7_ = param1.getText();
         this.var_3122 = _loc5_.ip;
         this.var_3119 = param1.name_3081();
         this.var_3120 = param1.name_3084();
         mouseEnabled = false;
         this.var_1445 = new Bitmap();
         addChild(this.var_1445);
         if(_loc5_.userId != null)
         {
            this.var_385 = _loc5_.uid;
            this.var_3115 = new name_3078(_loc5_.uid,_loc5_.rankIndex,_loc5_.chatModeratorLevel);
            addChild(this.var_3115);
            this.var_3115.name_2046(1244928);
            this.method_2890(_loc6_.userId == null);
         }
         if(_loc6_.userId != null)
         {
            this.var_3123 = _loc6_.uid;
            this.var_3116 = new name_3078(_loc6_.uid,_loc6_.rankIndex,_loc6_.chatModeratorLevel);
            addChild(this.var_3116);
            this.var_3116.name_2046(1244928);
            this.var_3118 = new LabelBase();
            addChild(this.var_3118);
            this.var_3118.text = this.var_3120 == ChatAddressMode.PRIVATE ? "→" : "—";
            this.var_3118.color = this.var_3120 == ChatAddressMode.PRIVATE ? uint(16777215) : uint(1244928);
            this.method_2889();
         }
         this.var_3114 = new LabelBase();
         this.var_3114.color = this.method_2891(this.var_3119);
         this.var_3114.multiline = true;
         this.var_3114.wordWrap = true;
         this.var_3114.selectable = true;
         addChild(this.var_3114);
         if(this.var_3117 > this._width / 2)
         {
            this.var_3114.y = 15;
            this.var_3114.x = 0;
            this.var_3114.width = this._width - 5;
         }
         else
         {
            this.var_3114.x = this.var_3117 + 3;
            this.var_3114.y = 0;
            this.var_3114.width = this._width - this.var_3117 - 8;
         }
         if(param1.name_3080())
         {
            this.var_3114.htmlText = _loc7_;
         }
         else
         {
            this.var_3114.text = _loc7_;
         }
         this.method_2892 = param4;
      }
      
      public function getData() : name_3079
      {
         return this.data;
      }
      
      private function method_2895(param1:ChatUpdateEvent) : void
      {
         this.method_2889();
      }
      
      private function method_2894(param1:ChatUpdateEvent) : void
      {
         this.method_2890(this.var_3116 == null);
      }
      
      private function method_2890(param1:Boolean) : void
      {
         var _loc2_:String = "";
         if(this.var_3122 != "" && this.var_3119 == MessageType.USER && this.var_3124)
         {
            _loc2_ += " (" + this.var_3122 + ")";
         }
         else
         {
            this.var_3115.method_2570("");
         }
         if(param1)
         {
            _loc2_ += ":";
         }
         if(_loc2_.length != 0)
         {
            this.var_3115.method_2570(_loc2_);
         }
         if(param1)
         {
            this.var_3117 = this.var_3115.width + 2;
         }
         else
         {
            this.var_3117 = this.var_3115.width + 6;
         }
      }
      
      private function method_2889() : void
      {
         this.var_3116.method_2570(":");
         this.var_3116.x = this.var_3115.x + this.var_3115.width + 14;
         this.var_3117 += this.var_3116.width + 11;
         this.var_3118.x = this.var_3115.x + this.var_3115.width - 1;
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:class_150 = null;
         var _loc3_:BitmapData = null;
         var _loc4_:int = 0;
         this._width = int(param1);
         if(this.var_3117 > this._width / 2 && this.var_3114.text.length * 8 > this._width - this.var_3117)
         {
            this.var_3114.y = 19;
            this.var_3114.x = 0;
            this.var_3114.width = this._width - 5;
            _loc4_ = 21;
         }
         else
         {
            this.var_3114.x = this.var_3117;
            this.var_3114.y = 0;
            this.var_3114.width = this._width - this.var_3117 - 5;
            this.var_3114.height = 20;
         }
         this.var_1445.bitmapData = new BitmapData(1,Math.max(int(this.var_3114.textHeight + 7.5 + _loc4_),19),true,0);
         _loc2_ = this._self ? new name_2741() : new name_3008();
         if(this.var_3121 || this._self)
         {
            _loc2_.width = this._width;
            _loc2_.height = Math.max(int(this.var_3114.textHeight + 5.5 + _loc4_),19);
            _loc2_.y = 2;
            _loc2_.graphics.beginFill(0,0);
            _loc2_.graphics.drawRect(0,0,2,2);
            _loc2_.graphics.endFill();
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height + 2,true,0);
            _loc3_.draw(_loc2_);
            this.var_1445.bitmapData = _loc3_;
         }
      }
      
      public function set light(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         if(this.var_3119 != MessageType.USER)
         {
            return;
         }
         this.var_3121 = param1;
         if(this.var_3121)
         {
            _loc2_ = 5898034;
         }
         else
         {
            _loc2_ = 1244928;
         }
         if(this.var_3115 != null)
         {
            this.var_3115.name_2046(_loc2_);
         }
         if(this.var_3116 != null)
         {
            this.var_3116.name_2046(_loc2_);
            this.var_3118.color = _loc2_;
         }
         this.width = this._width;
      }
      
      public function set self(param1:Boolean) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         if(this.var_3119 != MessageType.USER)
         {
            return;
         }
         this._self = param1;
         if(this._self)
         {
            _loc3_ = TankWindowInner.GREEN;
            _loc2_ = TankWindowInner.GREEN;
         }
         else
         {
            _loc2_ = 1244928;
            _loc3_ = 16777215;
         }
         if(this.var_3115 != null)
         {
            this.var_3115.name_2046(_loc2_,this._self);
         }
         if(this.var_3116 != null)
         {
            this.var_3116.name_2046(_loc2_);
            this.var_3118.color = _loc2_;
         }
         this.var_3114.color = _loc3_;
         this.width = this._width;
      }
      
      public function set method_2892(param1:Boolean) : void
      {
         this.var_3124 = param1;
         if(this.var_3115 != null)
         {
            this.method_2890(this.var_3116 == null);
         }
         if(this.var_3116 != null)
         {
            this.method_2889();
         }
         this.width = this._width;
      }
      
      public function get userName() : String
      {
         return this.var_385;
      }
      
      public function get method_2893() : String
      {
         return this.var_3123;
      }
      
      private function method_2891(param1:MessageType) : uint
      {
         switch(param1)
         {
            case MessageType.SYSTEM:
               return 8454016;
            case MessageType.WARNING:
               return 16776960;
            default:
               return 16777215;
         }
      }
   }
}
