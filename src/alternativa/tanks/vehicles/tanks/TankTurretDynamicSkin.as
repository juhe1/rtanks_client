package alternativa.tanks.vehicles.tanks
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import package_418.CircleDynamicSkin;
   import package_418.CylinderDynamicSkin;
   import package_418.name_2416;
   
   public class TankTurretDynamicSkin
   {
      
      private static const const_1786:String = "barrel";
      
      private static const const_1789:String = "muzzle";
      
      private static const const_1787:String = "band";
      
      private static const const_1788:String = "band_m";
       
      
      private var var_2032:name_2416;
      
      private var var_2030:name_2416;
      
      private var var_2031:name_2416;
      
      private var var_2029:name_2416;
      
      private var _skins:Vector.<name_2416>;
      
      public function TankTurretDynamicSkin(param1:Mesh)
      {
         super();
         this.init(param1);
      }
      
      public function init(param1:Mesh) : void
      {
         var _loc2_:Face = null;
         for each(_loc2_ in param1.faces)
         {
            if(_loc2_.material.name == "barrel")
            {
               this.method_2114();
               this.var_2032.addFace(_loc2_);
            }
            else if(_loc2_.material.name == "muzzle")
            {
               this.method_2114();
               this.var_2030.addFace(_loc2_);
            }
            else if(_loc2_.material.name == "band")
            {
               this.method_2114();
               this.var_2031.addFace(_loc2_);
            }
            else if(_loc2_.material.name == "band_m")
            {
               this.method_2114();
               this.var_2029.addFace(_loc2_);
            }
         }
         if(this._skins != null)
         {
            this.var_2032.init();
            this.var_2030.init();
            this.var_2031.init();
            this.var_2029.init();
         }
      }
      
      private function method_2114() : void
      {
         if(this._skins == null)
         {
            this._skins = new Vector.<name_2416>();
            this.var_2032 = new CylinderDynamicSkin(17 / 256);
            this.var_2030 = new CircleDynamicSkin(137.5 / 256,188 / 256);
            this.var_2031 = new CylinderDynamicSkin(9 / 256);
            this.var_2029 = new CircleDynamicSkin(17 / 256,104 / 256);
            this._skins.push(this.var_2032);
            this._skins.push(this.var_2030);
            this._skins.push(this.var_2031);
            this._skins.push(this.var_2029);
         }
      }
      
      public function setMaterial(param1:TextureMaterial) : void
      {
         var _loc2_:name_2416 = null;
         if(this.method_2115())
         {
            for each(_loc2_ in this._skins)
            {
               _loc2_.setMaterial(param1);
            }
         }
      }
      
      private function method_2115() : Boolean
      {
         return this._skins != null;
      }
      
      public function get method_2119() : name_2416
      {
         return this.var_2032;
      }
      
      public function get method_2118() : name_2416
      {
         return this.var_2030;
      }
      
      public function get method_2117() : name_2416
      {
         return this.var_2031;
      }
      
      public function get method_2116() : name_2416
      {
         return this.var_2029;
      }
      
      public function destroy() : void
      {
         this._skins = null;
         this.var_2032 = null;
         this.var_2030 = null;
         this.var_2031 = null;
         this.var_2029 = null;
      }
   }
}
