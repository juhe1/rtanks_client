package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import package_238.ObjectPool;
   import package_37.Vector3;
   import package_68.name_175;
   
   public class name_3276 extends ParticleSystem
   {
      
      private static const const_2788:int = 5;
       
      
      private var size:Number;
      
      private var speed:Number;
      
      private var top:Number;
      
      private var var_3620:Vector3;
      
      private var animation:name_1072;
      
      private var var_170:name_175;
      
      public function name_3276(param1:Number, param2:Number, param3:Number, param4:Number, param5:ObjectPool)
      {
         this.var_3620 = new Vector3();
         super(name_3551,param4,5,param5);
         this.size = param1;
         this.speed = param2;
         this.top = param3;
      }
      
      public function name_3278(param1:name_1072) : void
      {
         this.animation = param1;
      }
      
      public function name_1239(param1:name_175) : void
      {
         this.var_170 = param1;
      }
      
      public function name_3277(param1:Vector3) : void
      {
         this.var_3620.vCopy(param1);
      }
      
      override protected function method_3237(param1:name_3550) : void
      {
         var _loc2_:name_3551 = name_3551(param1);
         _loc2_.init(this.size,this.var_3620,Math.random() * Math.PI * 2,this.animation);
         this.var_170.addChild(_loc2_.sprite);
      }
      
      override protected function method_3235(param1:name_3550, param2:Number) : void
      {
         var _loc4_:AnimatedSprite3D = null;
         var _loc3_:name_3551 = null;
         _loc3_ = name_3551(param1);
         _loc4_ = _loc3_.sprite;
         _loc4_.update(param2);
         _loc4_.z += this.speed * param2;
         var _loc5_:Number = 1 - Math.abs(this.top / 2 - (_loc4_.z - _loc3_.name_3552)) * 2 / this.top;
         _loc4_.alpha = _loc5_;
         _loc4_.rotation = _loc3_.rotation + _loc5_ * 0.3;
         if(_loc4_.z - _loc3_.name_3552 >= this.top)
         {
            _loc3_.alive = false;
         }
      }
      
      override protected function method_3234(param1:name_3550) : void
      {
         this.var_170.removeChild(name_3551(param1).sprite);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.animation = null;
         this.var_170 = null;
      }
   }
}
