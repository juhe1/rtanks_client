package alternativa.tanks.models.tank.spawn
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.logic.class_23;
   import flash.utils.getTimer;
   import package_53.name_94;
   import platform.client.fp10.core.type.name_70;
   
   public class name_1217 implements class_23
   {
      
      public static var lobbyLayoutService:name_94 = OSGi.getInstance().getService(name_94) as name_94;
       
      
      private var var_450:name_70;
      
      private var var_211:int;
      
      public function name_1217(param1:int, param2:name_70)
      {
         super();
         this.var_450 = param2;
         this.var_211 = getTimer() + param1;
      }
      
      public function method_504(param1:int, param2:int) : void
      {
         if(this.var_450 && param1 >= this.var_211 && !lobbyLayoutService.name_215() && !lobbyLayoutService.isSwitchInProgress())
         {
            name_279(this.var_450.name_176(name_279)).setReadyToPlace();
         }
      }
      
      public function name_1219(param1:name_70) : void
      {
         this.var_450 = param1;
      }
   }
}
