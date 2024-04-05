package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.sfx.name_2314;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_61.name_124;
   import package_76.name_735;
   
   public class name_1717 extends class_30 implements name_2314
   {
      
      private static const var_515:Matrix4 = new Matrix4();
      
      private static const name_1422:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const const_2011:Vector3 = new Vector3();
      
      private static const const_2010:Vector3 = new Vector3();
      
      private static const var_711:name_124 = new name_124();
      
      private static const const_438:Number = 20;
      
      private static const const_2021:Number = 0.2;
       
      
      private var maxDistance:Number;
      
      private var name_247:TanksCollisionDetector;
      
      private var var_2453:Vector3;
      
      private var turret:Object3D;
      
      private var var_2475:Number;
      
      private var var_2474:Number = 0;
      
      public function name_1717(param1:ObjectPool)
      {
         this.var_2453 = new Vector3();
         super(param1);
      }
      
      private function method_2478() : void
      {
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         const_2011.x = var_515.m00;
         const_2011.y = var_515.m10;
         const_2011.z = var_515.m20;
         direction.x = var_515.m01;
         direction.y = var_515.m11;
         direction.z = var_515.m21;
         var_515.name_890(this.var_2453,const_2010);
         var _loc1_:Number = this.var_2453.y;
         name_1422.x = const_2010.x - _loc1_ * direction.x;
         name_1422.y = const_2010.y - _loc1_ * direction.y;
         name_1422.z = const_2010.z - _loc1_ * direction.z;
      }
      
      public function init(param1:Object3D, param2:Vector3, param3:TanksCollisionDetector, param4:Number, param5:Number = 0.5) : void
      {
         this.turret = param1;
         this.var_2453 = param2;
         this.name_247 = param3;
         this.maxDistance = param4;
         this.var_2475 = param5;
         this.var_2474 = 0;
      }
      
      public function name_2316(param1:Object3D) : void
      {
         this.method_2478();
         var _loc2_:Number = this.maxDistance * this.var_2475;
         if(this.name_247.name_251(name_1422,direction,name_73.name_252,this.maxDistance,null,var_711))
         {
            _loc2_ = Vector3.distanceBetween(name_1422,var_711.position) * this.var_2475;
         }
         var _loc3_:Number = _loc2_ - this.var_2474;
         if(Math.abs(_loc3_) <= 20)
         {
            this.var_2474 = _loc2_;
         }
         else
         {
            this.var_2474 += _loc3_ * 0.2;
         }
         param1.x = name_1422.x + direction.x * this.var_2474;
         param1.y = name_1422.y + direction.y * this.var_2474;
         param1.z = name_1422.z + direction.z * this.var_2474;
      }
      
      public function name_2315(param1:Object3D, param2:name_735, param3:int) : void
      {
         this.name_2316(param1);
      }
      
      public function destroy() : void
      {
         this.turret = null;
         this.name_247 = null;
         method_584;
      }
      
      override protected function getClass() : Class
      {
         return name_1717;
      }
   }
}
