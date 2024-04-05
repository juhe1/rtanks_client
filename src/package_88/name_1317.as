package package_88
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import package_1.Main;
   import package_37.Vector3;
   
   public class name_1317
   {
      
      public static var battleService:BattlefieldModel = Main.osgi.name_6(name_83) as BattlefieldModel;
       
      
      protected var mesh:Mesh;
      
      protected var position:Vector3;
      
      public function name_1317(param1:Mesh, param2:Vector3, param3:Boolean)
      {
         super();
         this.mesh = param1;
         this.position = param2;
         param1.visible = param3;
      }
      
      public function name_1322() : void
      {
         battleService.var_117.viewport.name_257().addChild(this.mesh);
      }
      
      public function name_1327() : void
      {
         battleService.var_117.viewport.name_257().removeChild(this.mesh);
         this.mesh = null;
      }
      
      public function name_1319() : void
      {
         this.mesh.visible = true;
      }
      
      public function name_1329() : void
      {
         this.mesh.visible = false;
      }
      
      public function show() : void
      {
         this.mesh.visible = true;
      }
      
      public function hide() : void
      {
         this.mesh.visible = false;
      }
      
      public function name_1324() : void
      {
         this.hide();
         this.name_1327();
      }
      
      public function method_1848() : Vector3
      {
         return this.position;
      }
   }
}
