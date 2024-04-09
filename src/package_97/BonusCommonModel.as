package package_97
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.class_11;
   import alternativa.model.IModel;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.effects.common.class_103;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.services.materialregistry.IMaterialRegistry;
   import flash.display.BitmapData;
   import package_1.Main;
   import package_13.Long;
   import package_241.name_659;
   import package_372.BonusCommonModelBase;
   import package_372.class_104;
   import package_4.ClientObject;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class BonusCommonModel extends BonusCommonModelBase implements class_104, class_103, class_11
   {
      
      private static const const_1479:Number = 4;
      
      private static var var_58:IMaterialRegistry;
       
      
      public function BonusCommonModel()
      {
         super();
         _interfaces.push(IModel,class_104,class_103,class_11);
         var_58 = IMaterialRegistry(Main.osgi.getService(IMaterialRegistry));
      }
      
      public function initObject(param1:ClientObject, param2:String, param3:Long, param4:Long, param5:int, param6:Long, param7:Long) : void
      {
         if(param1.method_16(BonusCommonModel) != null)
         {
            return;
         }
         var _loc8_:name_1469 = new name_1469();
         _loc8_.name_1483 = this.method_1281(param3);
         _loc8_.name_1489 = this.method_1281(param7);
         _loc8_.name_1480 = this.method_1281(param6);
         _loc8_.name_1486 = var_58.textureMaterialRegistry.getMaterial(null,ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param4)).data,1);
         _loc8_.name_1486.resolution = 5;
         _loc8_.duration = param5 * 1000;
         var _loc9_:name_1790 = LightDataManager.name_1791(param2.split("_")[0]);
         if(_loc9_ != null)
         {
            _loc8_.lightColor = _loc9_.name_1789().name_1308();
            _loc8_.name_1475 = _loc9_.name_1789().name_1309();
            _loc8_.attenuationBegin = _loc9_.name_1314();
            _loc8_.attenuationEnd = _loc9_.name_1316();
         }
         param1.method_12(BonusCommonModel,_loc8_);
      }
      
      public function objectLoaded(param1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(param1:ClientObject) : void
      {
         var _loc2_:name_1469 = name_1469(param1.method_16(BonusCommonModel));
         ParaBonus.method_1023(_loc2_);
      }
      
      public function name_734(param1:ClientObject, param2:String, param3:int, param4:Boolean) : name_659
      {
         var _loc5_:name_1469 = name_1469(param1.method_16(BonusCommonModel));
         var _loc6_:ParaBonus = ParaBonus.create(_loc5_);
         _loc6_.init(param2,_loc5_.duration - param3,param4);
         return _loc6_;
      }
      
      private function method_1281(param1:Long) : Mesh
      {
         var _loc2_:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(param1));
         var _loc3_:Mesh = Mesh(_loc2_.objects[0]);
         var _loc4_:BitmapData = _loc2_.method_765(0);
         if(_loc4_ == null)
         {
            _loc4_ = new StubBitmapData(65280);
         }
         var _loc5_:Mesh = Mesh(_loc3_.clone());
         var _loc6_:TextureMaterial = var_58.textureMaterialRegistry.getMaterial(null,_loc4_,1);
         _loc6_.resolution = 1;
         _loc5_.setMaterialToAllFaces(_loc6_);
         return _loc5_;
      }
   }
}
