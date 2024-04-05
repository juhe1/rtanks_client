package package_247
{
   import alternativa.tanks.models.battlefield.BattleView3D;
   
   public class name_684
   {
       
      
      private var view:BattleView3D;
      
      public function name_684(param1:BattleView3D)
      {
         super();
         this.view = param1;
      }
      
      public function on() : void
      {
         this.view.camera.softTransparency = true;
         this.view.camera.softTransparencyStrength = 1;
      }
      
      public function off() : void
      {
         this.view.camera.useShadowMap = false;
         this.view.camera.useLight = false;
      }
   }
}
