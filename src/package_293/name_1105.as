package package_293
{
   import alternativa.tanks.models.battlefield.name_370;
   import assets.icons.BattleInfoIcons;
   import controls.resultassets.name_2332;
   import flash.display.Sprite;
   import flash.events.Event;
   import package_1.Main;
   import package_291.name_1099;
   import package_291.name_1124;
   import package_47.BattleTeamType;
   
   public class name_1105 extends Sprite
   {
       
      
      private const const_1716:int = 1;
      
      private const const_1715:int = 3;
      
      private const const_1717:int = 30;
      
      private var var_1909:int;
      
      private var scoreLimit:int;
      
      private var fund:int;
      
      private var var_1910:name_370;
      
      private var var_1912:Vector.<name_1099>;
      
      private var var_1903:name_2336;
      
      private var var_1907:name_1424;
      
      private var var_1908:name_2334;
      
      private var var_1906:name_2333;
      
      private var var_1904:name_2335;
      
      private var var_1901:CTFScoreIndicator;
      
      private var var_1905:DOMScoreIndicator;
      
      private var var_1902:Sprite;
      
      private var var_429:String;
      
      private var var_1911:name_2332;
      
      public function name_1105(param1:String, param2:name_1124, param3:Vector.<name_1099>, param4:name_370)
      {
         super();
         this.var_1912 = param3;
         this.var_1910 = param4;
         this.var_429 = param1;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         this.method_2064(param2);
      }
      
      public function set timeLimit(param1:int) : void
      {
         this.var_1909 = param1;
      }
      
      public function method_633(param1:BattleTeamType) : void
      {
         if(this.var_1901 != null)
         {
            this.var_1901.name_2346(param1);
         }
      }
      
      public function method_628(param1:BattleTeamType) : void
      {
         if(this.var_1901 != null)
         {
            this.var_1901.name_2344(param1);
         }
      }
      
      public function method_635(param1:BattleTeamType) : void
      {
         if(this.var_1901 != null)
         {
            this.var_1901.name_2343(param1);
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.name_1125();
         this.onResize(null);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function method_2064(param1:name_1124) : void
      {
         var _loc2_:int = 0;
         if(param1.scoreLimit > 0 || param1.timeLimit > 0)
         {
            this.var_1909 = param1.timeLimit;
            this.scoreLimit = param1.scoreLimit;
            this.fund = param1.fund;
            this.var_1902 = new Sprite();
            this.var_1911 = new name_2332();
            this.var_1902.addChild(this.var_1911);
            this.var_1908 = new name_2334(BattleInfoIcons.name_2347);
            this.var_1902.addChild(this.var_1908);
            this.var_1908.name_2337(this.fund);
            _loc2_ = this.var_1910 == name_370.DOM ? 10 : (this.var_1910 == name_370.CTF ? BattleInfoIcons.CTF : BattleInfoIcons.name_2338);
            if(this.scoreLimit > 0)
            {
               this.var_1903 = new name_2336(this.method_2063(),_loc2_,WinkManager.instance);
               this.var_1903.value = this.scoreLimit;
               this.var_1902.addChild(this.var_1903);
            }
            if(this.var_1909 > 0)
            {
               this.var_1907 = new name_1424(30,BattleInfoIcons.name_2345,WinkManager.instance,false);
               this.var_1907.name_1429(param1.timeLeft);
               this.var_1902.addChild(this.var_1907);
            }
            addChild(this.var_1902);
         }
         switch(this.var_1910)
         {
            case name_370.DM:
               this.var_1906 = new name_2333(BattleInfoIcons.name_2338);
               addChild(this.var_1906);
               break;
            case name_370.TDM:
               this.var_1904 = new name_2335();
               this.name_1120(BattleTeamType.BLUE,param1.blueScore);
               this.name_1120(BattleTeamType.RED,param1.redScore);
               addChild(this.var_1904);
               break;
            case name_370.CTF:
               this.var_1901 = new CTFScoreIndicator();
               this.name_1120(BattleTeamType.BLUE,param1.blueScore);
               this.name_1120(BattleTeamType.RED,param1.redScore);
               addChild(this.var_1901);
               break;
            case name_370.DOM:
               this.var_1905 = new DOMScoreIndicator();
               this.name_1120(BattleTeamType.BLUE,param1.blueScore);
               this.name_1120(BattleTeamType.RED,param1.redScore);
               addChild(this.var_1905);
         }
         this.onResize(null);
      }
      
      public function name_1110(param1:name_1099) : void
      {
         if(this.var_1903 != null && this.var_1910 != name_370.CTF && param1.kills >= this.scoreLimit - this.method_2063())
         {
            this.var_1903.name_2341();
         }
         if(this.var_1906 != null && param1.userId == this.var_429)
         {
            this.var_1906.score = param1.kills;
         }
         this.name_1125();
      }
      
      public function name_1120(param1:BattleTeamType, param2:int) : void
      {
         if(this.var_1904 != null)
         {
            this.var_1904.name_1120(param1,param2);
         }
         else if(this.var_1905 != null)
         {
            this.var_1905.name_1120(param1,param2);
         }
         else
         {
            this.var_1901.name_1120(param1,param2);
         }
         if(this.scoreLimit > 0 && param2 >= this.scoreLimit - this.method_2063())
         {
            this.var_1903.name_2341();
         }
         this.name_1125();
      }
      
      public function name_1122(param1:int) : void
      {
         if(Boolean(this.var_1908))
         {
            this.var_1908.name_2337(param1);
            this.name_1125();
         }
      }
      
      public function name_1118() : void
      {
         this.name_1122(0);
         if(this.scoreLimit > 0)
         {
            this.var_1903.value = this.scoreLimit;
         }
         if(this.var_1909 > 0)
         {
            this.var_1907.name_1429(this.var_1909);
         }
         if(this.var_1906 != null)
         {
            this.var_1906.score = 0;
         }
         if(this.var_1904 != null)
         {
            this.var_1904.name_2340(0,0);
         }
         if(this.var_1905 != null)
         {
            this.var_1905.name_2340(0,0);
         }
         if(this.var_1901 != null)
         {
            this.var_1901.name_2342(0,0);
         }
         this.name_1125();
      }
      
      public function finish() : void
      {
         if(this.scoreLimit > 0)
         {
            this.var_1903.name_2339();
         }
         if(this.var_1909 > 0)
         {
            this.var_1907.value = 0;
            this.var_1907.name_2339();
         }
         this.name_1125();
      }
      
      public function name_1125() : void
      {
         var _loc1_:Number = NaN;
         if(Boolean(this.var_1911))
         {
            _loc1_ = 0;
            this.var_1908.x = 14;
            this.var_1908.y = 11;
            _loc1_ = this.var_1908.width + this.var_1908.x;
            if(Boolean(this.var_1903))
            {
               this.var_1903.x = _loc1_ + 6;
               this.var_1903.y = 11;
               _loc1_ = this.var_1903.width + this.var_1903.x;
            }
            if(Boolean(this.var_1907))
            {
               this.var_1907.x = _loc1_ + 10;
               this.var_1907.y = 11;
               _loc1_ = this.var_1907.width + this.var_1907.x;
            }
            this.var_1911.width = 12 + _loc1_;
            this.onResize(null);
         }
      }
      
      private function onResize(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(this.var_1906 != null)
         {
            this.var_1906.y = Main.stage.stageHeight - this.var_1906.height - 10;
            this.var_1906.x = Main.stage.stageWidth - this.var_1906.width - 10;
            _loc2_ = this.var_1906.x;
         }
         if(this.var_1904 != null)
         {
            this.var_1904.y = Main.stage.stageHeight - this.var_1904.height - 10;
            this.var_1904.x = Main.stage.stageWidth - this.var_1904.width - 10;
            _loc2_ = this.var_1904.x;
         }
         if(this.var_1905 != null)
         {
            this.var_1905.y = Main.stage.stageHeight - this.var_1905.height - 10;
            this.var_1905.x = Main.stage.stageWidth - this.var_1905.width - 10;
            _loc2_ = this.var_1905.x;
         }
         if(this.var_1901 != null)
         {
            this.var_1901.y = Main.stage.stageHeight - this.var_1901.height - 10;
            this.var_1901.x = Main.stage.stageWidth - this.var_1901.width - 10;
            _loc2_ = this.var_1901.x;
         }
         if(Boolean(this.var_1902))
         {
            this.var_1902.y = Main.stage.stageHeight - this.var_1902.height - 10;
            this.var_1902.x = _loc2_ - this.var_1902.width - 10;
         }
      }
      
      public function name_1127() : int
      {
         return this.var_1902.x;
      }
      
      public function name_1113() : int
      {
         return this.var_1902.y;
      }
      
      private function method_2063() : int
      {
         return this.var_1910 == name_370.CTF ? 1 : 3;
      }
   }
}
