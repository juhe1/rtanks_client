package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.tanks.sfx.name_2500;
   import package_238.ObjectPool;
   import package_37.Vector3;
   
   public class name_3553 extends name_3550
   {
       
      
      private var var_3718:Sprite3D;
      
      private var _direction:Vector3;
      
      private var const_367:Number = 0;
      
      public function name_3553(param1:ObjectPool)
      {
         this.var_3718 = new Sprite3D(1,1);
         this._direction = new Vector3();
         super(param1);
         name_2500.method_2887(this.var_3718);
      }
      
      public function init(param1:Number, param2:Vector3, param3:Vector3, param4:TextureMaterial) : void
      {
         this.const_367 = 0;
         this._direction.vCopy(param3);
         this.var_3718.width = param1;
         this.var_3718.height = param1;
         this.var_3718.x = param2.x;
         this.var_3718.y = param2.y;
         this.var_3718.z = param2.z;
         this.var_3718.material = param4;
      }
      
      public function get sprite() : Sprite3D
      {
         return this.var_3718;
      }
      
      public function get direction() : Vector3
      {
         return this._direction;
      }
      
      public function get time() : Number
      {
         return this.const_367;
      }
      
      public function set time(param1:Number) : void
      {
         this.const_367 = param1;
      }
   }
}
