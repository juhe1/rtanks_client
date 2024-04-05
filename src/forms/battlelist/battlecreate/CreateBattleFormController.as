package forms.battlelist.battlecreate
{
   import assets.icons.BattleInfoIcons;
   import controls.checkbox.name_2018;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import forms.battlelist.BattleMode;
   import forms.battlelist.MapTheme;
   import forms.battlelist.name_2270;
   import package_1.Main;
   import package_13.Long;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_412.name_2264;
   import package_413.name_2265;
   import package_413.name_2283;
   import package_414.name_2273;
   import package_54.name_102;
   import package_95.name_298;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.name_390;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class CreateBattleFormController extends EventDispatcher implements IResourceLoadingListener
   {
      
      public static var storageService:name_298 = Main.osgi.name_6(name_298) as name_298;
      
      public static var userPropertiesService:PanelModel = Main.osgi.name_6(name_115) as PanelModel;
      
      public static var var_2421:BattleFormatUtil = Main.osgi.name_6(BattleFormatUtil) as BattleFormatUtil;
      
      public static var localeService:name_102 = Main.osgi.name_6(name_102) as name_102;
      
      private static const const_2272:int = 60;
      
      private static const const_2270:int = 0;
      
      private static const const_2264:int = 31;
      
      private static const const_2271:int = 1;
      
      private static const const_2267:int = 1;
      
      private static const const_2268:int = 2;
      
      private static const const_2269:int = 1;
      
      private static const const_2266:int = 1;
      
      private static const const_2265:int = 10;
      
      private static const const_2263:int = 10;
       
      
      private var var_2957:Vector.<name_2264>;
      
      private var var_2955:Vector.<int>;
      
      private var var_2956:int = 1800;
      
      private var var_2954:int;
      
      private var var_2949:BattleMode;
      
      private var var_2948:CreateBattleFormView;
      
      private var var_2951:Dictionary;
      
      private var var_2950:int = -1;
      
      private var var_2952:Array;
      
      private var var_2953:Array;
      
      private var var_2902:String;
      
      private var var_2958:Boolean;
      
      public var name_2284:name_2273;
      
      public function CreateBattleFormController(param1:name_2273, param2:Array)
      {
         this.var_2949 = BattleMode.DM;
         this.var_2951 = new Dictionary();
         super();
         this.name_2284 = param1;
         this.var_2948 = new CreateBattleFormView(this);
         this.init(param2);
      }
      
      public static function method_2322(param1:int) : DisplayObject
      {
         var _loc2_:BattleInfoIcons = new BattleInfoIcons();
         _loc2_.type = param1;
         return _loc2_;
      }
      
      private function init(param1:Array) : void
      {
         this.var_2957 = this.name_2284.battlesLimits;
         this.var_2955 = new Vector.<int>(BattleMode.method_393.length);
         this.var_2948.name_2972(this.name_2284.maxRangeLength - 1);
         this.var_2948.name_2956(1,31,1);
         this.var_2948.name_2993();
         this.var_2948.name_2984(this.method_2767());
         this.method_2771(param1);
      }
      
      private function method_2771(param1:Array) : void
      {
         var _loc6_:Vector.<BattleMode> = null;
         var _loc2_:name_2270 = null;
         var _loc3_:name_2944 = null;
         this.var_2952 = new Array();
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = param1[_loc5_] as name_2270;
            _loc3_ = new name_2944();
            _loc3_.index = _loc5_;
            _loc3_.id = _loc2_.id as String;
            _loc3_.name_2953 = _loc2_.preview;
            _loc3_.gameName = _loc2_.gameName;
            _loc3_.maxPeople = _loc2_.maxPeople;
            _loc3_.maxRank = _loc2_.maxRank;
            _loc3_.minRank = _loc2_.minRank;
            _loc3_.themeName = _loc2_.themeName;
            _loc3_.theme = _loc2_.theme;
            _loc6_ = new Vector.<BattleMode>();
            _loc6_.push(BattleMode.DM);
            if(_loc2_.tdm)
            {
               _loc6_.push(BattleMode.TDM);
            }
            if(_loc2_.ctf)
            {
               _loc6_.push(BattleMode.CTF);
            }
            if(_loc2_.dom)
            {
               _loc6_.push(BattleMode.CP);
            }
            _loc3_.battleModes = _loc6_;
            _loc3_.enabled = true;
            _loc3_.name_2950 = MapTheme.SUMMER;
            this.var_2952.push(_loc3_);
            _loc5_++;
         }
      }
      
      public function method_2776() : void
      {
         this.var_2954 = this.var_2948.name_2980();
      }
      
      public function method_2781() : void
      {
         this.var_2956 = this.var_2948.name_2952() * 60;
         this.method_2758();
      }
      
      public function method_2773() : void
      {
         this.var_2955[this.var_2949.value] = this.var_2948.name_2954();
         this.method_2758();
      }
      
      public function method_2755(param1:BattleMode) : void
      {
         var _loc2_:int = 0;
         this.var_2949 = param1;
         var _loc3_:int = this.var_2957[this.var_2949.value].timeLimitInSec;
         if(this.var_2956 > _loc3_)
         {
            this.var_2956 = _loc3_;
         }
         this.var_2948.name_2977(this.var_2949);
         if(this.var_2949 == BattleMode.DM)
         {
            this.var_2954 = int(this.method_2749().maxPeople);
            _loc2_ = 2;
         }
         else
         {
            this.var_2954 = int(this.method_2749().maxPeople) / 2;
            _loc2_ = 1;
         }
         this.var_2948.name_2985(_loc2_,this.var_2954);
         this.var_2948.name_2987(0,_loc3_ / 60,this.var_2956 / 60);
         var _loc4_:int = this.var_2957[this.var_2949.value].scoreLimit;
         this.var_2955[this.var_2949.value] = this.method_218(this.var_2955[this.var_2949.value],0,_loc4_);
         var _loc5_:int = this.var_2955[this.var_2949.value];
         switch(this.var_2949)
         {
            case BattleMode.DM:
               this.var_2948.name_2947(_loc4_,_loc5_,1,name_1663.method_2452,method_2322(BattleInfoIcons.name_2338));
               this.var_2948.name_2969();
               break;
            case BattleMode.TDM:
               this.var_2948.name_2947(_loc4_,_loc5_,1,name_1663.method_2452,method_2322(BattleInfoIcons.name_2338));
               this.var_2948.name_2951();
               break;
            case BattleMode.CTF:
               this.var_2948.name_2947(_loc4_,_loc5_,1,name_1663.method_2422,method_2322(BattleInfoIcons.CTF));
               this.var_2948.name_2951();
               break;
            case BattleMode.CP:
               this.var_2948.name_2947(_loc4_,_loc5_,10,name_1663.method_2451,method_2322(BattleInfoIcons.CTF));
               this.var_2948.name_2951();
         }
         this.var_2948.name_2959();
      }
      
      private function method_218(param1:int, param2:int, param3:int) : int
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public function method_2769() : void
      {
         this.method_2760();
         this.method_2753();
      }
      
      public function method_2775() : void
      {
         this.var_2902 = this.var_2948.name_2948().themeName;
         this.method_2753();
      }
      
      private function method_2753() : void
      {
         this.method_2770();
         this.method_2761();
         this.method_2764(this.var_2949);
         this.method_2772();
         this.method_2768();
      }
      
      private function method_2768() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:name_2944 = this.method_2749();
         var _loc3_:ImageResource = _loc2_.name_2953;
         if(_loc3_ == null)
         {
            this.var_2948.name_2949.name_1550(null);
            return;
         }
         if(!_loc3_.isLoaded)
         {
            this.var_2948.name_2949.name_1550(null);
            _loc3_.loadLazyResource(this);
         }
         else
         {
            _loc1_ = _loc3_.data;
            this.var_2948.name_2949.name_1550(_loc1_);
         }
      }
      
      public function destroy() : void
      {
         this.var_2948.destroy();
         this.var_2948 = null;
      }
      
      public function name_2285() : void
      {
         this.var_2958 = true;
         if(this.var_2950 != userPropertiesService.rank)
         {
            this.var_2950 = userPropertiesService.rank;
            if(this.var_2950 < 1)
            {
               this.var_2950 = 1;
            }
            this.var_2948.name_2986(this.var_2950);
            this.method_2766();
            this.method_2765();
         }
         this.var_2948.show();
      }
      
      public function name_2286() : void
      {
         this.var_2958 = false;
         this.var_2948.hide();
      }
      
      private function method_2758() : void
      {
         if(this.method_2756())
         {
            this.var_2948.name_2973();
         }
         else
         {
            this.var_2948.name_2992();
         }
      }
      
      private function method_2756() : Boolean
      {
         return this.var_2948.name_2952() != 0 || this.var_2948.name_2954() != 0;
      }
      
      private function method_2761() : void
      {
         this.var_2948.name_2965(this.method_2749().battleModes);
      }
      
      private function method_2770() : void
      {
         var _loc1_:name_2944 = this.method_2749();
         var _loc2_:name_2265 = this.name_2284.maxRange;
         var _loc3_:int = Math.max(_loc2_.min,_loc1_.minRank);
         var _loc4_:int = Math.min(_loc2_.max,_loc1_.maxRank);
         this.var_2948.name_2956(_loc3_,_loc4_,1);
         var _loc5_:name_2265 = this.name_2284.defaultRange;
         this.var_2948.name_2997(Math.max(_loc5_.min,this.var_2948.name_2964()));
         this.var_2948.name_2975(Math.min(_loc5_.max,this.var_2948.name_2970()));
      }
      
      private function method_2760() : void
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:* = null;
         var _loc4_:name_2945 = null;
         var _loc5_:name_2944 = null;
         var _loc6_:name_2944 = null;
         var _loc7_:Object = null;
         var _loc8_:String = String(this.var_2948.name_2946().gameName);
         var _loc9_:Dictionary = this.var_2951[_loc8_];
         if(_loc9_ != null)
         {
            _loc1_ = new Array();
            _loc2_ = null;
            for(_loc3_ in _loc9_)
            {
               _loc6_ = this.var_2951[_loc8_][_loc3_];
               if(this.var_2950 >= _loc6_.minRank && this.var_2950 <= _loc6_.maxRank)
               {
                  _loc1_.push({
                     "gameName":_loc3_,
                     "id":_loc6_.id,
                     "rang":0,
                     "theme":_loc6_.theme
                  });
               }
               if(_loc6_.name_2950 != null && _loc6_.name_2950.name == _loc6_.theme.name)
               {
                  _loc2_ = _loc3_;
               }
            }
            _loc1_.sortOn(["gameName"]);
            this.var_2948.name_2989(_loc1_);
            _loc4_ = this.method_2754();
            if(_loc4_ != null && _loc4_.selectedThemes != null && _loc4_.selectedThemes[_loc8_] != null)
            {
               this.var_2902 = _loc4_.selectedThemes[_loc8_];
            }
            else if(_loc2_ != null)
            {
               this.var_2902 = _loc2_;
            }
            _loc5_ = this.var_2951[this.var_2948.name_2946().gameName][this.var_2902];
            if(this.var_2902 != null && this.method_2757(_loc5_))
            {
               this.var_2948.name_2995("themeName",this.var_2902);
            }
            else
            {
               _loc7_ = this.var_2948.name_2948();
               this.var_2902 = _loc7_ != null ? String(_loc7_.themeName) : null;
            }
            if(_loc1_.length > 1)
            {
               this.var_2948.name_2974();
            }
            else
            {
               this.var_2948.name_2991();
            }
         }
      }
      
      private function method_2757(param1:name_2944) : Boolean
      {
         return param1 != null && param1.enabled && this.var_2950 >= param1.minRank && this.var_2950 <= param1.maxRank;
      }
      
      private function method_2749() : name_2944
      {
         return name_2944(this.var_2951[this.var_2948.name_2946().gameName][this.var_2902]);
      }
      
      private function method_2766() : void
      {
         var _loc1_:name_2944 = null;
         this.var_2951 = new Dictionary();
         this.var_2953 = new Array();
         for each(_loc1_ in this.var_2952)
         {
            if(_loc1_.enabled && this.var_2950 <= _loc1_.maxRank)
            {
               if(this.var_2951[_loc1_.gameName] == null)
               {
                  this.var_2951[_loc1_.gameName] = new Dictionary();
                  _loc1_.currentRank = this.var_2950 >= _loc1_.minRank ? int(0) : int(_loc1_.minRank);
                  this.var_2953.push(_loc1_);
               }
               this.var_2951[_loc1_.gameName][_loc1_.themeName] = _loc1_;
            }
         }
         if(this.var_2953.length != 0)
         {
            this.var_2953.sortOn(["currentRank","gameName"],[Array.NUMERIC,null]);
            this.var_2948.name_2976(this.var_2953);
            return;
         }
         throw new ArgumentError("For your rank is not available maps");
      }
      
      private function method_2765() : void
      {
         var _loc1_:String = null;
         var _loc2_:name_2945 = this.method_2754();
         var _loc3_:name_2944 = this.method_2763(_loc2_.mapId,_loc2_.themeName);
         if(this.method_2757(_loc3_))
         {
            _loc1_ = _loc3_.gameName;
            this.var_2902 = _loc3_.themeName;
         }
         else
         {
            _loc1_ = String(this.var_2953[0].gameName);
            this.var_2902 = this.var_2953[0].themeName;
         }
         this.var_2948.name_2998("gameName",_loc1_);
         this.method_2769();
      }
      
      private function method_2763(param1:Long, param2:String) : name_2944
      {
         var _loc3_:int = int(this.var_2952.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.var_2952[_loc4_].id == param1 && this.var_2952[_loc4_].themeName == param2)
            {
               return this.var_2952[_loc4_];
            }
            _loc4_++;
         }
         return null;
      }
      
      private function method_2754() : name_2945
      {
         var _loc1_:name_2945 = new name_2945();
         var _loc2_:SharedObject = storageService.getStorage();
         var _loc3_:Vector.<Object> = _loc2_.data.SelectedMap != null && _loc2_.data.SelectedMap is Vector.<Object> ? _loc2_.data.SelectedMap as Vector.<Object> : new Vector.<Object>();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].userName == userPropertiesService.userName)
            {
               _loc1_.mapId = Long.getLong(int(_loc3_[_loc4_].mapIdHigh),int(_loc3_[_loc4_].mapIdLow));
               _loc1_.themeName = _loc3_[_loc4_].mapTheme;
               _loc1_.selectedThemes = _loc3_[_loc4_].selectedThemes;
               break;
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function method_2772() : void
      {
         var _loc1_:Object = null;
         var _loc2_:SharedObject = storageService.getStorage();
         var _loc3_:Vector.<Object> = _loc2_.data.SelectedMap != null && _loc2_.data.SelectedMap is Vector.<Object> ? _loc2_.data.SelectedMap as Vector.<Object> : new Vector.<Object>();
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            if(_loc3_[_loc5_].userName == userPropertiesService.userName)
            {
               _loc4_ = _loc5_;
               break;
            }
            _loc5_++;
         }
         var _loc6_:name_2944 = this.method_2749();
         if(_loc4_ != -1)
         {
            _loc1_ = _loc3_[_loc4_];
         }
         else
         {
            _loc1_ = new Object();
            _loc1_.userName = userPropertiesService.userName;
            _loc3_.push(_loc1_);
         }
         _loc1_.mapId = _loc6_.id;
         _loc1_.mapTheme = _loc6_.themeName;
         if(_loc1_.selectedThemes == null)
         {
            _loc1_.selectedThemes = new Object();
         }
         _loc1_.selectedThemes[_loc6_.id] = _loc6_.themeName;
         _loc2_.data.SelectedMap = _loc3_;
      }
      
      private function method_2764(param1:BattleMode) : void
      {
         if(this.method_2762(param1))
         {
            this.method_2755(param1);
         }
         else
         {
            this.method_2755(this.method_2749().battleModes[0]);
         }
      }
      
      private function method_2762(param1:BattleMode) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Vector.<BattleMode> = this.method_2749().battleModes;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] == param1)
            {
               _loc2_ = true;
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      public function method_1977() : void
      {
         var _loc1_:name_2283 = null;
         if(this.method_2756())
         {
            _loc1_ = new name_2283();
            _loc1_.battleMode = this.var_2949;
            _loc1_.limits = new name_2264(this.var_2948.name_2954(),this.var_2948.name_2952() * 60);
            _loc1_.mapId = this.var_2948.name_2948().id;
            _loc1_.theme = this.var_2948.name_2948().theme;
            _loc1_.mapName = this.var_2948.name_2946().gameName;
            _loc1_.maxPeopleCount = this.var_2954;
            _loc1_.rankRange = new name_2265(this.var_2948.name_2994(),this.var_2948.name_2983());
            _loc1_.proBattle = true;
            _loc1_.privateBattle = this.var_2948.name_2979;
            _loc1_.withoutSupplies = this.var_2948.name_2966;
            _loc1_.withoutUpgrades = this.var_2948.name_2955;
            _loc1_.withoutBonuses = this.var_2948.name_2982;
            _loc1_.goldBoxesEnabled = this.var_2948.name_2961;
            _loc1_.autoBalance = this.var_2948.name_2968;
            _loc1_.friendlyFire = this.var_2948.name_2967;
            _loc1_.reArmorEnabled = this.var_2948.name_2958;
            _loc1_.equipmentConstraintsMode = this.method_2751();
            _loc1_.parkourMode = this.method_2750();
            _loc1_.clanBattle = this.var_2948.name_2963;
            dispatchEvent(new CreateBattleEvent(_loc1_));
            this.name_2286();
         }
      }
      
      private function method_2750() : Boolean
      {
         return this.var_2948.name_2957().parkour;
      }
      
      private function method_2751() : String
      {
         return this.var_2948.name_2957().equipmentConstraintsMode;
      }
      
      private function method_2767() : Vector.<Object>
      {
         var _loc1_:Object = null;
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         var _loc3_:int = 0;
         _loc2_.push({
            "index":_loc3_++,
            "gameName":localeService.getText(name_390.const_1049),
            "equipmentConstraintsMode":null,
            "parkour":false,
            "rang":0
         });
         for each(_loc1_ in var_2421.method_1739())
         {
            _loc2_.push({
               "index":_loc3_++,
               "gameName":_loc1_.name,
               "equipmentConstraintsMode":_loc1_.mode,
               "parkour":false,
               "rang":0
            });
         }
         _loc2_.push({
            "index":_loc3_,
            "gameName":var_2421.method_1736(),
            "equipmentConstraintsMode":null,
            "parkour":true,
            "rang":0
         });
         return _loc2_;
      }
      
      public function method_2774(param1:Event) : void
      {
         if(this.method_2750())
         {
            this.var_2948.name_2988();
         }
         else if(this.method_2751() != null)
         {
            this.var_2948.name_2971();
            this.var_2948.name_2990();
            this.var_2948.name_2996();
         }
         this.var_2948.name_2959();
      }
      
      public function method_2777(param1:Event) : void
      {
         if(!this.var_2948.name_2955 || !this.var_2948.name_2962)
         {
            this.method_2759();
         }
      }
      
      public function method_2779() : void
      {
         if(this.var_2948.name_2958)
         {
            this.method_2759();
         }
      }
      
      private function method_2759() : void
      {
         if(!this.method_2750())
         {
            this.method_2752();
         }
      }
      
      public function method_2778(param1:name_2018) : void
      {
         if(this.var_2948.name_2981 && this.method_2750())
         {
            this.method_2752();
         }
      }
      
      private function method_2752() : void
      {
         this.var_2948.name_2960(0);
      }
      
      public function method_2780(param1:name_2018) : void
      {
         if(this.var_2948.name_2978() && this.method_2751() != null)
         {
            this.var_2948.name_2960(0);
         }
      }
      
      public function onResourceLoadingComplete(param1:Resource) : void
      {
         var _loc2_:BitmapData = ImageResource(param1).data;
         var _loc3_:name_2944 = this.method_2749();
         if(param1.id == _loc3_.name_2953.id)
         {
            this.var_2948.name_2949.name_1550(_loc2_);
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
   }
}
