package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import package_238.ObjectPool;
   import package_37.Vector3;
   import package_68.name_175;
   
   public class name_3279 extends ParticleSystem
   {
      
      private static const const_2792:Number = 130;
      
      private static const name_424:Number = 6;
      
      private static const const_2791:Number = 0.2;
      
      private static const const_2790:Number = 20;
      
      private static const const_2738:int = 0;
      
      private static const const_2788:int = 5;
      
      private static const name_3285:Number = 0.1;
      
      private static const const_2789:Vector3 = new Vector3();
       
      
      private var var_3620:Vector3;
      
      private var material:TextureMaterial;
      
      private var var_170:name_175;
      
      public function name_3279(param1:ObjectPool)
      {
         this.var_3620 = new Vector3();
         super(name_3553,0,5,param1);
      }
      
      public function setMaterial(param1:TextureMaterial) : void
      {
         this.material = param1;
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
         var _loc2_:name_3553 = name_3553(param1);
         var _loc3_:Number = 130 + Math.random() * 130 / 2;
         var _loc4_:Sprite3D = _loc2_.sprite;
         const_2789.x = Math.random() * 2 - 1;
         const_2789.y = -Math.random();
         const_2789.z = Math.random() * 2 - 1;
         const_2789.normalize();
         const_2789.scale(6);
         _loc2_.init(_loc3_,this.var_3620,const_2789,this.material);
         this.var_170.addChild(_loc4_);
      }
      
      override protected function method_3235(param1:name_3550, param2:Number) : void
      {
         var _loc3_:name_3553 = name_3553(param1);
         var _loc4_:Sprite3D = _loc3_.sprite;
         var _loc5_:Vector3 = _loc3_.direction;
         _loc5_.z -= 20 * param2;
         _loc4_.x += _loc5_.x;
         _loc4_.y += _loc5_.y;
         _loc4_.z += _loc5_.z;
         _loc3_.time += param2;
         if(_loc3_.time > 0.2)
         {
            _loc3_.time = 0.2;
         }
         _loc4_.alpha = 1 - _loc3_.time / 0.2;
         var _loc6_:Number = 1 - _loc4_.alpha;
         if(_loc6_ < 0.1)
         {
            _loc6_ = 0.1;
         }
         _loc4_.scaleX = _loc6_;
         _loc4_.scaleY = _loc6_;
         _loc4_.scaleZ = _loc6_;
         if(_loc4_.alpha <= 0)
         {
            _loc3_.alive = false;
         }
      }
      
      override protected function method_3234(param1:name_3550) : void
      {
         this.var_170.removeChild(name_3553(param1).sprite);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.material = null;
         this.var_170 = null;
      }
   }
}
