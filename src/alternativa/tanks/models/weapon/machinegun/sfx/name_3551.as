package alternativa.tanks.models.weapon.machinegun.sfx
{
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.sfx.name_2500;
   import package_238.ObjectPool;
   import package_37.Vector3;
   
   public class name_3551 extends name_3550
   {
       
      
      private var var_1409:Number;
      
      private var var_3719:Number;
      
      private var var_3718:AnimatedSprite3D;
      
      public function name_3551(param1:ObjectPool)
      {
         this.var_3718 = new AnimatedSprite3D(1,1);
         super(param1);
         name_2500.method_2887(this.var_3718);
      }
      
      public function init(param1:Number, param2:Vector3, param3:Number, param4:name_1072) : void
      {
         this.var_3718.width = param1;
         this.var_3718.height = param1;
         this.var_3718.name_1433(param4);
         this.var_3718.x = param2.x;
         this.var_3718.y = param2.y;
         this.var_3718.z = param2.z;
         this.var_3718.rotation = param3;
         this.var_1409 = param3;
         this.var_3719 = param2.z;
      }
      
      public function get sprite() : AnimatedSprite3D
      {
         return this.var_3718;
      }
      
      public function get rotation() : Number
      {
         return this.var_1409;
      }
      
      public function get name_3552() : Number
      {
         return this.var_3719;
      }
   }
}
