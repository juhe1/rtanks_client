package package_45
{
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_1.Main;
   import package_242.name_679;
   import package_4.ClientObject;
   import package_68.name_175;
   import package_7.name_32;
   import package_76.name_735;
   
   public class name_172 implements name_657
   {
      
      private static var modelService:name_32 = name_32(Main.osgi.name_6(name_32));
      
      private static var delay:name_679 = new name_679("tankexpl_goffset",110,0,2000);
       
      
      private var tankData:TankData;
      
      private var time:int;
      
      private var killed:Boolean;
      
      public function name_172(param1:TankData)
      {
         super();
         this.tankData = param1;
      }
      
      public function destroy() : void
      {
         this.tankData = null;
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
         if(this.time >= delay.value)
         {
            this.method_739();
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
      
      private function method_739() : void
      {
         var _loc1_:Tank = this.tankData.tank;
         if(_loc1_.skin.name_123.parent == null)
         {
            return;
         }
         var _loc2_:TankCriticalHitModel = Main.osgi.name_6(name_91) as TankCriticalHitModel;
         _loc2_.method_502(this.tankData.hull,this.tankData);
      }
   }
}
