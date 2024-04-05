package package_417
{
   import alternativa.engine3d.materials.Material;
   import alternativa.tanks.sfx.name_2500;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class TrailEffect2 extends class_30 implements name_2407
   {
      
      private static const const_2315:Number = 48;
       
      
      private var position:Vector3;
      
      private var direction:Vector3;
      
      private var var_759:Number;
      
      private var var_750:int;
      
      private var beam:Trail2;
      
      private var var_170:name_175;
      
      public function TrailEffect2(param1:ObjectPool)
      {
         this.position = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.beam = new Trail2();
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Number, param4:Number, param5:Material, param6:int) : void
      {
         this.position.vCopy(param1);
         this.direction.vCopy(param2);
         this.var_750 = param6;
         this.var_759 = 1 / param6;
         this.beam.init(48,param3,param4,param5);
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.var_750 < 0)
         {
            return false;
         }
         this.var_750 -= param1;
         this.beam.alpha -= this.var_759 * param1;
         name_2500.name_2503(this.beam,this.position,this.direction,param2.pos);
         return true;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.beam);
      }
      
      public function destroy() : void
      {
         this.var_170.removeChild(this.beam);
         this.var_170 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return TrailEffect1;
      }
      
      public function kill() : void
      {
         this.var_750 = -1;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
   }
}
