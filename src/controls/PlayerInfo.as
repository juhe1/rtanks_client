package controls
{
   import controls.panel.name_873;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import package_1.Main;
   import package_25.name_353;
   import package_25.name_52;
   import package_54.name_102;
   
   public class PlayerInfo extends Sprite
   {
      
      public static var clanUserInfoService:name_52;
       
      
      private const const_55:uint = 1244928;
      
      private const const_56:uint = 16728064;
      
      private var var_280:String;
      
      private var var_277:int;
      
      private var var_275:int = 0;
      
      private var var_283:int = 0;
      
      private var var_274:int = 0;
      
      private var var_287:int;
      
      private var var_288:Number;
      
      private var var_273:Number = 0;
      
      private var var_286:int = 0;
      
      private var _position:int;
      
      private var var_281:int = 5000;
      
      private var var_282:int = 7500;
      
      private var var_279:int = 6000;
      
      private var var_285:int = 0;
      
      private var var_276:int = 0;
      
      public var var_270:name_873;
      
      private var var_272:Array;
      
      private var var_278:Array;
      
      private var var_284:Number = 0.02;
      
      private var _width:int;
      
      private var var_271:name_871;
      
      public function PlayerInfo()
      {
         this.var_270 = new name_873();
         this.var_271 = new name_871();
         this.var_272 = new Array();
         this.var_278 = new Array();
         super();
         addChild(this.var_270);
         this.var_271.y = this.var_270.y + 4;
         addChild(this.var_271);
         this.var_270.removeChild(this.var_270.name_875);
         addEventListener(Event.ADDED_TO_STAGE,this.configUI);
      }
      
      public function get playerName() : String
      {
         return this.var_280;
      }
      
      public function set playerName(param1:String) : void
      {
         var _loc2_:name_353 = clanUserInfoService.method_373(param1);
         var _loc3_:String = "";
         if(_loc2_ != null && _loc2_.name_870)
         {
            _loc3_ = "[" + _loc2_.clanTag + "] ";
         }
         this.var_280 = _loc3_ + param1;
         this.name_239();
      }
      
      public function get rank() : int
      {
         return this.var_277;
      }
      
      public function set rank(param1:int) : void
      {
         this.var_277 = param1;
         this.name_239();
      }
      
      public function updateScore(param1:int, param2:int) : void
      {
         if(param1 != this.var_275 && this.var_275 != 0)
         {
            this.method_389(this.var_270.name_872,param1 > this.var_275 ? uint(1244928) : uint(16728064));
         }
         this.var_275 = param1;
         this.var_283 = param2;
         this.name_239();
      }
      
      public function get progress() : int
      {
         return this.var_274;
      }
      
      public function set progress(param1:int) : void
      {
         if(this.var_274 == 0)
         {
            this.var_274 = param1;
         }
         else
         {
            this.var_287 = param1;
            this.var_274 = param1;
            this.var_270.name_880 = param1;
         }
         this.name_239();
      }
      
      public function get rating() : Number
      {
         return this.var_273;
      }
      
      public function set rating(param1:Number) : void
      {
         if(int(param1) != this.var_273 && this.var_273 != 0)
         {
            this.method_389(this.var_270.name_881,int(param1) > this.var_273 ? uint(1244928) : uint(16728064));
         }
         this.var_273 = int(param1);
         this.name_239();
      }
      
      public function get ratingChange() : int
      {
         return this.var_273;
      }
      
      public function set ratingChange(param1:int) : void
      {
         this.var_286 = param1;
         this.name_239();
      }
      
      public function get position() : int
      {
         return this._position;
      }
      
      public function set position(param1:int) : void
      {
         if(param1 != this._position && this._position != 0)
         {
            this.method_389(this.var_270.name_879,param1 > this._position ? uint(16728064) : uint(1244928));
         }
         this._position = param1;
         this.name_239();
      }
      
      public function get shield() : int
      {
         return this.var_281;
      }
      
      public function set shield(param1:int) : void
      {
         this.var_281 = param1;
         this.name_239();
      }
      
      public function get weapon() : int
      {
         return this.var_282;
      }
      
      public function set weapon(param1:int) : void
      {
         this.var_282 = param1;
         this.name_239();
      }
      
      public function get engine() : int
      {
         return this.var_279;
      }
      
      public function set engine(param1:int) : void
      {
         this.var_279 = param1;
         this.name_239();
      }
      
      public function get money() : int
      {
         return this.var_285;
      }
      
      public function set money(param1:int) : void
      {
      }
      
      public function get crystals() : int
      {
         return this.var_279;
      }
      
      public function set crystals(param1:int) : void
      {
         if(param1 != this.var_276 && this.var_276 != 0)
         {
            this.method_389(this.var_270.name_874,param1 > this.var_276 ? uint(1244928) : uint(16728064));
         }
         this.var_276 = param1;
         this.name_239();
      }
      
      private function configUI(param1:Event) : void
      {
         this.var_270.x = 59;
         removeEventListener(Event.ADDED_TO_STAGE,this.configUI);
      }
      
      private function name_239() : void
      {
         var _loc1_:name_102 = Main.osgi.getService(name_102) as name_102;
         this.var_270.name_872.text = String(this.var_275) + " / " + String(this.var_283) + "   " + Rank.name(this.var_277) + " " + this.var_280;
         this.var_270.progress = this.var_274;
         this.var_271.name_877(Math.floor(Math.random() * 100000));
         this.var_270.name_878.visible = false;
         this.var_270.name_874.text = Money.name_876(this.var_276,false);
         this.width = this._width;
      }
      
      private function method_389(param1:Label, param2:uint = 16711680) : void
      {
         this.var_272[param1.name] = 1;
         this.var_278[param1.name] = param2;
         param1.addEventListener(Event.ENTER_FRAME,this.method_390);
      }
      
      private function method_390(param1:Event) : void
      {
         var _loc2_:Label = param1.target as Label;
         var _loc3_:GlowFilter = new GlowFilter(this.var_278[_loc2_.name],this.var_272[_loc2_.name],4,4,3,1,false);
         _loc2_.filters = [_loc3_];
         this.var_272[_loc2_.name] -= this.var_284;
         if(this.var_272[_loc2_.name] < 0)
         {
            _loc2_.filters = [];
            _loc2_.removeEventListener(Event.ENTER_FRAME,this.method_390);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.var_270.width = param1;
         this.var_271.x = this.var_270.x + this.var_270.C1.x + 20 - this.var_271.width - 18;
         this.var_271.visible = this.var_271.x > this.var_270.x + this.var_270.name_872.textWidth + 10;
      }
   }
}
