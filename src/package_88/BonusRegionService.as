package package_88
{
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Decal;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.engine3d.name_1076;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.name_108;
   import alternativa.tanks.services.materialregistry.name_100;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import package_1.Main;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_61.name_124;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   
   public class BonusRegionService
   {
      
      public static var settings:name_108;
      
      private static const const_372:name_124 = new name_124();
      
      private static const m:Matrix3 = new Matrix3();
      
      private static const m1:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const const_64:Vector3 = new Vector3();
      
      private static const const_417:Vector3 = new Vector3();
      
      private static const const_419:int = 500;
      
      private static const const_418:Number = 5;
      
      private static var var_621:BitmapData;
       
      
      private var battlefield:BattlefieldModel;
      
      private var var_618:Dictionary;
      
      private var var_620:Boolean;
      
      private var var_622:Boolean;
      
      private var var_619:Dictionary;
      
      public function BonusRegionService(param1:BattlefieldModel)
      {
         super();
         this.battlefield = param1;
         this.var_619 = new Dictionary();
         this.method_862();
      }
      
      private static function method_857(param1:Vector3, param2:Vector3, param3:TextureMaterial) : Mesh
      {
         var _loc4_:Decal = null;
         _loc4_ = new Decal();
         var _loc5_:Number = 500 / 2;
         var _loc7_:Vertex = _loc4_.addVertex(-_loc5_,_loc5_,0.5,0,0);
         var _loc8_:Vertex = _loc4_.addVertex(-_loc5_,-_loc5_,0.5,0,1);
         var _loc9_:Vertex = _loc4_.addVertex(_loc5_,-_loc5_,0.5,1,1);
         var _loc10_:Vertex = _loc4_.addVertex(_loc5_,_loc5_,0.5,1,0);
         _loc4_.addQuadFace(_loc7_,_loc8_,_loc9_,_loc10_,param3);
         _loc4_.calculateFacesNormals();
         _loc4_.calculateVerticesNormals();
         _loc4_.x = param1.x;
         _loc4_.y = param1.y;
         _loc4_.z = param1.z + 5;
         _loc4_.rotationX = param2.x;
         _loc4_.rotationY = param2.y;
         _loc4_.rotationZ = param2.z;
         return _loc4_;
      }
      
      private static function method_856() : BitmapData
      {
         if(var_621 == null)
         {
            var_621 = new StubBitmapData(65280);
         }
         return var_621;
      }
      
      public function prepare() : void
      {
         this.var_620 = settings.showDropZones;
         this.var_622 = !this.var_620;
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.method_863);
         this.var_618 = new Dictionary();
      }
      
      private function method_863(param1:SettingsServiceEvent) : void
      {
         if(this.var_620 != settings.showDropZones)
         {
            this.method_865();
         }
      }
      
      public function destroy() : void
      {
         this.method_858();
      }
      
      private function method_858() : void
      {
         var _loc1_:name_1317 = null;
         for each(_loc1_ in this.var_618)
         {
            _loc1_.name_1327();
         }
         clearDictionary(this.var_618);
         this.var_618 = null;
      }
      
      private function method_859(param1:Vector3, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:TanksCollisionDetector = this.battlefield.var_117.name_247;
         if(_loc4_.raycast(param1,Vector3.DOWN,name_73.name_252,10000000000,null,const_372))
         {
            param2.vCopy(const_372.position);
            param3.vCopy(const_372.normal);
         }
         else
         {
            param2.vCopy(param1);
            param2.z -= 1000;
            param3.vCopy(Vector3.Z_AXIS);
         }
      }
      
      private function method_864(param1:Vector3) : Boolean
      {
         return param1.z > Math.cos(Math.PI / 180);
      }
      
      public function name_785(param1:name_695) : void
      {
         var _loc7_:Number = NaN;
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Mesh = null;
         var _loc5_:name_1317 = null;
         var _loc6_:Vector3 = null;
         if(!this.method_855(param1))
         {
            _loc2_ = new Vector3();
            _loc3_ = new Vector3();
            _loc6_ = new Vector3(param1.position.x,param1.position.y,param1.position.z);
            this.method_859(_loc6_,_loc2_,_loc3_);
            if(this.method_864(_loc3_))
            {
               _loc3_.reset();
            }
            else
            {
               _loc7_ = NaN;
               axis.vCross2(Vector3.Z_AXIS,_loc3_);
               axis.vNormalize();
               _loc7_ = Math.acos(_loc3_.z);
               m.name_1097(axis,_loc7_);
               m1.name_932(0,0,0);
               m1.append(m);
               m1.name_182(const_64);
               const_417.vTransformBy3(m);
               _loc3_.vCopy(const_64);
            }
            _loc4_ = method_857(_loc2_,_loc3_,this.getMaterial(param1.regionType));
            if(param1.regionType == "CRYSTAL_100")
            {
               _loc5_ = new name_1318(_loc4_,_loc2_);
               _loc5_.show();
            }
            else
            {
               _loc5_ = new name_1317(_loc4_,_loc2_,this.var_620);
            }
            _loc5_.name_1322();
            this.var_618[_loc6_.toString()] = _loc5_;
         }
      }
      
      public function name_728(param1:name_695) : void
      {
         var _loc2_:Vector3 = null;
         var _loc3_:name_1317 = null;
         if(this.method_855(param1))
         {
            _loc2_ = new Vector3(param1.position.x,param1.position.y,param1.position.z);
            _loc3_ = this.var_618[_loc2_.toString()];
            _loc3_.name_1324();
            delete this.var_618[_loc2_.toString()];
         }
      }
      
      public function method_866() : void
      {
         var _loc1_:name_1317 = null;
         if(this.var_620)
         {
            for each(_loc1_ in this.var_618)
            {
               _loc1_.name_1319();
            }
         }
      }
      
      private function getMaterial(param1:String) : TextureMaterial
      {
         var _loc2_:BitmapData = this.var_619[param1];
         if(_loc2_ == null)
         {
            _loc2_ = method_856();
         }
         return name_100(Main.osgi.name_6(name_100)).textureMaterialRegistry.getMaterial(name_1076.name_1079,_loc2_,2,false);
      }
      
      public function method_855(param1:name_695) : Boolean
      {
         var _loc2_:Vector3 = new Vector3(param1.position.x,param1.position.y,param1.position.z);
         return this.var_618[_loc2_.toString()] != undefined;
      }
      
      public function method_861() : void
      {
         var _loc1_:name_1317 = null;
         this.var_620 = true;
         this.var_622 = false;
         settings.showDropZones = true;
         for each(_loc1_ in this.var_618)
         {
            if(!(_loc1_ is name_1318))
            {
               _loc1_.name_1319();
            }
         }
      }
      
      public function method_860() : void
      {
         var _loc1_:name_1317 = null;
         this.var_622 = true;
         this.var_620 = false;
         settings.showDropZones = false;
         for each(_loc1_ in this.var_618)
         {
            if(!(_loc1_ is name_1318))
            {
               _loc1_.name_1329();
            }
         }
      }
      
      public function method_865() : void
      {
         if(this.var_620)
         {
            this.method_860();
         }
         else if(this.var_622)
         {
            this.method_861();
         }
      }
      
      private function method_862() : void
      {
         this.var_619["MEDKIT"] = BonusRegionTextures.name_1320;
         this.var_619["ARMORUP"] = BonusRegionTextures.name_1328;
         this.var_619["DAMAGEUP"] = BonusRegionTextures.name_1323;
         this.var_619["NITRO"] = BonusRegionTextures.name_1326;
         this.var_619["CRYSTAL"] = BonusRegionTextures.name_1321;
         this.var_619["CRYSTAL_100"] = BonusRegionTextures.name_1325;
      }
   }
}
