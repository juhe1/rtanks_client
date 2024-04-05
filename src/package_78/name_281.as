package package_78
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.tank.class_7;
   import alternativa.tanks.models.tank.turret.name_914;
   import alternativa.tanks.models.weapon.shaft.ShaftModel;
   import alternativa.tanks.models.weapon.shaft.name_1252;
   import alternativa.tanks.models.weapon.shaft.name_1254;
   import alternativa.tanks.models.weapon.shaft.name_1261;
   import alternativa.tanks.models.weapon.shaft.name_1268;
   import alternativa.tanks.service.settings.name_108;
   import alternativa.tanks.utils.name_75;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import package_1.Main;
   import package_12.name_24;
   import package_299.ShaftSFXModel;
   import package_308.name_1251;
   import package_309.name_1255;
   import package_32.class_2;
   import package_32.name_1092;
   import package_32.name_1093;
   import package_32.name_245;
   import package_33.GameActionEnum;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_37.name_86;
   import package_39.Model;
   import package_52.WeaponsManager;
   import package_55.name_101;
   import package_65.name_160;
   import package_76.name_1258;
   import package_76.name_735;
   
   public class name_281 implements class_2, name_1092, name_1093
   {
      
      public static var battleInputService:name_245;
      
      public static var display:name_24;
      
      public static var settings:name_108;
      
      private static var var_577:Vector3 = new Vector3();
      
      private static var var_142:Vector3 = new Vector3();
       
      
      private var method_291:Boolean = false;
      
      private var var_563:Number = 0;
      
      private var var_559:Number = 0;
      
      private var var_587:Number = 0;
      
      private var var_584:Boolean = false;
      
      private var up:Boolean;
      
      private var down:Boolean;
      
      public var var_560:name_1255;
      
      private var var_561:name_1252;
      
      private var var_569:name_1252;
      
      private var var_586:int;
      
      private var var_583:Boolean;
      
      private var var_568:Boolean;
      
      public var var_566:name_1251;
      
      private var timeLeft:int = 0;
      
      private var var_570:name_1252;
      
      private var var_576:name_1252;
      
      private var var_581:int = 500;
      
      public var camera:name_735;
      
      public var skin:TankSkin;
      
      private var var_573:Number = 0.698132;
      
      private var var_578:Vector3;
      
      private var var_575:name_86;
      
      private var var_580:name_86;
      
      private var var_571:name_86;
      
      private var var_572:Vector3;
      
      private var var_142:Vector3;
      
      private var var_558:Matrix4;
      
      private var var_515:Matrix4;
      
      private var var_143:Vector3;
      
      private var var_11:BattlefieldModel;
      
      public var var_562:name_1254;
      
      public var shaftModel:ShaftModel;
      
      private var var_579:Number;
      
      private var var_585:Number;
      
      private var var_582:Number;
      
      private var var_574:Number;
      
      private var var_13:TankModel;
      
      private var var_564:ShaftSFXModel;
      
      private var var_565:name_914;
      
      private var var_567:name_914;
      
      public function name_281(param1:ShaftModel)
      {
         this.var_561 = new name_1252();
         this.var_569 = new name_1252();
         this.var_566 = name_1251.name_1253;
         super();
         var _loc2_:name_1268 = param1.name_1271;
         this.var_573 = _loc2_.name_1262;
         this.var_561.setInterval(_loc2_.name_1281,_loc2_.name_1262);
         this.var_569.setInterval(_loc2_.name_1265,_loc2_.name_1275);
         this.var_560 = new name_1255(_loc2_.name_1280,_loc2_.name_1277,_loc2_.name_1272,_loc2_.name_1267);
         this.var_570 = new name_1252();
         this.var_576 = new name_1252();
         this.var_575 = new name_86();
         this.var_580 = name_86.method_676(Vector3.X_AXIS,-Math.PI / 2);
         this.var_572 = new Vector3();
         this.var_142 = new Vector3();
         this.var_571 = new name_86();
         this.var_558 = new Matrix4();
         this.var_515 = new Matrix4();
         this.var_143 = new Vector3();
         this.var_576.setInterval(0,1);
         this.shaftModel = param1;
         this.var_578 = new Vector3(0,30,10);
         this.var_13 = Main.osgi.name_6(class_7) as TankModel;
      }
      
      public function enter(param1:int) : void
      {
         var _loc2_:name_914 = null;
         if(this.var_565 == null)
         {
            this.var_565 = new name_160(this.var_13.localUserData);
            Model.object = this.var_13.localUserData.object;
            this.var_13.putData(name_160,this.var_565);
            Model.method_38();
         }
         if(this.var_567 == null)
         {
            _loc2_ = this.var_13.localUserData.tank.name_121();
            this.var_567 = _loc2_ is name_101 ? _loc2_ : new name_101(this.var_13.localUserData);
         }
         battleInputService.method_598(this);
         battleInputService.name_219(this);
         this.var_563 = 0;
         this.var_559 = 0;
         this.method_291 = false;
         this.var_584 = false;
         this.var_582 = TankData.name_106.tank.method_495().name_1276();
         this.var_574 = TankData.name_106.tank.method_495().name_1159();
         TankData.name_106.tank.method_495().name_201(2,false);
         this.method_801(this.var_574);
         this.up = name_75.method_605(TankData.name_106.tank.method_493,1) != 0;
         this.down = name_75.method_605(TankData.name_106.tank.method_493,2) != 0;
         this.shaftModel.name_1270(name_1261.DRAIN);
         this.timeLeft = this.var_581;
         this.var_570.setInterval(this.skin.name_123.alpha,0);
         this.var_561.setInterval(this.camera.fov,this.var_573);
         this.method_803();
         this.var_586 = -1;
         this.var_583 = false;
         this.var_568 = true;
         this.var_11 = Main.osgi.name_6(name_83) as BattlefieldModel;
         this.var_562 = new name_1254(this.var_11.var_117.viewport.camera);
         this.var_562.name_1146(this.skin);
         this.var_562.stop();
         this.var_566 = name_1251.name_1253;
         this.var_560.reload();
         this.var_11.method_146(this.var_560);
         this.var_11.getBattlefieldData().viewport.method_790();
         this.var_11.hidableObjects.name_1257(TankData.name_106.tank.state.position,0);
         this.var_579 = this.shaftModel.name_1259(param1);
         this.shaftModel.name_1274();
         this.var_13.localUserData.tank.name_238(this.var_565);
         this.var_13.localUserData.tank.name_121().method_594(false);
         this.var_564 = WeaponsManager.createShaftSFXModel(WeaponsManager.name_185(TankData.name_106.turret.id));
      }
      
      public function exit() : void
      {
         this.method_800();
         this.var_562.name_1278(name_1258.name_1283(Main.stage.stageWidth,Main.stage.stageHeight));
         this.var_562.start();
         TankData.name_106.tank.method_495().name_246(this.var_582);
         TankData.name_106.tank.name_214(this.var_574,true);
         if(this.var_13.localUserData != null)
         {
            this.var_13.localUserData.tank.name_238(this.var_567);
            this.var_13.localUserData.tank.name_121().method_594(true);
            this.var_564.name_1260(this.var_13.localUserData.turret,this.var_13.localUserData.user,false);
         }
         this.var_11.getBattlefieldData().viewport.method_781();
      }
      
      private function method_801(param1:Number) : void
      {
         TankData.name_106.tank.name_214(param1 * 0.5,false);
         this.var_560.name_1284(param1);
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         switch(this.var_566)
         {
            case name_1251.name_1253:
               _loc3_ = 0;
               _loc4_ = 0;
               if(this.timeLeft <= 0)
               {
                  this.var_566 = name_1251.name_1256;
                  this.var_561.setInterval(this.camera.fov,this.var_573);
                  break;
               }
               this.timeLeft -= param2;
               _loc3_ = 1 - this.timeLeft / this.var_581;
               if(_loc3_ > 1)
               {
                  _loc3_ = 1;
               }
               _loc4_ = this.var_570.interpolate(_loc3_);
               this.skin.name_1068(_loc4_);
               this.method_802(_loc3_);
               break;
            case name_1251.name_1256:
               _loc5_ = this.shaftModel.name_1259(param1);
               _loc6_ = (this.var_579 - _loc5_) / 1000;
               this.var_585 = _loc6_;
               this.var_560.name_1264(this.var_561.interpolate(_loc6_));
               if(_loc5_ == 0 && this.var_568)
               {
                  this.var_568 = false;
                  this.var_564.name_1273(TankData.name_106.turret,TankData.name_106.user);
               }
               this.up = Boolean(TankData.name_106.ctrlBits & TankModel.const_14) || this.var_559 < 0;
               this.down = Boolean(TankData.name_106.ctrlBits & TankModel.BACK) || this.var_559 > 0;
               _loc7_ = int(this.up) - int(this.down);
               this.var_564.name_1260(TankData.name_106.turret,TankData.name_106.user,_loc7_ != 0 && !this.var_560.name_1263() || Boolean(this.var_13.localUserData.tank.method_495().name_948()));
               this.var_560.name_1269 = _loc7_;
               this.var_11.hidableObjects.name_1257(TankData.name_106.tank.state.position,this.var_569.interpolate(_loc6_));
               this.var_563 = 0;
               this.var_559 = 0;
               break;
            case name_1251.name_1266:
         }
      }
      
      private function method_803() : void
      {
         var _loc1_:Object3D = this.skin.name_200;
         this.var_515.name_943(_loc1_.x,_loc1_.y,_loc1_.z,_loc1_.rotationX,_loc1_.rotationY,_loc1_.rotationZ);
         this.var_558.name_943(this.camera.x,this.camera.y,this.camera.z,this.camera.rotationX,this.camera.rotationY,this.camera.rotationZ);
         this.var_515.name_1279();
         this.var_558.append(this.var_515);
         this.var_558.name_182(this.var_143);
         this.var_575.name_222(this.var_143.x,this.var_143.y,this.var_143.z);
         this.var_558.name_1282(3,this.var_572);
      }
      
      private function method_802(param1:Number) : void
      {
         this.var_142.interpolate(param1,this.var_572,this.var_578);
         this.var_571.name_205(this.var_575,this.var_580,param1);
         this.var_571.toMatrix4(this.var_558);
         this.var_558.name_731(this.var_142);
         var _loc2_:Object3D = this.skin.name_200;
         this.var_515.name_943(_loc2_.x,_loc2_.y,_loc2_.z,_loc2_.rotationX,_loc2_.rotationY,_loc2_.rotationZ);
         this.var_558.append(this.var_515);
         this.var_558.name_182(this.var_143);
         this.camera.x = this.var_558.m03;
         this.camera.y = this.var_558.m13;
         this.camera.z = this.var_558.m23;
         this.camera.rotationX = this.var_143.x;
         this.camera.rotationY = this.var_143.y;
         this.camera.rotationZ = this.var_143.z;
      }
      
      public function destroy() : void
      {
         this.method_800();
      }
      
      private function method_800() : void
      {
         battleInputService.name_150(this);
         battleInputService.method_597(this);
         battleInputService.method_600(this);
      }
      
      public function method_688(param1:Boolean) : void
      {
         if(this.method_291 != param1)
         {
            this.method_291 = param1;
            if(param1)
            {
               battleInputService.method_602(this);
            }
            else
            {
               this.var_563 = 0;
               this.var_559 = 0;
               battleInputService.method_600(this);
            }
         }
      }
      
      public function method_689(param1:Number, param2:Number) : void
      {
         this.var_563 += param1;
         this.var_559 += param2 * (!!settings.mouseYInverseShaftAim ? -1 : 1);
      }
      
      public function method_28(param1:GameActionEnum, param2:Boolean) : void
      {
      }
   }
}
