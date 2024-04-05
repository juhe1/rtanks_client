package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.models.weapon.machinegun.name_2410;
   import alternativa.tanks.sfx.name_1071;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_2687 extends class_30 implements name_657
   {
      
      private static const const_2569:Number = 90;
      
      private static const const_2568:Number = 200;
      
      private static const const_2567:Number = 60;
      
      private static const const_2570:Number = 0.15;
      
      private static const const_2310:Number = 0.25;
      
      private static const const_2565:Object3D = new Object3D();
      
      private static const const_2566:Vector3 = new Vector3();
       
      
      private var dust:name_3276;
      
      private var var_3310:name_3279;
      
      private var var_1871:name_1071;
      
      private var time:Number;
      
      public function name_2687(param1:ObjectPool)
      {
         super(param1);
         this.dust = new name_3276(90,200,60,0.15,objectPool);
         this.var_3310 = new name_3279(objectPool);
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_3310.name_1239(param1);
         this.var_3310.start();
         this.dust.name_1239(param1);
         this.dust.start();
      }
      
      public function init(param1:name_1071, param2:name_2410) : void
      {
         this.var_1871 = param1;
         param1.name_2316(const_2565);
         this.dust.name_3278(param2.dustTexture);
         this.var_3310.setMaterial(param2.crumbsTexture);
         this.time = 0;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         this.var_1871.name_2315(const_2565,param2,param1);
         this.method_2986();
         var _loc3_:Number = param1 / 1000;
         this.time += _loc3_;
         if(this.time >= 0.25)
         {
            this.dust.stop();
            this.var_3310.stop();
         }
         var _loc4_:Boolean = this.dust.update(_loc3_);
         return Boolean(this.var_3310.update(_loc3_) || _loc4_);
      }
      
      private function method_2986() : void
      {
         const_2566.x = const_2565.x;
         const_2566.y = const_2565.y;
         const_2566.z = const_2565.z;
         this.dust.name_3277(const_2566);
         this.var_3310.name_3277(const_2566);
      }
      
      public function destroy() : void
      {
         this.dust.clear();
         this.var_3310.clear();
         this.var_1871.destroy();
         this.var_1871 = null;
      }
      
      public function kill() : void
      {
         this.dust.stop();
         this.var_3310.stop();
      }
   }
}
