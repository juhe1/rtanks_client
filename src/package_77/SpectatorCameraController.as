package package_77
{
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.utils.name_75;
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import package_12.name_24;
   import package_242.name_662;
   import package_32.name_245;
   import package_37.Vector3;
   import package_76.name_654;
   import package_76.name_735;
   
   public class SpectatorCameraController implements name_654
   {
      
      public static var display:name_24;
      
      public static var battleService:name_83;
      
      public static var battleInputService:name_245;
      
      private static const const_505:name_662 = new name_662("cam_smooth",0.1,0.001,1);
      
      private static const const_506:name_662 = new name_662("cam_smooth_dec",0.025,0.001,1);
      
      private static const const_511:name_662 = new name_662("m_pitch",-0.006,-100,100);
      
      private static const const_508:name_662 = new name_662("m_yaw",-0.006,-100,100);
      
      private static const const_507:name_662 = new name_662("cam_spd",1300,0,10000);
      
      private static const const_504:name_662 = new name_662("cam_acc",4,0,1000000);
      
      private static const const_503:name_662 = new name_662("cam_dec",0.33,0.05,2);
      
      private static const const_510:name_662 = new name_662("yaw_speed",1,-10,10);
      
      private static const const_509:name_662 = new name_662("pitch_speed",1,-10,10);
       
      
      private var var_800:Boolean;
      
      private var var_803:Number;
      
      private var var_802:Number;
      
      private var var_804:Number;
      
      private var var_801:Number;
      
      private var position:Vector3;
      
      private var rotation:Vector3;
      
      private var var_795:Vector3;
      
      private var var_796:MovementMethods;
      
      private var var_798:Vector.<class_47>;
      
      private var var_797:UserInputImpl;
      
      private var var_799:Boolean = false;
      
      public var name_782:PlayerCamera;
      
      private var camera:name_735;
      
      public function SpectatorCameraController()
      {
         this.position = new Vector3();
         this.rotation = new Vector3();
         this.var_795 = new Vector3();
         this.var_797 = new UserInputImpl();
         this.name_782 = new PlayerCamera(this);
         this.var_798 = Vector.<class_47>([new BookmarksHandler(this),this.var_797,this.name_782,new name_1515()]);
         super();
         this.var_796 = new MovementMethods(Vector.<name_1517>([new name_1518(const_507,const_504,const_503),new name_1516(const_507,const_504,const_503)]));
      }
      
      private static function method_1056(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = (param2 - param1) % (2 * Math.PI);
         if(_loc3_ > Math.PI)
         {
            return _loc3_ - 2 * Math.PI;
         }
         if(_loc3_ < -Math.PI)
         {
            return 2 * Math.PI + _loc3_;
         }
         return _loc3_;
      }
      
      public function method_1065(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:name_735 = null;
         this.position.copy(param1);
         this.rotation.copy(param2);
         _loc3_ = battleService.getBattlefieldData().viewport.camera;
         this.var_795.x = method_1056(_loc3_.rotationX,param2.x);
         this.var_795.y = method_1056(_loc3_.rotationY,param2.y);
         this.var_795.z = method_1056(_loc3_.rotationZ,param2.z);
      }
      
      public function update(param1:name_735, param2:int, param3:int) : void
      {
         var _loc4_:Number = param3 / 1000;
         this.method_1058(param1,_loc4_);
         this.method_1060(param1,_loc4_);
         this.method_1062(param1);
      }
      
      private function method_1058(param1:name_735, param2:Number) : void
      {
         var _loc3_:Vector3 = this.var_796.name_1513().name_1522(this.var_797,param1,param2);
         this.position.add(_loc3_);
      }
      
      private function method_1060(param1:name_735, param2:Number) : void
      {
         if(this.var_800)
         {
            this.rotation.x = this.var_804 + (display.stage.mouseY - this.var_802) * const_511.value;
            this.rotation.x = name_75.method_218(this.rotation.x,-Math.PI,0);
            this.var_795.x = this.rotation.x - param1.rotationX;
            this.rotation.z = this.var_801 + (display.stage.mouseX - this.var_803) * const_508.value;
            this.var_795.z = this.rotation.z - param1.rotationZ;
         }
         else if(this.var_797.name_948())
         {
            this.rotation.x += this.var_797.name_1524() * const_509.value * param2;
            this.rotation.x = name_75.method_218(this.rotation.x,-Math.PI,0);
            this.var_795.x = this.rotation.x - param1.rotationX;
            this.var_795.z += this.var_797.name_1520() * const_510.value * param2;
         }
      }
      
      private function method_1062(param1:name_735) : void
      {
         this.method_1061(param1);
         this.method_1064(param1);
      }
      
      private function method_1061(param1:name_735) : void
      {
         var _loc2_:name_662 = null;
         _loc2_ = !!this.var_796.name_1513().name_1514() ? const_506 : const_505;
         param1.x += (this.position.x - param1.x) * _loc2_.value;
         param1.y += (this.position.y - param1.y) * _loc2_.value;
         param1.z += (this.position.z - param1.z) * _loc2_.value;
      }
      
      private function method_1064(param1:name_735) : void
      {
         var _loc2_:name_662 = null;
         _loc2_ = null;
         _loc2_ = !!this.var_796.name_1513().name_1514() ? const_506 : const_505;
         var _loc3_:Number = this.var_795.x * _loc2_.value;
         param1.rotationX += _loc3_;
         this.var_795.x -= _loc3_;
         var _loc4_:Number = this.var_795.y * _loc2_.value;
         param1.rotationY += _loc4_;
         this.var_795.y -= _loc4_;
         var _loc5_:Number = this.var_795.z * _loc2_.value;
         param1.rotationZ += _loc5_;
         this.var_795.z -= _loc5_;
      }
      
      public function activate(param1:name_735) : void
      {
         this.camera = param1;
         this.var_795.reset();
         this.method_1059();
         param1.name_962(this.position);
         param1.name_1382(this.rotation);
      }
      
      public function deactivate() : void
      {
         this.var_797.reset();
         this.var_795.reset();
         this.method_1063();
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(battleInputService.name_727())
         {
            return;
         }
         this.var_800 = true;
         this.var_803 = param1.stageX;
         this.var_802 = param1.stageY;
         this.var_804 = this.camera.rotationX;
         this.var_801 = this.camera.rotationZ;
         display.stage.addEventListener(MouseEvent.MOUSE_UP,this.method_1057);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         if(battleInputService.name_727())
         {
            return;
         }
         var _loc2_:class_47 = null;
         for each(_loc2_ in this.var_798)
         {
            _loc2_.method_1036(param1);
         }
      }
      
      private function onKeyDown(param1:KeyboardEvent) : void
      {
         if(battleInputService.name_727())
         {
            return;
         }
         var _loc2_:Boolean = false;
         if(param1.keyCode == Keyboard.SPACE)
         {
            _loc2_ = Boolean(this.var_796.name_1513().name_1514());
            this.var_796.name_1521();
            this.var_796.name_1513().name_1523(_loc2_);
         }
         if(param1.keyCode == Keyboard.I)
         {
            this.var_796.name_1513().name_1519();
         }
         var _loc3_:class_47 = null;
         for each(_loc3_ in this.var_798)
         {
            _loc3_.method_190(param1);
         }
      }
      
      private function name_1089() : void
      {
         if(this.var_800)
         {
            display.stage.removeEventListener(MouseEvent.MOUSE_UP,this.method_1057);
            this.var_800 = false;
         }
      }
      
      private function method_1057(param1:MouseEvent) : void
      {
         this.name_1089();
      }
      
      public function method_1063() : void
      {
         var _loc1_:Stage = null;
         var _loc2_:class_47 = null;
         this.name_1089();
         if(this.var_799)
         {
            this.var_799 = false;
            _loc1_ = display.stage;
            _loc1_.removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _loc1_.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            _loc1_.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            for each(_loc2_ in this.var_798)
            {
               _loc2_ = null;
            }
            this.var_798 = null;
         }
      }
      
      public function method_1059() : void
      {
         var _loc1_:Stage = null;
         if(!this.var_799)
         {
            this.var_799 = true;
            _loc1_ = display.stage;
            _loc1_.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
            _loc1_.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            _loc1_.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         }
      }
   }
}
