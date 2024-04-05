package package_157
{
   import alternativa.engine3d.materials.Material;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_1806 extends class_30 implements name_657
   {
       
      
      private var var_170:name_175;
      
      private var trail:name_2713;
      
      private var var_2528:Vector3;
      
      private var direction:Vector3;
      
      private var var_2529:Number;
      
      private var var_2530:Number;
      
      private var var_2531:Number;
      
      private var var_2527:int;
      
      private var time:int;
      
      public function name_1806(param1:ObjectPool)
      {
         this.var_2528 = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.trail = new name_2713();
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Material, param4:Number, param5:Number, param6:Number, param7:Number, param8:int) : void
      {
         this.var_2528.vCopy(param1);
         this.direction.diff(param2,param1);
         var _loc9_:Number = this.direction.vLength();
         this.direction.scale(1 / _loc9_);
         this.var_2529 = param5;
         this.var_2530 = param6;
         this.var_2531 = param7;
         this.var_2527 = param8;
         this.trail.init(param4,_loc9_,param3,param7);
         this.time = 0;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc3_ = NaN;
         if(this.time > this.var_2527)
         {
            return false;
         }
         name_2500.name_2503(this.trail,this.var_2528,this.direction,param2.pos);
         _loc4_ = this.time / this.var_2527;
         _loc3_ = Math.sqrt(_loc4_);
         this.trail.scaleX = this.var_2529 + (this.var_2530 - this.var_2529) * _loc3_;
         this.trail.alpha = 1 - _loc4_;
         this.trail.update(_loc3_);
         this.time += param1;
         return true;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.trail);
      }
      
      public function destroy() : void
      {
         this.trail.clear();
         this.var_170.removeChild(this.trail);
         this.var_170 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return name_1806;
      }
      
      public function kill() : void
      {
         this.time = this.var_2527 + 1;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
