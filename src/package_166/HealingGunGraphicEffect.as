package package_166
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.Material;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.sfx.name_1714;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.sfx.name_1808;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.services.objectpool.name_118;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import package_1.Main;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_242.name_662;
   import package_334.name_1610;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   use namespace alternativa3d;
   
   public class HealingGunGraphicEffect extends class_30 implements name_657
   {
      
      private static var var_3335:name_662 = new name_662("izida_end_offset",150,0,500);
      
      private static var var_515:Matrix4 = new Matrix4();
      
      private static var var_3330:Matrix4 = new Matrix4();
      
      private static var const_1836:Vector3 = new Vector3();
      
      private static var const_1837:Vector3 = new Vector3();
      
      private static var direction:Vector3 = new Vector3();
      
      private static var var_142:Vector3 = new Vector3();
      
      private static const const_2584:Number = 0.1;
      
      private static const const_2583:Number = 100;
      
      private static var var_138:name_118 = name_118(Main.osgi.name_6(name_118));
       
      
      private var var_421:BattlefieldModel;
      
      private var var_170:name_175;
      
      private var var_3325:HealingGunShaft;
      
      private var var_3323:AnimatedSprite3D;
      
      private var var_3324:AnimatedSprite3D;
      
      private var turret:Object3D;
      
      private var var_3332:Vector3;
      
      private var var_3327:Object3D;
      
      private var var_3334:Vector3;
      
      private var hitPoint:Vector3;
      
      private var var_3331:Vector3;
      
      private var targetPoint:Vector3;
      
      private var var_3329:Number;
      
      private var var_3333:Boolean;
      
      private var show:Boolean;
      
      private var var_2454:Boolean;
      
      private var var_3326:Number = 0;
      
      private var time:int;
      
      private var var_931:name_1610;
      
      private var sfxData:name_1772;
      
      private var listener:class_193;
      
      private var var_1046:name_1714;
      
      private var var_3328:name_1808;
      
      private var var_3337:name_1610;
      
      private var var_3336:TankData;
      
      public var isLocal:Boolean;
      
      public function HealingGunGraphicEffect(param1:ObjectPool)
      {
         this.var_421 = Main.osgi.name_6(name_83) as BattlefieldModel;
         this.var_3332 = new Vector3();
         this.var_3334 = new Vector3();
         this.hitPoint = new Vector3();
         this.var_3331 = new Vector3();
         this.targetPoint = new Vector3();
         super(param1);
         this.var_3325 = new HealingGunShaft();
         this.var_3325.init(name_3281.name_3284,100);
         this.var_3323 = new AnimatedSprite3D(name_3281.name_3283,name_3281.name_3283);
         this.var_3324 = new AnimatedSprite3D(name_3281.name_3282,name_3281.name_3282);
         this.var_3324.originY = 0.5;
      }
      
      public function method_2997() : void
      {
         if(this.var_3325 == null)
         {
            this.var_3325 = new HealingGunShaft();
            this.var_3325.init(name_3281.name_3284,100);
         }
         if(this.var_3323 == null)
         {
            this.var_3323 = new AnimatedSprite3D(name_3281.name_3283,name_3281.name_3283);
         }
         if(this.var_3324 == null)
         {
            this.var_3324 = new AnimatedSprite3D(name_3281.name_3282,name_3281.name_3282);
            this.var_3324.originY = 0.5;
         }
      }
      
      public function init(param1:class_193, param2:name_1610, param3:name_1772, param4:Object3D, param5:Vector3, param6:TankData) : void
      {
         this.listener = param1;
         this.sfxData = param3;
         this.turret = param4;
         this.var_931 = param2;
         this.var_3336 = param6;
         this.var_3332.vCopy(param5);
         this.var_3326 = 0;
         this.show = true;
         this.var_2454 = false;
         this.time = 0;
         this.method_2996();
         this.method_1237(param2,param6);
         this.method_668();
      }
      
      private function method_1237(param1:name_1610, param2:TankData) : void
      {
         if(this.var_1046 != null)
         {
            this.method_3001();
         }
         this.var_1046 = name_1714(var_138.objectPool.getObject(name_1714));
         var _loc3_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         _loc3_.init(this.turret,this.var_3332);
         switch(param1)
         {
            case name_1610.name_474:
               this.var_1046.init(_loc3_,LightDataManager.method_2056(param2.turret.id,"enemy_start"),LightDataManager.method_2056(param2.turret.id,"enemy_loop"));
               break;
            case name_1610.HEAL:
               this.var_1046.init(_loc3_,LightDataManager.method_2056(param2.turret.id,"friendly_start"),LightDataManager.method_2056(param2.turret.id,"friendly_loop"));
               break;
            default:
               this.var_1046.init(_loc3_,LightDataManager.method_2056(param2.turret.id,"idle_start"),LightDataManager.method_2056(param2.turret.id,"idle_loop"));
         }
         this.var_3337 = param1;
         this.var_421.name_217(this.var_1046);
      }
      
      public function set mode(param1:name_1610) : void
      {
         if(this.var_931 == param1)
         {
            return;
         }
         this.var_931 = param1;
         this.method_2996();
         this.var_3326 = 0;
      }
      
      public function name_1775(param1:Object3D, param2:Vector3, param3:TankData, param4:name_1610, param5:Boolean) : void
      {
         var _loc6_:Number = NaN;
         this.var_3333 = false;
         if(param1 != null)
         {
            if(this.var_3327 == param1)
            {
               if(this.isLocal && this.targetPoint != null)
               {
                  this.var_3331.copy(this.targetPoint);
               }
               else
               {
                  this.var_3331.copy(this.hitPoint);
               }
               _loc6_ = this.var_3331.distanceToSquared(param2);
               if(_loc6_ > 100)
               {
                  this.var_3333 = true;
                  this.var_3329 = 0;
               }
            }
            this.hitPoint.copy(param2);
            this.var_3334.copy(param2);
         }
         if(this.var_931 != param4 || this.var_3327 != param1)
         {
            this.var_3327 = param1;
            this.var_931 = param4;
            this.method_2996();
            this.var_3326 = 0;
         }
         if(param5)
         {
            this.method_2999(param4,param3,param2);
         }
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.show)
         {
            this.var_3326 += name_3281.name_3286 * param1 / 1000;
            if(this.var_3326 > 1)
            {
               this.var_3326 = 1;
            }
         }
         else
         {
            this.var_3326 -= name_3281.name_3286 * param1 / 1000;
            if(this.var_3326 <= 0)
            {
               if(this.var_2454)
               {
                  return false;
               }
            }
         }
         this.method_668();
         this.method_2997();
         this.time += param1;
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         var_515.name_890(this.var_3332,const_1837);
         this.var_3323.x = const_1837.x;
         this.var_3323.y = const_1837.y;
         this.var_3323.z = const_1837.z;
         var _loc4_:int = this.var_3323.method_2318() * this.time / 1000;
         this.var_3323.name_1431(_loc4_);
         if(this.var_931 == name_1610.name_474 || this.var_931 == name_1610.HEAL)
         {
            this.method_3002();
            this.method_2998(param2,param1,_loc4_);
         }
         return true;
      }
      
      private function method_3002() : void
      {
         if(this.targetPoint == null)
         {
            this.targetPoint = new Vector3();
         }
         if(this.var_3333)
         {
            this.method_3004();
         }
         else
         {
            this.targetPoint.copy(this.hitPoint);
         }
      }
      
      private function method_3004() : void
      {
         this.var_3329 += 0.1;
         if(this.var_3329 >= 1)
         {
            this.var_3329 = 1;
            this.var_3333 = false;
         }
         Vector3.interpolate(this.var_3329,this.var_3331,this.hitPoint,this.targetPoint);
      }
      
      private function method_668() : void
      {
         this.var_3325.alpha = this.var_3326;
         this.var_3323.alpha = this.var_3326;
         this.var_3324.alpha = this.var_3326;
         var _loc1_:Number = name_3281.name_3285 + (1 - name_3281.name_3285) * this.var_3326;
         this.var_3325.scaleX = _loc1_;
         this.var_3323.scaleX = _loc1_;
         this.var_3323.scaleY = _loc1_;
         this.var_3323.scaleZ = _loc1_;
         this.var_3324.scaleX = _loc1_;
         this.var_3324.scaleY = _loc1_;
         this.var_3324.scaleZ = _loc1_;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         this.method_2996();
      }
      
      public function destroy() : void
      {
         if(this.var_3325 != null)
         {
            this.var_3325.alternativa3d::removeFromParent();
         }
         if(this.var_3324 != null)
         {
            this.var_3324.alternativa3d::removeFromParent();
         }
         if(this.var_3323 != null)
         {
            this.var_3323.alternativa3d::removeFromParent();
         }
         this.var_170 = null;
         this.var_3325.setMaterialToAllFaces(null);
         this.var_1046.stop();
         if(this.var_3328 != null)
         {
            this.var_3328.kill();
         }
         this.var_1046 = null;
         this.var_3328 = null;
         this.sfxData = null;
         this.var_3327 = null;
         this.turret = null;
         this.listener.method_2496(this);
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return HealingGunGraphicEffect;
      }
      
      public function kill() : void
      {
         this.var_2454 = true;
         this.show = false;
      }
      
      private function method_2998(param1:name_735, param2:int, param3:int) : void
      {
         this.var_3324.name_1431(param3);
         var_3330.name_943(this.var_3327.x,this.var_3327.y,this.var_3327.z,this.var_3327.rotationX,this.var_3327.rotationY,this.var_3327.rotationZ);
         var_3330.name_890(this.targetPoint,const_1836);
         direction.diff(const_1836,const_1837);
         var _loc4_:Number = direction.vLength() - name_3281.name_3287;
         if(_loc4_ < 0)
         {
            _loc4_ = 10;
         }
         direction.normalize();
         const_1836.x = const_1837.x + _loc4_ * direction.x;
         const_1836.y = const_1837.y + _loc4_ * direction.y;
         const_1836.z = const_1837.z + _loc4_ * direction.z;
         this.var_3324.x = const_1836.x;
         this.var_3324.y = const_1836.y;
         this.var_3324.z = const_1836.z;
         var_142.x = param1.x;
         var_142.y = param1.y;
         var_142.z = param1.z;
         this.var_3325.update(param2,_loc4_);
         name_2500.name_2503(this.var_3325,const_1837,direction,var_142);
      }
      
      private function method_2999(param1:name_1610, param2:TankData, param3:Vector3) : void
      {
         if(this.var_3328 != null)
         {
            this.var_3328.kill();
            this.var_3328 = null;
         }
         if(param1 == name_1610.name_1183)
         {
            return;
         }
         var _loc4_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         var _loc5_:name_1716 = name_1716(var_138.objectPool.getObject(name_1716));
         _loc4_.init(this.turret,this.var_3332);
         _loc5_.init(this.var_3327,this.var_3334);
         this.var_3328 = name_1808(var_138.objectPool.getObject(name_1808));
         switch(param1)
         {
            case name_1610.name_474:
               this.var_3328.init(_loc4_,_loc5_,LightDataManager.method_2056(param2.turret.id,"enemy_beam"),true);
               break;
            case name_1610.HEAL:
               this.var_3328.init(_loc4_,_loc5_,LightDataManager.method_2056(param2.turret.id,"friendly_beam"),true);
         }
         this.var_421.name_217(this.var_3328);
      }
      
      private function method_3001() : void
      {
         this.var_1046.stop();
         this.var_1046 = null;
      }
      
      private function method_2996() : void
      {
         if(this.var_170 == null)
         {
            return;
         }
         switch(this.var_931)
         {
            case name_1610.name_1183:
               this.name_145();
               break;
            case name_1610.HEAL:
               this.method_3000();
               break;
            case name_1610.name_474:
               this.method_3003();
         }
      }
      
      private function name_145() : void
      {
         this.method_2997();
         this.var_3325.alternativa3d::removeFromParent();
         this.var_3324.alternativa3d::removeFromParent();
         if(this.var_3323.parent == null)
         {
            this.var_170.addChild(this.var_3323);
         }
         this.var_3323.name_1433(this.sfxData.name_1788);
         this.var_3323.name_1431(0);
      }
      
      private function method_3000() : void
      {
         this.method_2997();
         if(this.var_3325.parent == null)
         {
            this.var_170.addChild(this.var_3325);
            this.var_170.addChild(this.var_3324);
            this.var_3325.setMaterial(this.sfxData.method_2498(),1);
            this.var_3324.name_1433(this.sfxData.name_1778);
            this.var_3324.name_1431(0);
         }
         if(this.var_3323.parent == null)
         {
            this.var_170.addChild(this.var_3323);
         }
         this.var_3323.name_1433(this.sfxData.name_1788);
         this.var_3323.name_1431(0);
      }
      
      private function method_3003() : void
      {
         this.method_2997();
         if(this.var_3325.parent == null)
         {
            this.var_170.addChild(this.var_3325);
            this.var_170.addChild(this.var_3324);
            this.var_3325.setMaterial(this.sfxData.method_2499(),-1);
            this.var_3324.name_1433(this.sfxData.name_1782);
            this.var_3324.name_1431(0);
         }
         if(this.var_3323.parent == null)
         {
            this.var_170.addChild(this.var_3323);
         }
         this.var_3323.name_1433(this.sfxData.name_1780);
         this.var_3323.name_1431(0);
      }
      
      private function method_3005(param1:Vector.<Material>) : Material
      {
         return param1[int(Math.random() * param1.length)];
      }
   }
}
