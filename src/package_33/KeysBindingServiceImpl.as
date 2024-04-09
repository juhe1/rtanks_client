package package_33
{
   import alternativa.osgi.OSGi;
   import flash.events.EventDispatcher;
   import flash.net.SharedObject;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import package_54.name_102;
   import package_95.IStorageService;
   
   public class KeysBindingServiceImpl extends EventDispatcher implements name_276
   {
      
      public static const const_1671:int = 3;
      
      public static const const_1670:uint = 0;
       
      
      private var storageService:IStorageService;
      
      private var var_1767:Dictionary;
      
      private var var_1768:Dictionary;
      
      private var var_1770:uint;
      
      private var var_1766:Dictionary;
      
      private var var_1769:KeyCodesConverter;
      
      public function KeysBindingServiceImpl()
      {
         this.var_1767 = new Dictionary();
         this.var_1768 = new Dictionary();
         this.var_1766 = new Dictionary();
         super();
         var _loc1_:name_102 = name_102(OSGi.getInstance().getService(name_102));
         this.storageService = IStorageService(OSGi.getInstance().getService(IStorageService));
         this.var_1770 = uint(Keyboard.Z);
         this.method_1951();
         this.method_1950();
      }
      
      private static function method_1946(param1:uint) : Boolean
      {
         return param1 == 0;
      }
      
      private static function method_1945() : Vector.<uint>
      {
         return new Vector.<uint>(3,true);
      }
      
      private function method_1949() : KeyCodesConverter
      {
         if(!this.var_1769)
         {
            this.var_1769 = new KeyCodesConverter();
         }
         return this.var_1769;
      }
      
      public function method_821(param1:uint) : Boolean
      {
         return this.var_1767[param1] == null;
      }
      
      public function method_820(param1:GameActionEnum, param2:uint, param3:int) : Boolean
      {
         var _loc4_:GameActionEnum = null;
         var _loc5_:Vector.<uint> = null;
         var _loc6_:int = 0;
         if(param3 >= 3)
         {
            return false;
         }
         if(!this.method_821(param2))
         {
            _loc4_ = this.var_1767[param2];
            _loc5_ = this.var_1768[_loc4_];
            _loc6_ = _loc5_.indexOf(param2);
            delete this.var_1767[param2];
            _loc5_[_loc6_] = 0;
            this.method_1947(_loc4_,_loc5_);
            dispatchEvent(new name_2243(name_2243.name_2245 + _loc4_.name,_loc4_));
         }
         var _loc7_:uint = this.method_819(param1,param3);
         if(!method_1946(_loc7_) && _loc7_ != param2)
         {
            delete this.var_1767[_loc7_];
         }
         this.var_1767[param2] = param1;
         this.var_1768[param1][param3] = param2;
         this.method_1947(param1,this.var_1768[param1]);
         return true;
      }
      
      private function method_1947(param1:GameActionEnum, param2:Vector.<uint> = null) : void
      {
         if(!param2)
         {
            param2 = method_1945();
         }
         var _loc3_:SharedObject = this.storageService.getStorage();
         _loc3_.data[param1.name] = param2;
         _loc3_.flush();
      }
      
      public function method_819(param1:GameActionEnum, param2:uint) : uint
      {
         if(param2 >= 3)
         {
            return 0;
         }
         var _loc3_:Vector.<uint> = this.var_1768[param1];
         if(Boolean(_loc3_))
         {
            return _loc3_[param2];
         }
         return 0;
      }
      
      public function method_817(param1:GameActionEnum) : Vector.<uint>
      {
         return this.var_1768[param1];
      }
      
      public function name_729(param1:uint) : GameActionEnum
      {
         return this.var_1767[param1];
      }
      
      private function method_1951() : void
      {
         this.var_1766[GameActionEnum.ROTATE_TURRET_LEFT] = Vector.<uint>([this.var_1770,Keyboard.COMMA,0]);
         this.var_1766[GameActionEnum.ROTATE_TURRET_RIGHT] = Vector.<uint>([Keyboard.X,Keyboard.PERIOD,0]);
         this.var_1766[GameActionEnum.CENTER_TURRET] = Vector.<uint>([Keyboard.C,Keyboard.SLASH,0]);
         this.var_1766[GameActionEnum.CHASSIS_LEFT_MOVEMENT] = Vector.<uint>([Keyboard.LEFT,Keyboard.A,0]);
         this.var_1766[GameActionEnum.CHASSIS_RIGHT_MOVEMENT] = Vector.<uint>([Keyboard.RIGHT,Keyboard.D,0]);
         this.var_1766[GameActionEnum.CHASSIS_FORWARD_MOVEMENT] = Vector.<uint>([Keyboard.UP,Keyboard.W,0]);
         this.var_1766[GameActionEnum.CHASSIS_BACKWARD_MOVEMENT] = Vector.<uint>([Keyboard.DOWN,Keyboard.S,0]);
         this.var_1766[GameActionEnum.FOLLOW_CAMERA_UP] = Vector.<uint>([Keyboard.PAGE_UP,Keyboard.LEFTBRACKET,Keyboard.Q]);
         this.var_1766[GameActionEnum.FOLLOW_CAMERA_DOWN] = Vector.<uint>([Keyboard.PAGE_DOWN,Keyboard.RIGHTBRACKET,Keyboard.E]);
         this.var_1766[GameActionEnum.DROP_FLAG] = Vector.<uint>([Keyboard.F,0,0]);
         this.var_1766[GameActionEnum.BATTLE_PAUSE] = Vector.<uint>([Keyboard.P,0,0]);
         this.var_1766[GameActionEnum.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,Keyboard.EQUAL,0]);
         this.var_1766[GameActionEnum.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.O,0,0]);
         this.var_1766[GameActionEnum.FULL_SCREEN] = Vector.<uint>([Keyboard.O,Keyboard.F11,0]);
         this.var_1766[GameActionEnum.BATTLE_VIEW_INCREASE] = Vector.<uint>([Keyboard.NUMPAD_ADD,0,0]);
         this.var_1766[GameActionEnum.BATTLE_VIEW_DECREASE] = Vector.<uint>([Keyboard.NUMPAD_SUBTRACT,0,0]);
         this.var_1766[GameActionEnum.SUICIDE] = Vector.<uint>([Keyboard.DELETE,0,0]);
         this.var_1766[GameActionEnum.SHOW_TANK_PARAMETERS] = Vector.<uint>([Keyboard.V,Keyboard.R,0]);
         this.var_1766[GameActionEnum.USE_FIRS_AID] = Vector.<uint>([Keyboard.NUMBER_1,Keyboard.NUMPAD_1,0]);
         this.var_1766[GameActionEnum.USE_DOUBLE_ARMOR] = Vector.<uint>([Keyboard.NUMBER_2,Keyboard.NUMPAD_2,0]);
         this.var_1766[GameActionEnum.USE_DOUBLE_DAMAGE] = Vector.<uint>([Keyboard.NUMBER_3,Keyboard.NUMPAD_3,0]);
         this.var_1766[GameActionEnum.USE_NITRO] = Vector.<uint>([Keyboard.NUMBER_4,Keyboard.NUMPAD_4,0]);
         this.var_1766[GameActionEnum.USE_MINE] = Vector.<uint>([Keyboard.NUMBER_5,Keyboard.NUMPAD_5,0]);
         this.var_1766[GameActionEnum.DROP_GOLD_BOX] = Vector.<uint>([Keyboard.NUMBER_6,Keyboard.NUMPAD_6,0]);
         this.var_1766[GameActionEnum.SHOT] = Vector.<uint>([Keyboard.SPACE,0,0]);
         this.var_1766[GameActionEnum.ULTIMATE] = Vector.<uint>([Keyboard.SHIFT,0,0]);
         this.var_1766[GameActionEnum.OPEN_GARAGE] = Vector.<uint>([Keyboard.G,0,0]);
      }
      
      private function method_1948(param1:GameActionEnum, param2:Vector.<uint>) : void
      {
         if(!param2)
         {
            param2 = this.var_1766[param1];
            if(!param2)
            {
               param2 = method_1945();
            }
         }
         this.var_1768[param1] = param2;
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            this.method_820(param1,param2[_loc3_],_loc3_);
            _loc3_++;
         }
      }
      
      public function method_822() : void
      {
         var _loc1_:GameActionEnum = null;
         this.var_1768 = new Dictionary();
         this.var_1767 = new Dictionary();
         for each(_loc1_ in GameActionEnum.method_393)
         {
            this.method_1948(_loc1_,this.var_1766[_loc1_].concat());
         }
      }
      
      private function method_1950() : void
      {
         var _loc1_:GameActionEnum = null;
         var _loc2_:SharedObject = this.storageService.getStorage();
         for each(_loc1_ in GameActionEnum.method_393)
         {
            this.method_1948(_loc1_,_loc2_.data[_loc1_.name]);
         }
      }
      
      public function method_818(param1:uint) : String
      {
         return this.method_1949().name_2244(param1);
      }
   }
}
