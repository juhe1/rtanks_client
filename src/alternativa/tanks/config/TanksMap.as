package alternativa.tanks.config
{
   import alternativa.engine3d.containers.KDContainer;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Occluder;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.physics.collision.name_774;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.name_83;
   import flash.events.Event;
   import package_1.Main;
   import package_249.name_1430;
   import package_416.MapLoader;
   import package_61.name_767;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class TanksMap extends ResourceLoader
   {
       
      
      public var name_1060:KDContainer;
      
      private var loader:MapLoader;
      
      public var map:MapResource;
      
      public function TanksMap(param1:name_669, param2:MapResource)
      {
         this.map = param2;
         super("Tank map loader",param1);
      }
      
      override public function run() : void
      {
         this.loader = new MapLoader();
         this.loader.addEventListener(Event.COMPLETE,this.onLoadingComplete);
         this.loader.load(this.map);
      }
      
      public function get var_302() : Vector.<name_774>
      {
         return this.loader.var_302;
      }
      
      public function name_737() : name_767
      {
         return this.loader.name_737();
      }
      
      private function onLoadingComplete(param1:Event) : void
      {
         var _loc2_:Sprite3D = null;
         this.loader.objects.push(new name_2311());
         this.name_1060 = this.method_2026(this.loader.objects,this.loader.occluders);
         this.name_1060.threshold = 0.1;
         this.name_1060.ignoreChildrenInCollider = true;
         var _loc3_:BattlefieldModel = BattlefieldModel(Main.osgi.name_6(name_83));
         this.name_1060.name = "Visual Kd-tree";
         for each(_loc2_ in this.loader.name_2312)
         {
            this.name_1060.addChild(_loc2_);
            _loc3_.hidableObjects.add(new name_1430(_loc2_));
         }
         this.name_1060.calculateBounds();
         _loc3_.build(this.name_1060,this.var_302,this.loader.lights);
         method_2025();
      }
      
      private function method_2026(param1:Vector.<Object3D>, param2:Vector.<Occluder>) : KDContainer
      {
         var _loc3_:KDContainer = new KDContainer();
         _loc3_.createTree(param1,param2);
         return _loc3_;
      }
      
      public function destroy() : *
      {
         this.loader.destroy();
         this.loader = null;
         this.name_1060.destroyTree();
         this.name_1060 = null;
      }
   }
}

import alternativa.engine3d.core.Object3D;

class SpawnMarkersData
{
    
   
   public var markers:Vector.<Object3D>;
   
   public function SpawnMarkersData()
   {
      super();
   }
}
