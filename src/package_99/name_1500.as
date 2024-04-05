package package_99
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.osgi.OSGi;
   import alternativa.physics.name_660;
   import alternativa.physics.name_888;
   import alternativa.tanks.battle.name_295;
   import alternativa.tanks.battle.name_712;
   import alternativa.tanks.models.battlefield.BattleView3D;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.sfx.name_2384;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import package_24.LogLevel;
   import package_277.name_2400;
   import package_277.name_904;
   import package_298.BoxSphereCollider;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.name_73;
   import package_47.BattleTeamType;
   import package_7.name_11;
   import package_75.name_274;
   
   public class name_1500 extends name_295 implements name_712, name_1229
   {
      
      public static var battleInfoService:name_274 = OSGi.getInstance().name_6(name_274) as name_274;
      
      private static const var_668:BoxSphereCollider = new BoxSphereCollider();
      
      private static const const_1920:int = 1;
      
      private static const const_1899:int = 2;
      
      private static const const_1900:int = 3;
      
      private static const const_1925:int = 320;
      
      private static const const_1921:int = 22;
      
      private static const const_1923:int = 12;
      
      private static const const_1922:Number = 0.2;
      
      private static const const_1924:Number = 10;
      
      private static var var_1000:Vector3 = new Vector3();
      
      private static var pool:name_1500;
       
      
      public var id:String;
      
      public var ownerId:String;
      
      public var name_1511:Boolean;
      
      private var var_2333:Boolean;
      
      public var var_2336:name_2400;
      
      public var position:Vector3;
      
      public var normal:Vector3;
      
      public var next:name_1500;
      
      public var prev:name_1500;
      
      private var callback:class_48;
      
      private var teamType:BattleTeamType;
      
      private var mesh:Mesh;
      
      private var var_2335:Boolean;
      
      private var var_771:name_1502;
      
      private var var_2334:int;
      
      private var var_2301:int;
      
      private var colorTransform:ColorTransform;
      
      private var var_2337:Boolean;
      
      private var var_794:Tank;
      
      private var blinker:name_2384;
      
      public function name_1500(param1:Mesh)
      {
         this.var_2336 = new name_2400(1,name_73.WEAPON,name_888.name_947);
         this.position = new Vector3();
         this.normal = new Vector3();
         this.colorTransform = new ColorTransform();
         this.blinker = new name_2384(320,22,12,0.2,1,10);
         super();
         this.mesh = Mesh(param1.clone());
      }
      
      public static function create(param1:String, param2:String, param3:Number, param4:Mesh, param5:Material, param6:BattleTeamType, param7:name_1502, param8:class_48) : name_1500
      {
         var _loc9_:name_1500 = null;
         if(pool == null)
         {
            _loc9_ = new name_1500(param4);
         }
         else
         {
            _loc9_ = pool;
            pool = pool.next;
            _loc9_.next = null;
         }
         _loc9_.init(param1,param2,param3,param5,param6,param7,param8);
         return _loc9_;
      }
      
      public function dispose() : void
      {
         this.id = null;
         this.ownerId = null;
         this.var_794 = null;
         this.var_771 = null;
         this.var_2337 = false;
         this.prev = null;
         this.next = pool == null ? null : pool;
         pool = this;
      }
      
      public function name_1503() : void
      {
         this.var_2335 = true;
         this.var_2334 = getTimer();
         this.var_2301 = 1;
         this.mesh.colorTransform = this.colorTransform;
         this.mesh.alpha = 1;
      }
      
      public function name_731(param1:Vector3, param2:Vector3) : void
      {
         this.position.vCopy(param1);
         this.normal.vCopy(param2);
         this.mesh.x = param1.x;
         this.mesh.y = param1.y;
         this.mesh.z = param1.z;
         var_1000.vCross2(Vector3.Z_AXIS,param2).vNormalize();
         var _loc3_:Number = Math.acos(param2.dot(Vector3.Z_AXIS));
         var _loc4_:Matrix3 = new Matrix3();
         _loc4_.name_1097(var_1000,_loc3_);
         _loc4_.name_182(var_1000);
         this.mesh.rotationX = var_1000.x;
         this.mesh.rotationY = var_1000.y;
         this.mesh.rotationZ = var_1000.z;
         this.var_2336.transform.name_731(param1);
         this.var_2336.calculateAABB();
      }
      
      public function name_1322() : void
      {
         name_165().method_180(this);
         var _loc1_:BattleView3D = battleService.getBattlefieldData().viewport;
         _loc1_.name_755(this,0);
         if(!this.var_2335)
         {
            _loc1_.name_884(this.mesh);
            this.var_2333 = true;
         }
      }
      
      public function name_1327() : void
      {
         name_165().method_173(this);
         var _loc1_:BattleView3D = battleService.getBattlefieldData().viewport;
         _loc1_.method_776(this,0);
         _loc1_.method_280(this.mesh);
         this.var_2333 = false;
      }
      
      public function method_845() : void
      {
         battleService.getBattlefieldData().viewport.name_884(this.mesh);
         this.var_2333 = true;
      }
      
      public function method_2351() : void
      {
         battleService.getBattlefieldData().viewport.method_280(this.mesh);
         this.var_2333 = false;
      }
      
      public function method_1636(param1:name_660) : void
      {
         this.var_794 = param1.tank;
         if(this.method_2355(this.var_794.tankData))
         {
            if(this.method_2356(this.var_794))
            {
               if(!this.var_2337)
               {
                  this.var_2337 = true;
                  this.callback.method_1044(this);
               }
            }
            else
            {
               this.var_2337 = false;
            }
         }
      }
      
      public function method_2355(param1:TankData) : Boolean
      {
         return (this.teamType == BattleTeamType.NONE || this.teamType != param1.teamType) && this.var_2335 && this.ownerId != param1.user.id && param1.enabled;
      }
      
      private function method_2356(param1:Tank) : Boolean
      {
         var _loc2_:name_904 = param1.method_481();
         return (_loc2_.collisionGroup & this.var_2336.collisionGroup) != 0 && var_668.name_1176(_loc2_,this.var_2336);
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(!this.var_2335 && this.name_1511)
         {
            this.mesh.alpha = this.blinker.name_2390(param1,param2);
         }
         else if(this.var_2335)
         {
            if(this.var_2301 != 3)
            {
               this.method_2337(param1);
            }
            else
            {
               this.method_668();
            }
         }
      }
      
      private function method_2353() : Boolean
      {
         return Boolean(battleInfoService.name_1016()) || !this.var_2335 || this.method_2352() && (this.ownerId == this.var_794.method_484().name || this.var_794.method_64(this.teamType));
      }
      
      private function method_2352() : Boolean
      {
         return this.var_794 && this.var_794.method_484() && Boolean(this.var_794.tankData) && this.var_794.tankData.health > 0;
      }
      
      public function toString() : String
      {
         return "[ProximityMine id=" + this.id + ", ownerId=" + this.ownerId + ", armed=" + this.var_2335 + "]";
      }
      
      private function init(param1:String, param2:String, param3:Number, param4:Material, param5:BattleTeamType, param6:name_1502, param7:class_48) : void
      {
         if(param5 == null)
         {
            name_11.log(LogLevel.name_79,"ProximityMine: teamType is null");
         }
         this.id = param1;
         this.ownerId = param2;
         this.method_2357(param3);
         this.callback = param7;
         this.teamType = param5;
         this.var_771 = param6;
         this.mesh.colorTransform = null;
         this.mesh.alpha = 1;
         this.mesh.visible = true;
         this.mesh.setMaterialToAllFaces(param4);
         this.var_2335 = false;
         this.var_2301 = 3;
         this.var_2334 = getTimer();
         this.blinker.init(this.var_2334);
      }
      
      private function method_2357(param1:Number) : void
      {
         this.var_2336.const_1653 = param1;
         this.var_2336.calculateAABB();
      }
      
      private function method_668() : void
      {
         if(this.method_2353())
         {
            this.mesh.visible = true;
            if(!this.var_2333)
            {
               this.method_845();
            }
         }
         else if(this.method_2352())
         {
            this.method_2354(this.var_794);
         }
         else
         {
            this.mesh.visible = false;
            if(this.var_2333)
            {
               this.method_2351();
            }
         }
      }
      
      private function method_2354(param1:Tank) : void
      {
         this.mesh.visible = true;
         var_1000.vDiff(param1.method_456().state.position,this.position);
         var _loc2_:Number = var_1000.length();
         if(_loc2_ > this.var_771.name_229)
         {
            this.mesh.visible = false;
            if(_loc2_ > this.var_771.name_229 && this.var_2333)
            {
               this.method_2351();
            }
         }
         else if(_loc2_ < this.var_771.name_191)
         {
            this.mesh.alpha = 1;
            if(!this.var_2333)
            {
               this.method_845();
            }
         }
         else
         {
            if(!this.var_2333)
            {
               this.method_845();
            }
            if(this.name_1511)
            {
               this.mesh.alpha = (this.var_771.name_229 - _loc2_) / (this.var_771.name_229 - this.var_771.name_191);
            }
         }
      }
      
      private function method_2337(param1:int) : void
      {
         switch(this.var_2301)
         {
            case 1:
               if(param1 < this.var_2334 + this.var_771.name_1510)
               {
                  this.method_2338(this.var_771.name_1506 * (param1 - this.var_2334) / this.var_771.name_1510);
                  break;
               }
               this.method_2338(this.var_771.name_1506);
               this.var_2334 += this.var_771.name_1510 + this.var_771.name_1507;
               this.var_2301 = 2;
               break;
            case 2:
               if(param1 < this.var_2334)
               {
                  this.method_2338(this.var_771.name_1506 * (this.var_2334 - param1) / this.var_771.name_1507);
                  break;
               }
               this.method_2338(0);
               this.var_2301 = 3;
               this.mesh.colorTransform = null;
               break;
         }
      }
      
      private function method_2338(param1:uint) : void
      {
         this.colorTransform.redOffset = param1;
         this.colorTransform.greenOffset = param1;
         this.colorTransform.blueOffset = param1;
         this.mesh.colorTransform = this.colorTransform;
      }
   }
}
