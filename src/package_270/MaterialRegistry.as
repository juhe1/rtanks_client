package package_270
{
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.dump.name_524;
   import alternativa.tanks.engine3d.IndexedTextureConstructor;
   import alternativa.tanks.engine3d.MaterialSequenceRegistry;
   import alternativa.tanks.engine3d.TextureMaterialRegistry;
   import alternativa.tanks.engine3d.name_966;
   import alternativa.tanks.engine3d.name_968;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import alternativa.tanks.vehicles.tanks.SkinTextureRegistry;
   import alternativa.tanks.vehicles.tanks.name_967;
   import package_242.name_662;
   import package_242.name_679;
   import package_34.class_3;
   
   public class MaterialRegistry implements IMaterialRegistry, class_3
   {
      
      private static const const_1603:int = 60;
       
      
      private var var_1610:name_679;
      
      private var var_1609:name_679;
      
      private var var_1611:name_679;
      
      private var var_1612:name_662;
      
      private var var_1606:TextureMaterialRegistry;
      
      private var var_1607:MaterialSequenceRegistry;
      
      private var var_1605:TextureMaterialRegistry;
      
      private var var_1608:SkinTextureRegistry;
      
      public function MaterialRegistry(param1:OSGi)
      {
         this.var_1610 = new name_679("tmr_timer_interval",60,30,1000,this.method_1788);
         this.var_1609 = new name_679("mmr_timer_interval",60,30,1000,this.method_1788);
         this.var_1611 = new name_679("msr_timer_interval",60,30,1000,this.method_1788);
         this.var_1612 = new name_662("tex_res",5.8,0,100,this.method_1789);
         this.var_1606 = new TextureMaterialRegistry(60);
         this.var_1607 = new MaterialSequenceRegistry(60);
         this.var_1605 = new TextureMaterialRegistry(60);
         this.var_1608 = new SkinTextureRegistry();
         super();
         var _loc2_:name_524 = name_524(param1.getService(name_524));
         if(_loc2_ != null)
         {
            _loc2_.registerDumper(this);
         }
      }
      
      public function get useMipMapping() : Boolean
      {
         return this.var_1606.useMipMapping;
      }
      
      public function set useMipMapping(param1:Boolean) : void
      {
         this.var_1606.useMipMapping = param1;
         this.var_1607.useMipMapping = param1;
         this.var_1605.useMipMapping = param1;
      }
      
      public function get textureMaterialRegistry() : name_966
      {
         return this.var_1606;
      }
      
      public function get method_499() : name_968
      {
         return this.var_1607;
      }
      
      public function get method_500() : name_966
      {
         return this.var_1605;
      }
      
      public function get method_497() : name_967
      {
         return this.var_1608;
      }
      
      public function clear() : void
      {
         this.var_1606.clear();
         this.var_1607.clear();
         this.var_1605.clear();
         this.var_1608.clear();
         TextureResourcesRegistry.releaseTextureResources();
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         return this.var_1606.name_2166() + this.var_1607.name_2166() + this.var_1605.name_2166();
      }
      
      public function get dumperName() : String
      {
         return "materials";
      }
      
      public function method_498() : IndexedTextureConstructor
      {
         return new IndexedTextureConstructor();
      }
      
      private function method_1788(param1:name_679) : void
      {
         switch(param1)
         {
            case this.var_1610:
               this.var_1606.timerInterval = param1.value;
               break;
            case this.var_1609:
               this.var_1605.timerInterval = param1.value;
               break;
            case this.var_1611:
               this.var_1607.timerInterval = param1.value;
         }
      }
      
      private function method_1789(param1:name_662) : void
      {
         this.var_1605.resoluion = param1.value;
      }
   }
}
