package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.weapon.machinegun.name_2410;
   import alternativa.tanks.sfx.AnimatedPlane;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import flash.display.BlendMode;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_2688 extends class_30 implements name_657
   {
      
      private static const const_2001:int = 150;
      
      private static const const_2007:int = 200;
      
      private static const const_2559:int = 50;
      
      private static const const_2557:Number = 150;
      
      private static const const_2561:Number = 210;
      
      private static const const_2558:Number = -10;
      
      private static const const_2556:Number = 130;
      
      private static const const_2555:Number = 35;
      
      private static const const_2562:Number = 60;
      
      private static const const_101:Number = 170;
      
      private static const const_2554:Number = 300;
      
      private static const const_2553:Number = 170;
      
      private static const const_2563:Number = 0.3;
      
      private static const const_2560:Number = 50;
      
      private static const const_2564:Number = 22222;
      
      private static const const_114:Vector3 = new Vector3();
       
      
      private const var_3098:AnimatedPlane = new AnimatedPlane(150,210,0,210 * 0.5,0);
      
      private const var_3096:AnimatedPlane = new AnimatedPlane(130,130,0,0,0);
      
      private const var_3101:AnimatedSprite3D = new AnimatedSprite3D(150,150);
      
      private const const_2551:AnimatedSprite3D = new AnimatedSprite3D(200,200);
      
      private const const_2552:name_3275 = new name_3275();
      
      private var var_3306:Vector3;
      
      private var smoke:name_3276;
      
      private var var_664:Vector3;
      
      private var time:Number = 0;
      
      private var var_170:name_175;
      
      private var var_3309:name_2410;
      
      private var turret:Object3D;
      
      private var var_3307:name_1071;
      
      private var method_625:Boolean;
      
      private var method_1005:Boolean;
      
      private var var_2445:Boolean;
      
      private var var_2446:Boolean;
      
      private var var_3308:Boolean;
      
      private var name_1421:Vector3;
      
      private var direction:Vector3;
      
      private var name_1422:Vector3;
      
      private var name_1603:Boolean;
      
      public function name_2688(param1:ObjectPool)
      {
         this.var_3306 = new Vector3();
         this.var_664 = new Vector3(1,4,6);
         super(param1);
         this.smoke = new name_3276(170,300,170,0.3,objectPool);
         name_2500.method_2887(this.var_3098);
         name_2500.method_2887(this.var_3096);
      }
      
      public function init(param1:Object3D, param2:name_2410, param3:Vector3, param4:Vector3) : void
      {
         this.name_1422 = param4;
         this.var_3309 = param2;
         this.turret = param1;
         this.name_1421 = param3;
         this.method_2235();
         this.method_2981(param2);
         this.smoke.name_3278(param2.smokeTexture);
         this.const_2552.init(param2.tracerTexture);
         this.var_3307 = name_1071(objectPool.getObject(name_1071));
         this.var_3307.init(this.var_664,50);
         this.var_3101.name_1433(param2.sparklesTexture);
         this.var_3101.name_1432 = true;
         this.const_2551.name_1433(param2.tankSparklesTexture);
         this.const_2551.name_1432 = true;
         this.time = 0;
         this.var_2445 = false;
         this.var_3308 = false;
      }
      
      public function name_2690(param1:Vector3, param2:Vector3) : void
      {
         this.name_1421 = param1;
         this.name_1422 = param2;
      }
      
      private function method_2235() : void
      {
         this.direction = this.name_1421.vClone();
         this.direction.subtract(this.name_1422);
         this.direction.vNormalize();
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_3098);
         param1.addChild(this.var_3096);
         param1.addChild(this.const_2552);
         param1.addChild(this.var_3101);
         param1.addChild(this.const_2551);
         this.smoke.name_1239(param1);
         this.smoke.start();
         this.const_2552.visible = true;
         this.var_3098.visible = true;
         this.var_3096.visible = true;
         this.method_1005 = true;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         this.method_2235();
         var _loc3_:Number = param1 / 1000;
         this.method_2883(param2);
         this.method_2982(_loc3_,param2,param1);
         this.method_2983(_loc3_);
         this.time += _loc3_;
         return this.method_625 || this.method_1005;
      }
      
      public function name_1711(param1:Vector3, param2:Boolean) : void
      {
         this.var_664.vCopy(param1);
         this.var_2445 = true;
         this.var_2446 = param2;
      }
      
      public function name_1710(param1:Boolean) : void
      {
         this.var_2445 = false;
         this.var_3308 = param1;
      }
      
      public function destroy() : void
      {
         this.kill();
         this.var_3096.clear();
         this.var_3098.clear();
         this.smoke.clear();
         this.var_3101.clear();
         this.const_2551.clear();
         this.var_170 = null;
         this.var_3309 = null;
         this.turret = null;
         this.var_3307.destroy();
         this.var_3307 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_2688;
      }
      
      public function kill() : void
      {
         this.var_170.removeChild(this.var_3098);
         this.var_170.removeChild(this.var_3096);
         this.var_170.removeChild(this.const_2552);
         this.var_170.removeChild(this.var_3101);
         this.var_170.removeChild(this.const_2551);
         this.stop();
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function stop() : void
      {
         this.smoke.stop();
         this.const_2552.visible = false;
         this.var_3098.visible = false;
         this.var_3096.visible = false;
         this.var_3101.visible = false;
         this.const_2551.visible = false;
         this.method_1005 = false;
      }
      
      private function method_2981(param1:name_2410) : void
      {
         var _loc2_:name_1072 = param1.fireAlongTexture;
         this.var_3098.init(_loc2_,_loc2_.fps);
         this.var_3098.blendMode = BlendMode.ADD;
         var _loc3_:name_1072 = param1.fireAcrossTexture;
         this.var_3096.init(_loc3_,_loc3_.fps);
         this.var_3096.blendMode = BlendMode.ADD;
         this.method_2979();
      }
      
      private function method_2979() : void
      {
         var _loc1_:Number = this.direction.x;
         var _loc2_:Number = this.direction.y;
         this.var_3096.rotationX = Math.atan2(this.direction.z,Math.sqrt(_loc1_ * _loc1_ + _loc2_ * _loc2_)) - Math.PI / 2;
         this.var_3096.rotationY = 0;
         this.var_3096.rotationZ = -Math.atan2(_loc1_,_loc2_);
      }
      
      private function method_2883(param1:name_735) : void
      {
         name_2500.name_3074(this.var_3098,param1.pos,this.direction,false,8,0.9);
         name_2500.name_3074(this.var_3096,param1.pos,this.direction,true,4,0.3);
         this.method_2978(this.name_1421,this.direction,-10,const_114);
         name_2500.name_2503(this.var_3098,const_114,this.direction,param1.pos);
         this.var_3098.setTime(this.time % this.var_3098.name_2329());
         this.method_2979();
         this.method_2985(this.var_3096,this.name_1421,this.direction,35);
         this.var_3096.setTime(this.time % this.var_3096.name_2329());
      }
      
      private function method_2982(param1:Number, param2:name_735, param3:int) : void
      {
         var _loc4_:Number = NaN;
         if(this.var_2445)
         {
            this.var_3306 = this.var_664.vClone();
            this.var_3306.subtract(this.name_1421);
            _loc4_ = this.var_3306.vLength();
            this.var_3306.normalize();
            this.method_2984(param1,param2,param3);
         }
         else
         {
            _loc4_ = this.var_3308 ? Number(0) : Number(22222);
            this.var_3306.vCopy(this.direction);
            this.method_2980();
         }
         this.method_2978(this.name_1421,this.direction,50,const_114);
         name_2500.name_2503(this.const_2552,const_114,this.var_3306,param2.pos);
         this.const_2552.update(param3,_loc4_ - 50);
      }
      
      private function method_2984(param1:Number, param2:name_735, param3:int) : void
      {
         this.method_2980();
         var _loc4_:AnimatedSprite3D = this.var_2446 ? this.const_2551 : this.var_3101;
         _loc4_.visible = this.method_1005;
         _loc4_.update(param1);
         this.var_3307.init(this.var_664,50);
         this.var_3307.name_2315(_loc4_,param2,param3);
      }
      
      private function method_2980() : void
      {
         this.var_3101.visible = false;
         this.const_2551.visible = false;
      }
      
      private function method_2983(param1:Number) : void
      {
         this.method_2978(this.name_1421,this.direction,60,const_114);
         this.smoke.name_3277(const_114);
         this.method_625 = this.smoke.update(param1);
      }
      
      private function method_2978(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         param4.vCopy(param1).vAddScaled(param3,param2);
      }
      
      private function method_2985(param1:Object3D, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         param1.x = param2.x + param4 * param3.x;
         param1.y = param2.y + param4 * param3.y;
         param1.z = param2.z + param4 * param3.z;
      }
   }
}
