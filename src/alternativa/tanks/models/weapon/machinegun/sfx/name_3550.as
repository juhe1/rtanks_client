package alternativa.tanks.models.weapon.machinegun.sfx
{
   import package_238.ObjectPool;
   import package_238.class_30;
   
   public class name_3550 extends class_30
   {
       
      
      private var var_3046:Boolean;
      
      public function name_3550(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function get alive() : Boolean
      {
         return this.var_3046;
      }
      
      public function set alive(param1:Boolean) : void
      {
         this.var_3046 = param1;
      }
   }
}
