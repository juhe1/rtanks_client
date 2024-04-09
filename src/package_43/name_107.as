package package_43
{
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_1.Main;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_76.name_735;
   
   public class name_107 extends class_30 implements name_657
   {
       
      
      private var time:int;
      
      private var killed:Boolean;
      
      public function name_107(param1:ObjectPool)
      {
         super(param1);
      }
      
      public function destroy() : void
      {
         method_584();
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.killed)
         {
            return false;
         }
         if(this.time >= 110)
         {
            return false;
         }
         this.time += param1;
         return true;
      }
      
      public function kill() : void
      {
         this.killed = true;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.time = 0;
         this.killed = false;
      }
      
      override protected function getClass() : Class
      {
         return name_107;
      }
      
      public function name_248(param1:TankData) : void
      {
         var _loc2_:Tank = param1.tank;
         if(_loc2_.skin.name_123.parent == null)
         {
            return;
         }
         _loc2_.state.name_187.z += 500;
         _loc2_.state.name_181.reset(2,2,2);
         _loc2_.skin.name_242();
         _loc2_.skin.name_261();
         var _loc3_:TankExplosionModel = Main.osgi.getService(name_93) as TankExplosionModel;
         _loc3_.method_502(param1.hull,param1);
      }
   }
}
