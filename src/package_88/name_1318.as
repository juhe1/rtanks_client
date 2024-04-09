package package_88
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_1229;
   import alternativa.tanks.models.battlefield.IBattleField;
   import package_1.Main;
   import package_37.Vector3;
   
   public class name_1318 extends name_1317 implements name_1229
   {
      
      public static const const_1834:int = 1000;
      
      public static const const_1835:int = 3000;
       
      
      private var var_2168:Boolean;
      
      private var var_2169:Boolean;
      
      private var var_2170:Boolean;
      
      private var var_2167:name_2498;
      
      private var battleService:BattlefieldModel;
      
      public function name_1318(param1:Mesh, param2:Vector3)
      {
         super(param1,param2,true);
         this.var_2167 = new name_2498();
         this.battleService = Main.osgi.getService(IBattleField) as BattlefieldModel;
      }
      
      override public function name_1322() : void
      {
         super.name_1322();
         this.battleService.var_117.viewport.name_755(this,0);
      }
      
      override public function name_1327() : void
      {
         super.name_1327();
         this.battleService.var_117.viewport.method_776(this,0);
      }
      
      override public function hide() : void
      {
         this.var_2169 = true;
         this.var_2167.init(this.battleService.name_165().method_923(),3000,1);
      }
      
      override public function show() : void
      {
         this.var_2168 = true;
         this.var_2167.init(this.battleService.name_165().method_923(),1000,0);
      }
      
      override public function name_1324() : void
      {
         this.var_2170 = true;
         this.hide();
      }
      
      public function render(param1:int, param2:int) : void
      {
         if(this.var_2168)
         {
            mesh.alpha = this.method_2229(param1);
            if(mesh.alpha == 1)
            {
               this.var_2168 = false;
            }
         }
         if(this.var_2169)
         {
            mesh.alpha = this.method_2228(param1);
            if(mesh.alpha == 0)
            {
               this.var_2169 = false;
               if(this.var_2170)
               {
                  this.name_1327();
               }
            }
         }
      }
      
      private function method_2228(param1:int) : Number
      {
         return this.var_2167.name_2499(param1,false);
      }
      
      private function method_2229(param1:int) : Number
      {
         return this.var_2167.name_2499(param1,true);
      }
   }
}
